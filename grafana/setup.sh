#!/bin/bash

kubectl create -f deployment-grafana.yaml

kubectl create -f service-grafana.yaml
kubectl create -f ingress-grafana.yaml
