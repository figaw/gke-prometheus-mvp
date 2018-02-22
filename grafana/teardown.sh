#!/bin/bash

kubectl delete -f deployment-grafana.yaml

kubectl delete -f service-grafana.yaml
kubectl delete -f ingress-grafana.yaml
