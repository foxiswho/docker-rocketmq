




https://github.com/containous/traefik/tree/v1.7.12/examples/k8s/

wget https://raw.githubusercontent.com/containous/traefik/v1.7.12/examples/k8s/traefik-rbac.yaml -O traefik-rbac.yaml


wget https://raw.githubusercontent.com/containous/traefik/v1.7.12/examples/k8s/traefik-ds.yaml -O traefik-ds.yaml

c


# 创建   traefik rbac


kubectl apply -f traefik-rbac.yaml

kubectl get clusterrole



# 部署 traefik

kubectl apply -f traefik-ds.yaml

kubectl get svc -n kube-system

kubectl get pods -n kube-system -o wide


如果你想只部署在 master 节点，其他节点不部署，请把 traefik-ds.yaml 替换为 traefik-ds-master.yaml



# 访问UI 界面

http://192.168.0.254:8080