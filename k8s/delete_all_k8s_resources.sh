 alias k='kubectl'
 k delete deployment.apps/mysql

 k delete deployment.apps/two-tier-app
 k delete deployment.apps/mysql
 k delete service/mysql-svc service/two-tier-app-svc
 k delete cm mysql-config
 k delete secret mysql-secret
 k delete persistentvolume/mysql-pv
 k delete persistentvolumeclaim/mysql-pvc
 k delete ingress two-tier-app-ingress
