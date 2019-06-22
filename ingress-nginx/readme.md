





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


# https 证书配置 
当前 目录下有 xxxx 域名证书   www.foxwho.com.crt www.foxwho.com.key

```bash
kubectl create secret tls nginx-ingress-secret \
--cert=www.foxwho.com.crt --key=www.foxwho.com.key 

```
## 重新编辑 test-ingress.yml文件

```xml

---
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
#  namespace: default
  name: test-ingress
  annotations:
    kubernetes.io/ingress.class: "nginx"
spec:
  tls:
  - hosts:
        - www.foxwho.com
        secretName: nginx-ingress-secret
  rules:
  - host: test.nginx.ingress
    http:
      paths:
        - path: /
          backend:
            serviceName: test-nginx
            servicePort: 80
  - host: www.foxwho.com
    http:
        paths:
          - path: /
            backend:
              serviceName: test-nginx
              servicePort: 80


---
apiVersion: v1
kind: Service
metadata:
  name: test-ingress
spec:
  type: NodePort
  ports:
    - name: http
      port: 80
      targetPort: 80
      nodePort: 80
      protocol: TCP
    - name: https
      port: 443
      targetPort: 443
      nodePort: 443
      protocol: TCP
  selector:
    app: test-nginx
```