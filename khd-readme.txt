kubectl create secret generic pgpassword --from-literal PGPASSWORD=khd123456

kubectl create secret docker-registry khd-registry-secret --docker-server=https://index.docker.io/v1/ --docker-username={} --docker-password='{}' --docker-email={}


Helm & tiller
------------

kubectl create serviceaccount --namespace kube-system tiller

kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller

helm init --service-account tiller --upgrade
