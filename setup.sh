#!/bin/bash
kubectl create -f rbac/service-account-prometheus.yaml
kubectl create -f rbac/clusterrole-prometheus.yaml
kubectl create -f rbac/clusterrolebinding-prometheus.yaml

kubectl create -f configmap-prometheus.yaml
kubectl create -f deployment-prometheus.yaml
kubectl create -f service-prometheus.yaml
kubectl create -f ingress-prometheus.yaml
