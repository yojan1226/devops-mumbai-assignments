# first we have to create a namespace
kubectl apply -f /c/devops/devmumbai/kubernetes/DM-yaml-practice/k8-python-sql-assignment/k8-manifest/namespace.yaml

sleep 5

if kubectl get namespace python-sql-demo >/dev/null 2>&1; then
  echo "python-sql-demo created successfully"
else
  echo "namespace doesn't exist"
  exit 1
fi

kubectl get namespaces

sleep 5

#Next we have to create secrets for sensitive data
kubectl apply -f /c/devops/devmumbai/kubernetes/DM-yaml-practice/k8-python-sql-assignment/k8-manifest/secrets.yaml

sleep 5

if kubectl get secrets mysql-secret -n python-sql-demo >/dev/null 2>&1; then
  echo "mysql-secret created"
else
  echo "secret doesn't created"
  exit 1
fi

kubectl get secrets -n python-sql-demo

sleep 5

#Next we have to create configmap for non-sensitive data
kubectl apply -f /c/devops/devmumbai/kubernetes/DM-yaml-practice/k8-python-sql-assignment/k8-manifest/configmap.yaml

sleep 5

if kubectl get configmap mysql-config -n python-sql-demo >/dev/null 2>&1; then
  echo "mysql-config created"
else
  echo "mysql-config doesn't created"
  exit 1
fi

kubectl get configmap -n python-sql-demo

sleep 5

#Next we have to create mysql-init-configmap
kubectl apply -f /c/devops/devmumbai/kubernetes/DM-yaml-practice/k8-python-sql-assignment/k8-manifest/mysql-init-configmap.yaml

sleep 5

if kubectl get configmap mysql-initdb-config -n python-sql-demo >/dev/null 2>&1; then
  echo "mysql-initdb-config created"
else
  echo "mysql-initdb-config doesn't created"
  exit 1
fi

kubectl get configmap -n python-sql-demo

sleep 5

#Next we have to create persistent-volume for mysql-db
kubectl apply -f /c/devops/devmumbai/kubernetes/DM-yaml-practice/k8-python-sql-assignment/k8-manifest/pv-pvc.yaml

sleep 5

if kubectl get pvc pvc-mysql -n python-sql-demo >/dev/null 2>&1; then
  echo "persistent-volume-claim created"
else
  echo "pvc doesn't created"
  exit 1
fi

kubectl get pvc -n python-sql-demo

sleep 5

#Now we have to deploy mysql-deployment.yaml file
kubectl apply -f /c/devops/devmumbai/kubernetes/DM-yaml-practice/k8-python-sql-assignment/k8-manifest/mysql-deployment.yaml

sleep 5

if kubectl get deployment mysql-db -n python-sql-demo >/dev/null 2>&1; then
  echo "mysql-db and mysql-service created"
else
  echo "mysql-db doesn't created"
  exit 1
fi

kubectl get deployment -n python-sql-demo

sleep 5

#Now we have to deploy python-app-deployment.yaml
kubectl apply -f /c/devops/devmumbai/kubernetes/DM-yaml-practice/k8-python-sql-assignment/k8-manifest/python-deployment.yaml

sleep 5

if kubectl get deployment python-app -n python-sql-demo >/dev/null 2>&1; then
  echo "python-app and python-app-service created"
else
  echo "python-app & svc doesn't created"
  exit 1
fi

kubectl get deployment -n python-sql-demo


