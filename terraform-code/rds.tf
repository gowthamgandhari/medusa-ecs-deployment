resource "aws_db_subnet_group" "medusa" {
  name       = "medusa-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "medusa-db-subnet-group"
  }
}

resource "aws_db_instance" "medusa" {
  identifier             = "medusa-db"
  engine                 = "postgres"
  instance_class         = var.rds_instance_type
  allocated_storage      = 20
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  publicly_accessible    = false
  storage_encrypted      = true
  multi_az               = false
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.medusa.name
  deletion_protection    = false

  tags = {
    Name = "medusa-postgres"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "medusa-rds-sg"
  description = "Allow ECS access to RDS"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "PostgreSQL access from ECS tasks"
    from_port       = 5432
    to_port         = 5432
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
    Name = "medusa-rds-sg"
  }
}
