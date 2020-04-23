docker build -t khoad/multi-client:latest -t khoad/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t khoad/multi-server:latest -t khoad/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t khoad/multi-worker:latest -t khoad/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push khoad/multi-client:latest
docker push khoad/multi-server:latest
docker push khoad/multi-worker:latest

docker push khoad/multi-client:$SHA
docker push khoad/multi-server:$SHA
docker push khoad/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=khoad/multi-server:$SHA
kubectl set image deployments/client-deployment client=khoad/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=khoad/multi-worker:$SHA