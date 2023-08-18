# Build the images
docker-build -t ashishdlearn/multi-client:latest -t ashishdlearn/multi-client:$SHA -f ./client/Dockerfile ./client
docker-build -t ashishdlearn/multi-server:latest -t ashishdlearn/multi-server:$SHA -f ./server/Dockerfile ./server
docker-build -t ashishdlearn/multi-worker:latest -t ashishdlearn/multi-worker:$SHA -f ./worker/Dockerfile ./worker

# Already logged into docker in travis
docker push ashishdlearn/multi-client:latest
docker push ashishdlearn/multi-server:latest
docker push ashishdlearn/multi-worker:latest

docker push ashishdlearn/multi-client:$SHA
docker push ashishdlearn/multi-server:$SHA
docker push ashishdlearn/multi-worker:$SHA

# Apply all configs to k8s folder
kubectl apply -f k8s

# Imperatively set latest images for deployment
kubectl set image deployments/server-deployment server=ashishdlearn/multi-server:$SHA
kubectl set image deployments/client-deployment client=ashishdlearn/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=ashishdlearn/multi-worker:$SHA
