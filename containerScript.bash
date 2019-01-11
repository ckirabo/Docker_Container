#!/bin/bash
#clareDocker
#jenkins
#to go from jenkins to clare docker exit 
#to traverse from clareDocker to jenkins docker exec -it jenkins bash
#install docker git, create group user
#docker run -d -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock --name jenkins bobcrutchley/jenkins:latest
#install maven in the container.

mvn clean install
sudo docker build -t spring-boot-hello-world:latest .
sudo docker ps

#remove dangling images
if sudo docker images | grep '<none>'; then 
sudo docker rmi $(docker images -q -f dangling=true)
fi

#remove old container
if sudo docker ps -a | grep spring-boot-hello-world; then 
sudo docker stop spring-boot-hello-world
sudo docker rm spring-boot-hello-world
fi

#run new container 
sudo docker run -d -p 9000:9000 --name spring-boot-hello-world spring-boot-hello-world
