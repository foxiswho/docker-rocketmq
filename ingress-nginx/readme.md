





官方
https://github.com/kubernetes/ingress-nginx/blob/nginx-0.24.1/deploy/mandatory.yaml


版本： 0.24.1

```bash

kubectl create -f mandatory.yml

```

查看
```bash
kubectl get pods --namespace=ingress-nginx  --watch

或

kubectl get pods --namespace=ingress-nginx

```



# 测试

```bash

kubectl create -f test-nginx.yml

kubectl create -f test-ingress.yml
```
查看
```bash

kubectl get ingress
```


在 `192.168.0.254` 服务器中 设置 hosts
```bash
echo "192.168.0.254 test.nginx.ingress " >> /etc/hosts
```

在 `192.168.0.254` 测试使用
curl http://test.nginx.ingress

在本机使用
```bash
curl -v http://192.168.0.254 -H 'host: test.nginx.ingress'
```
