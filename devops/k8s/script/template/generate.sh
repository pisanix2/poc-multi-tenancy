# call: bash generate.sh tenancy-one 80

declare tenancy=$1
declare port=$2

mkdir ./generated/$tenancy

TENANCY=$tenancy bash ./model/namespace.sh > ./generated/$tenancy/namespace.yml
TENANCY=$tenancy bash ./model/ingress.sh > ./generated/$tenancy/ingress.yml
TENANCY=$tenancy PORT=$port bash ./model/service.sh > ./generated/$tenancy/service.yml
TENANCY=$tenancy PORT=$port bash ./model/deployment.sh > ./generated/$tenancy/deployment.yml

echo 'pronto!'