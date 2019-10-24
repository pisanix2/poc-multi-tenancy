cat << EOF 
apiVersion: apps/v1 
kind: Deployment
metadata:
  name: sample-api
  namespace: $TENANCY
spec:
  selector:
    matchLabels:
      app: sample-api
  replicas: 1
  template:
    metadata:
      labels:
        app: sample-api
    spec:
      containers:
      - name: sample-api
        image: pisanix/sample-api:latest
        env:
          - name: TENANCY
            value: "$TENANCY"
          - name: PORT
            valueFrom:
              configMapKeyRef:
                name: api-configmap
                key: PORT
          - name: LAUNCHER_NAME
            valueFrom:
              configMapKeyRef:
                name: api-configmap
                key: LAUNCHER_NAME
          - name: DATABASE_USER
            valueFrom:
              configMapKeyRef:
                name: api-configmap
                key: DATABASE_USER
          - name: DATABASE_PASSWORD
            valueFrom:
              configMapKeyRef:
                name: api-configmap
                key: DATABASE_PASSWORD
          - name: DATABASE_NAME
            valueFrom:
              configMapKeyRef:
                name: api-configmap
                key: DATABASE_NAME
          - name: DATABASE_HOST
            valueFrom:
              configMapKeyRef:
                name: api-configmap
                key: DATABASE_HOST
          - name: DATABASE_PORT
            valueFrom:
              configMapKeyRef:
                name: api-configmap
                key: DATABASE_PORT
        ports:
        - containerPort: $PORT
EOF

# TENANCY=tenancy-one PORT=80 bash deployment.sh > ./tenancy-one/deployment.yml