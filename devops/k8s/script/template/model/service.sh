cat << EOF 
apiVersion: v1
kind: Service
metadata:
  name: sample-api
  namespace: $TENANCY
spec:
  selector:
    app: sample-api
  ports:
    - name: web
      port: $PORT
      targetPort: $PORT
EOF

# TENANCY=tenancy-one PORT=80 bash service.sh > ./tenancy-one/service.yml