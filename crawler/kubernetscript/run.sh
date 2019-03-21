mvn clean compile package

//remove unnecessary Images
docker system prune -a

docker build -t sagarg1990/crawler:$1 .

docker push sagarg1990/crawler:$1

kubectl delete deployment crawler

kubectl run crawler --image=sagarg1990/crawler:$2 --port 8080


kubectl expose deployment crawler  --type=LoadBalancer --port 80 --target-port 8080

kubectl get service
