# vpc variables 

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDRs for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDRs for private subnets"
  type        = list(string)
}

## rds variables
#
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}


variable "rds_instance_type" {
  description = "RDS instance type"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_username" {
  description = "Database master username"
  type        = string
}

variable "db_password" {
  description = "Database master password"
  type        = string
  sensitive   = true
}

## ecs variables

variable "ecs_task_cpu" {
  default     = "512"
  description = "CPU units for ECS task"
}
#
variable "ecs_task_memory" {
  default     = "1024"
  description = "Memory for ECS task in MB"
}
#
variable "ecs_task_exec_role_arn" {
  description = "ECS task execution role ARN"
  type        = string
}

variable "ecs_task_role_arn" {
  description = "ECS task role ARN"
  type        = string
}
#

variable "database_url" {
  description = "PostgreSQL connection URL"
  type        = string
  sensitive   = true
}

variable "redis_url" {
  description = "Redis connection URL"
  type        = string
  sensitive   = true
}

##  elastic-cache variables

variable "redis_node_type" {
  description = "Node type for Redis"
  type        = string
}

## wkt ecr is a registry 



variable "public_subnet_ids" {
  description = "List of public subnet IDs for ALB and NAT Gateway"
  type        = list(string)
}

variable "medusa_server_image" {
  description = "Docker image URI for Medusa"
  type        = string
}

# alb variables 
variable "alb_security_group_id" {
  description = "Security group ID for ALB"
  type        = string
}
