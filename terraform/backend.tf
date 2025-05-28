terraform {
  backend "s3" {
    bucket         = "simple-time-service-states" # Replace with your S3 bucket name
    key            = "ecs-app/terraform.tfstate"  # State file path in S3
    region         = "ap-south-1"                 # AWS region
    dynamodb_table = "terraform-locks"            # DynamoDB table for locking
    encrypt        = true
  }
}
