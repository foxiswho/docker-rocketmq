
docker 自定义 镜像仓库

官方

https://hub.docker.com/_/registry/

https://github.com/docker/distribution-library-image/blob/master/Dockerfile.noarch


# 创建仓库
刚开始时，仓库的都是空的。

所以要先创建仓库

假设要创建 仓库 ubuntu
```base
docker tag ubuntu 192.168.0.254:5000/ubuntu
```
```base
docker tag ubuntu 192.168.0.254:5000/ubuntu
```


# 查看镜像

http://192.168.0.254:5000/v2/_catalog

# 查看镜像标签

http://192.168.0.254:5000/v2/xxxx/tags/list

# 简单管理界面

http://192.168.0.254:5010

#FAQ

Get https://192.168.0.254:5000/v2/: http: server gave HTTP response to HTTPS client

配置 本地 docker （Linux） 在配置文件中`/etc/docker/daemon.json`增加
```json
{ 
    "insecure-registries":["192.168.0.254:5000"] 
}
```


如果是  window / mac 

在 Docker Desktop    的 Daemon 选项卡 中 `insecure registries` 区域增加
```bash
192.168.0.254:5000
```