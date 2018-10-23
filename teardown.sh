#!/bin/bash
kubectl delete -f rbac/service-account-prometheus.yaml
kubectl delete -f rbac/clusterrole-prometheus.yaml
kubectl delete -f rbac/clusterrolebinding-prometheus.yaml

kubectl delete -f node-exporter/daemonset-node-exporter.yaml

kubectl delete -f prometheus/configmap-prometheus.yaml
#kubectl delete -f prometheus/deployment-prometheus.yaml
kubectl delete -f prometheus/pv-deployment-prometheus.yaml

kubectl delete -f networking/service-prometheus.yaml
kubectl delete -f networking/ingress-prometheus.yaml

kubectl delete -f grafana/deployment-grafana.yaml
kubectl delete -f grafana/service-grafana.yaml
kubectl delete -f grafana/ingress-grafana.yaml
