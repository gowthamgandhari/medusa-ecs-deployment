# terraform/ecr.tf

resource "aws_ecr_repository" "medusa" {
  name = "medusa-app"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "medusa-ecr-repo"
  }
}

