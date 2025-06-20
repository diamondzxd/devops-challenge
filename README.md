# SimpleTimeService Project

An HTTP API built on Docker, and deployed to AWS ECR as container.

## Directory structure

```
.
├── app <-- app files/directories and Dockerfile
├── terraform <-- Terraform files/directories (i.e. we will run `terraform plan`/`terraform apply` from here)
└── images <-- photos for examples
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
docker build -t simple-time-service .
docker tag simple-time-service:latest public.ecr.aws/o4r1o6a5/simple-time-service:latest
docker push public.ecr.aws/o4r1o6a5/simple-time-service:latest
```

The new image will be available at https://gallery.ecr.aws/o4r1o6a5/simple-time-service

## Deploying to AWS via Terraform

- Terraform can be installed through the steps on their documentation https://developer.hashicorp.com/terraform/install.
- Make sure AWS CLI is installed and authenticated through `aws configure`.

### Configuring terraform and installing any packages

```bash
terraform init
```

Before deployment, override any defaults in the `terraform.tfvars` file.

### Planning for deployment

```bash
terraform plan
```

### Deployment using Terraform

```bash
terraform deploy
```

You will get the outputs of the deployed artifacts as mentioned in the `outputs.tf` file.


### Checking the deployment

After running the above commands, the output will show the DNS name like this `alb_dns_name = "simpletime-alb-xxxx.elb.amazonaws.com"`. Access that URL in the browser or console.

```bash
curl http://<load_balancer_dns>/
```

### Result

![Terraform Apply](https://raw.githubusercontent.com/diamondzxd/devops-challenge/refs/heads/main/images/terraform_apply.png)

![Browser](https://raw.githubusercontent.com/diamondzxd/devops-challenge/refs/heads/main/images/browser.png)