#!/bin/bash

set -e

echo "========================================="
echo " Installing eksctl"
echo "========================================="

curl --silent --location \
"https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" \
| tar xz -C /tmp

mv /tmp/eksctl /usr/local/bin

echo "========================================="
echo " Installing AWS CLI v2"
echo "========================================="

apt update -y
apt install -y unzip curl

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" \
-o "awscliv2.zip"

unzip -o awscliv2.zip

./aws/install --update

echo "========================================="
echo " Verification"
echo "========================================="

aws --version
eksctl version

echo ""
echo "========================================="
echo " AWS Identity Check"
echo "========================================="

aws sts get-caller-identity || echo "AWS credentials not configured yet"

echo ""
echo "Done"
