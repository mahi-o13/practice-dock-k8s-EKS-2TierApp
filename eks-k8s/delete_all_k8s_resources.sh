#!/bin/bash

set -e

echo "===================================================="
echo " Deleting Application Resources"
echo "===================================================="

# Ingress
kubectl delete ingress two-tier-app-ingress --ignore-not-found=true

# Application Service & Deployment
kubectl delete service two-tier-app-svc --ignore-not-found=true
kubectl delete deployment two-tier-app --ignore-not-found=true

# MySQL Service & Deployment
kubectl delete service mysql-svc --ignore-not-found=true
kubectl delete deployment mysql --ignore-not-found=true

echo ""
echo "===================================================="
echo " Deleting Configuration Resources"
echo "===================================================="

kubectl delete configmap mysql-config --ignore-not-found=true
kubectl delete secret mysql-secret --ignore-not-found=true

echo ""
echo "===================================================="
echo " Deleting Storage Resources"
echo "===================================================="

kubectl delete pvc mysql-pvc --ignore-not-found=true
kubectl delete pv mysql-pv --ignore-not-found=true

echo ""
echo "===================================================="
echo " Deleting Storage Resources"
echo "===================================================="
kubectl delete hpa two-tier-app-hpa --ignore-not-found=true
echo ""

echo ""
echo "===================================================="
echo " Waiting for Cleanup"
echo "===================================================="

sleep 5

echo ""
echo "===================================================="
echo " Remaining Resources"
echo "===================================================="

echo ""
echo "Pods:"
kubectl get pods

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
echo "PVC/PV:"
kubectl get pvc,pv

echo ""
echo "Horizontal Pod Autoscelar"
kubectl get hpa

echo ""
echo "===================================================="
echo " Cleanup Completed"
echo "===================================================="
