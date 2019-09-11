#!/bin/bash
# Startup script for the logstash
# chkconfig: - 85 15
# description: logstash
# processname: logstash
#PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
NAME=logstash
NAME_CONF=goods
DESC="logstash-$NAME_CONF daemon"
IN_DIR=$(pwd)
DAEMON_PATH=$IN_DIR/logstash-5.6.1
DAEMON=$DAEMON_PATH/bin/$NAME
CONF=$DAEMON_PATH/etc/$NAME_CONF.conf
CONF_DATA=$DAEMON_PATH/data/$NAME_CONF
PID_FILE=$DAEMON_PATH/data/$NAME_CONF.pid
SCRIPT_NAME=$DAEMON_PATH/sbin/$NAME_CONF
CONF_LOG=$DAEMON_PATH/logs/$NAME_CONF.log
#
INDEX_NAME=goods_all
HOST_URL=elastic:BqaFvDD69Yll8OCO0Oo@localhost:9200/$INDEX_NAME

set -e
[ -x "$DAEMON" ] || exit 0

do_start() {
 cd $DAEMON_PATH
 mkdir -p $CONF_DATA
 mkdir -p $DAEMON_PATH/logs
 nohup $DAEMON -f $CONF --path.data=$CONF_DATA >> $CONF_LOG 2>&1 &
}

do_stop() {
    ps -ef |grep /$NAME_CONF|awk '{print $2}'|xargs kill -9
}

do_reload() {
    ps -ef |grep /$NAME_CONF|awk '{print $2}'|xargs kill -HUP
}

do_delete(){
    echo "DELETE "$NAME_CONF
    curl -XDELETE 'http://'$HOST_URL
    echo "\n"
}

do_create(){
    echo "Create "$NAME_CONF
   . "${DAEMON_PATH}/sbin/${NAME_CONF}_create.sh"
   echo "\n"
   rm -rf $CONF_DATA
   rm -rf $DAEMON_PATH/etc/goods_all_last_time.txt
}

case "$1" in
 start)
 echo -n "Starting $DESC: $NAME"
 do_start
 echo "."
 ;;
 stop)
 echo -n "Stopping $DESC: $NAME"
 do_stop
 echo "."
 ;;
 reload|graceful)
 echo -n "Reloading $DESC configuration..."
 do_reload
 echo "."
 ;;
 restart)
 echo -n "Restarting $DESC: $NAME"
 do_stop
 do_start
 echo "."
 ;;
 status)
	if [ -f $PID_FILE ]; then
		echo "$NAME is runing!"
    else
		echo "$NAME is stop!"
    fi
 ;;
  create)
 	do_delete
 	do_create
  ;;
 test)
 	$DAEMON -f $CONF -t
  ;;
 *)
 echo "Usage: $SCRIPT_NAME {start|stop|reload|restart|status|test|create} " >&2
 exit 3
 ;;
esac

exit 0
