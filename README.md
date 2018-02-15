# An MVP for running Prometheus in GKE

Kubernetes in Google Kubernetes Engine, running Prometheus 2.1.0, scraping Kubernetes and itself.

Inspired heavily by https://coreos.com/blog/monitoring-kubernetes-with-prometheus.html from August 03, 2016.

## Requirements

`kubectl`, `gcloud` and (of course..) [rights to create the RBAC resources in the GKE cluster](https://coreos.com/operators/prometheus/docs/latest/troubleshooting.html)

## Setup (minimal instructions)

1. Have access to a GKE cluster with `kubectl`
2. Run `setup.sh`
3. ???
4. Profit!

## Setup (detailed instructions)

1. Create a cluster on GKE
```
$ gcloud container clusters create my-prometheus-cluster
```

2. Create the `RBAC` resources from the `rbac/` folder

```
$ kubectl create -f rbac/service-account-prometheus.yaml
$ kubectl create -f rbac/clusterrole-prometheus.yaml
$ kubectl create -f rbac/clusterrolebinding-prometheus.yaml
```

3. Create the `configmap` that we're going to mount into the Prometheus `deployment`
```
$ kubectl create -f configmap-prometheus.yaml
```

4. Create the Prometheus `deployment`
```
$ kubectl create -f deployment-prometheus.yaml
```

5. Create the Prometheus Service, exposing the deployment as a `NodePort` since GKE ingress' require this
```
$ kubectl create -f service-prometheus.yaml
```

6. Create the `ingress` loadbalancer
```
$ kubectl create -f ingress-prometheus.yaml
```

7. Plenty of patience and Bob's your uncle

_Use the following command to find the address Prometheus is being served on,_
```
$ kubectl get ingress prometheus-ingress
```

# Infrequently Asked Questions:

## Q: Why?!
A: Because I wanted to run _something_ in kubernetes, and Prometheus seemed like a great idea, because it'd allow me to visualize stuff running in my cluster!

## Q: Why are you exposing Prometheus to the world?!
A: .. Well it's not ideal. But I got to set up a loadbalancer for _something_ running in Kubernetes, and expose it to the world, and now I can quickly see what's happening in my demo cluster. I mean, set up some firewall rules and you're (sort of) golden!
