kubectl create secret generic pgpassword --from-literal PGPASSWORD=khd123456

kubectl create secret docker-registry khd-registry-secret --docker-server=https://index.docker.io/v1/ --docker-username={} --docker-password='{}' --docker-email={}