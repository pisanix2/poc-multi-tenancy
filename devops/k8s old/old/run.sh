#!/usr/bin/env bash
eval $(minikube docker-env)
kubectl apply -f namespace.yml
curl $(minikube service sample-api-service --url)
