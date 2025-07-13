# vpc variable-values
aws_region           = "us-east-2"
vpc_cidr             = "10.20.0.0/16"
public_subnet_cidrs  = ["10.20.1.0/24", "10.20.2.0/24"]
private_subnet_cidrs = ["10.20.11.0/24", "10.20.12.0/24"]
vpc_id               = "vpc-0453d9cf0bdf103da"
private_subnet_ids   = ["subnet-0c788ef351f2c5a77", "subnet-04748c126fedc60e9"]
public_subnet_ids    = ["subnet-03d8686ba1ac886a0", "subnet-0ab7bf40525c0c4b3"]
## rds variable-values
rds_instance_type = "db.t3.micro"
db_name           = "medusadb"
db_username       = "medusauser"
db_password       = "medusasecret123"
## ec variable-values
ecs_task_cpu           = "512"
ecs_task_memory        = "1024"
ecs_task_exec_role_arn = "arn:aws:iam::920373002632:role/ecsTaskExecutionRole"
ecs_task_role_arn      = "arn:aws:iam::920373002632:role/ecsTaskRole"
medusa_server_image    = "920373002632.dkr.ecr.us-east-2.amazonaws.com/medusa-image"
database_url           = "database_url = postgresql://medusa:mysecurepass@mydb.abcdefgh.us-east-1.rds.amazonaws.com:5432/medusa"
redis_url              = "redis://localhost:6379"
##  elastic-cache variable-values
redis_node_type = "cache.t3.micro"
# alb sg-id
alb_security_group_id = "sg-07760f97655a3e286"


