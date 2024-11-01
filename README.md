# Dockerize MySQL on AWS-ECS

A project to deploy MySQL Server via AWS ECS.

- [Dockerize MySQL on AWS-ECS](#dockerize-mysql-on-aws-ecs)
  - [Local Dockerize MySQL Server](#local-dockerize-mysql-server)
  - [Push to AWS ECR](#push-to-aws-ecr)
  - [Create Cluster](#create-cluster)
  - [Issues](#issues)

---

## Local Dockerize MySQL Server

- Build Image

```sh
# build image
# -t: Name and optionally a tag in the name:tag format
docker build -t mysqldb .

# list all images
docker images

# remove image
docker rmi mysqldb
```

- Create Container

```sh
# -t: run at the bg
# -v: using volume to persist data
docker container run -itd -p 3310:3306 -v ./mysql_data:/var/lib/mysql --name mysqldb_con mysqldb
docker container run -itd -v ./mysql_data:/var/lib/mysql --name mysqldb_con mysqldb
docker container rm -f mysqldb_con
```

---

## Push to AWS ECR

```sh
aws ecr get-login-password --region us-east-1 |  docker login --username AWS --password-stdin 099139718958.dkr.ecr.us-east-1.amazonaws.com

# create repo
# aws ecr describe-repositories
# aws ecr delete-repository --force --repository-name docker/mysqldb

aws ecr create-repository --repository-name mysqldb
aws ecr describe-repositories

# Build your Docker image
docker build -t mysqldb .

# tag
docker tag mysqldb:latest 099139718958.dkr.ecr.us-east-1.amazonaws.com/mysqldb:latest

# push this image to newly created AWS repository
docker push 099139718958.dkr.ecr.us-east-1.amazonaws.com/mysqldb:latest
```

---

## Create Cluster

```sh
aws cloudformation create-stack --stack-name ecs-mysql-server-cluster-fargate --capabilities CAPABILITY_IAM --template-body file://./ecs-mysql-server-cluster-fargate.yml

aws cloudformation delete-stack --stack-name ecs-mysql-server-cluster-fargate
```

---

## Issues

- Need a solutiont to persist data.
