cat << EOF 
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: sample-api
  namespace: $TENANCY
  annotations:
    kubernetes.io/ingress.class: traefik
spec:
  rules:
  - host: $TENANCY.local.minikube
    http:
      paths:
      - backend:
          serviceName: sample-api
          servicePort: 80
EOF

# TENANCY=tenancy-one bash ingress.sh > ./tenancy-one/ingress.yml