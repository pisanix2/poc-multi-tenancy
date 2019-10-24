cat << EOF 
apiVersion: v1
kind: Namespace
metadata:
  name: $TENANCY
EOF

# TENANCY=teste-ten bash namespace.sh > teste-ten.yml
