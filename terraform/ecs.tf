# terraform/ecs.tf

resource "aws_security_group" "ecs_tasks" {
  name        = "medusa-ecs-tasks-sg"
  description = "Allow ECS tasks to communicate"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "medusa-ecs-tasks-sg"
  }
}

resource "aws_ecs_cluster" "medusa" {
  name = "medusa-cluster"
}

resource "aws_ecs_task_definition" "medusa_server" {
  family                   = "medusa-server"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.ecs_task_cpu
  memory                   = var.ecs_task_memory
  execution_role_arn       = var.ecs_task_exec_role_arn
  task_role_arn            = var.ecs_task_role_arn

  container_definitions = jsonencode([
    {
      name         = "medusa-server"
      image        = var.medusa_server_image
      portMappings = [{ containerPort = 9000 }]
      environment = [
        { name = "NODE_ENV", value = "production" },
        { name = "MEDUSA_WORKER_MODE", value = "server" },
        { name = "DATABASE_URL", value = var.database_url },
        { name = "REDIS_URL", value = var.redis_url },
        { name = "DISABLE_MEDUSA_ADMIN", value = "false" },
        { name = "PORT", value = "9000" }
      ]
    }
  ])
}

resource "aws_ecs_task_definition" "medusa_worker" {
  family                   = "medusa-worker"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.ecs_task_cpu
  memory                   = var.ecs_task_memory
  execution_role_arn       = var.ecs_task_exec_role_arn
  task_role_arn            = var.ecs_task_role_arn

  container_definitions = jsonencode([
    {
      name         = "medusa-worker"
      image        = var.medusa_server_image
      portMappings = [{ containerPort = 9000 }]
      environment = [
        { name = "NODE_ENV", value = "production" },
        { name = "MEDUSA_WORKER_MODE", value = "worker" },
        { name = "DATABASE_URL", value = var.database_url },
        { name = "REDIS_URL", value = var.redis_url },
        { name = "DISABLE_MEDUSA_ADMIN", value = "true" },
        { name = "PORT", value = "9000" }
      ]
    }
  ])
}

