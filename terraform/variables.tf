variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Name prefix for all resources"
  type        = string
  default     = "simpletime"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "container_image" {
  description = "Docker image to run in ECS"
  type        = string
}

variable "container_port" {
  description = "Port the container exposes"
  type        = number
  default     = 8080
}

variable "container_cpu" {
  description = "CPU units for the ECS task"
  type        = number
  default     = 256
}
variable "container_memory" {
  description = "Memory in MiB for the ECS task"
  type        = number
  default     = 512
}
