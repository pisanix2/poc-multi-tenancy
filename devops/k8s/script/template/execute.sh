# call: bash execute.sh tenancy-one

declare tenancy=$1
declare port=$2

kubectl apply -f ./generated/$tenancy/namespace.yml
kubectl -n $tenancy create configmap api-configmap --from-env-file=../../../../.env_k8s
kubectl apply -f ./generated/$tenancy/.

echo 'pronto!'