#!/bin/bash
kubectl create -f rbac/service-account-prometheus.yaml
kubectl create -f rbac/clusterrole-prometheus.yaml
kubectl create -f rbac/clusterrolebinding-prometheus.yaml

kubectl create -f node-exporter/daemonset-node-exporter.yaml

kubectl create -f prometheus/configmap-prometheus.yaml
kubectl create -f prometheus/deployment-prometheus.yaml

kubectl create -f networking/service-prometheus.yaml
kubectl create -f networking/ingress-prometheus.yaml

kubectl create -f grafana/deployment-grafana.yaml
kubectl create -f grafana/service-grafana.yaml
kubectl create -f grafana/ingress-grafana.yaml
