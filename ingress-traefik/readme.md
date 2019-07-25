




https://github.com/containous/traefik/tree/v1.7.12/examples/k8s/

wget https://raw.githubusercontent.com/containous/traefik/v1.7.12/examples/k8s/traefik-rbac.yaml -O traefik-rbac.yaml


wget https://raw.githubusercontent.com/containous/traefik/v1.7.12/examples/k8s/traefik-ds.yaml -O traefik-ds.yaml

c


# 创建   traefik rbac


kubectl apply -f traefik-rbac.yml

kubectl get clusterrole



# 部署 traefik

kubectl apply -f traefik-sa.yml

kubectl apply -f traefik-ds-service.yml

kubectl apply -f traefik-ds.yml

kubectl apply -f test-nginx.yml

kubectl apply -f ingress.yml
kubectl apply -f ingress-service.yml




kubectl get svc -n kube-system

kubectl get pods -n kube-system -o wide


如果你想只部署在 master 节点，其他节点不部署，请把 traefik-ds.yml 替换为 traefik-ds-master.yml



# 访问UI 界面

在本机 设置 host
```shell
echo "192.168.0.254 ui.traefik.foxwho.com"
```

在本机使用 浏览器访问
```bash
http://ui.traefik.foxwho.com
```
# 访问 nginx 案例页面

在本机使用
```bash
curl -v http://192.168.0.254 -H 'host: nginx.foxwho.com'
```

在 `192.168.0.254` 服务器中 设置 hosts
```bash
echo "192.168.0.254 nginx.foxwho.com " >> /etc/hosts
```
然后curl访问

```bash
curl http://nginx.foxwho.com
```