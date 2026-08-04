#!/bin/bash

set -e

echo "===================================================="
echo " Installing K3s"
echo "===================================================="

curl -sfL https://get.k3s.io | sh -

echo ""
echo "===================================================="
echo " Verifying K3s Cluster"
echo "===================================================="

kubectl get nodes

echo ""
echo "===================================================="
echo " Deploying Kubernetes Resources"
echo "===================================================="

kubectl apply -f .

echo ""
echo "===================================================="
echo " Waiting for Deployments"
echo "===================================================="

kubectl rollout status deployment/mysql
kubectl rollout status deployment/two-tier-app

echo ""
echo "===================================================="
echo " Current Kubernetes Resources"
echo "===================================================="

echo ""
echo "Pods:"
kubectl get pods -o wide

echo ""
echo "Services:"
kubectl get svc

echo ""
echo "Ingress:"
kubectl get ingress

echo ""
echo "ConfigMaps:"
kubectl get configmap

echo ""
echo "Secrets:"
kubectl get secret

echo ""
echo "PVC/PV:"
kubectl get pvc,pv

echo ""
echo "Horizontal Pod Autoscelar"
kubectl get hpa

echo ""
echo "===================================================="
echo " Deployment Completed Successfully"
echo "===================================================="

echo ""
echo "Application Service:"
kubectl get svc two-tier-app-svc

echo ""
echo "Application Endpoint:"
PUBLIC_IP=$(curl -s ifconfig.me)

echo "Public IP : $PUBLIC_IP"
echo "Ingress   : http://two-tier-app.local"
