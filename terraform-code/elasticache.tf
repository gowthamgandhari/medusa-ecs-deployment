resource "aws_elasticache_subnet_group" "medusa_redis_subnet" {
  name       = "medusa-redis-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "medusa-redis-subnet-group"
  }
}

resource "aws_security_group" "medusa_redis_sg" {
  name        = "medusa-redis-sg"
  description = "Security group for Medusa Redis"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 6379
    to_port         = 6379
    protocol        = "tcp"
    security_groups = [aws_security_group.ecs_tasks.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "medusa-redis-sg"
  }
}

resource "aws_elasticache_cluster" "medusa_redis" {
  cluster_id           = "medusa-redis"
  engine               = "redis"
  node_type            = var.redis_node_type
  num_cache_nodes      = 1
  parameter_group_name = "default.redis7"
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.medusa_redis_subnet.name
  security_group_ids   = [aws_security_group.medusa_redis_sg.id]

  tags = {
    Name = "medusa-redis"
  }
}
