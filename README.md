# SimpleTimeService Project

An HTTP API built on Docker, and deployed to AWS ECR as container.

## Directory structure

```
.
├── app <-- app files/directories and Dockerfile
└── terraform <-- Terraform files/directories (i.e. we will run `terraform plan`/`terraform apply` from here)
```

### Make sure Docker is installed
https://docs.docker.com/engine/install/

## How to build the Docker Image on your own machine

```bash
git clone https://github.com/diamondzxd/devops-challenge
cd app
docker build -t simple-time-service .
```

## Running the container on your own machine

```bash
docker run --rm -p 8080:8080 simple-time-service:latest
```

(adding --rm flag deletes the container on exit)

Open https://localhost:8080 to test the service

## Building and Publishing the container to Public ECR

Before publishing to ECR, make sure the AWS CLI v2 is installed on your machine and the credentials are added using `aws configure`. Read more at https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

```bash
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/o4r1o6a5
docker build -t devops-challenge .
docker tag devops-challenge:latest public.ecr.aws/o4r1o6a5/simple-time-service:latest
docker push public.ecr.aws/o4r1o6a5/simple-time-service:latest
```

The new image will be available at https://gallery.ecr.aws/o4r1o6a5/simple-time-service

## Deploying to AWS via Terraform

- Terraform can be installed through the steps on their documentation https://developer.hashicorp.com/terraform/install.
- Make sure AWS CLI is installed and authenticated through `aws configure`.

