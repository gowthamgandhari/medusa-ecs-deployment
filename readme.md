# 🚀 Medusa Backend Deployment on AWS ECS Fargate with Terraform and GitHub Actions

This project demonstrates how to deploy a **Medusa backend** in both **server** and **worker** mode using **AWS ECS Fargate**, with **PostgreSQL (Amazon RDS)** and **Redis (ElastiCache)**, managed via **Terraform** and deployed through **GitHub Actions CI/CD**.

---

## 📌 Project Overview

- ✅ **Medusa** backend containerized using Docker
- ✅ **Infrastructure as Code** with Terraform
- ✅ Deployed on **ECS Fargate**
- ✅ Uses **RDS PostgreSQL** for database
- ✅ Uses **ElastiCache Redis** for caching
- ✅ CI/CD pipeline built with **GitHub Actions**
- ✅ Full documentation and walkthrough video included

---

## 🧱 Project Structure

```text
medusa-ecs-deployment/
├── medusa-app/               # Node.js Medusa backend
│   ├── medusa-config.ts
│   ├── Dockerfile
│   ├── package.json
│   └── ...
├── terraform/                # Terraform IaC for AWS infra
│   ├── main.tf
│   ├── vpc.tf
│   ├── ecs.tf
│   ├── rds.tf
│   ├── elasticache.tf
│   ├── ecr.tf
│   ├── iam.tf
│   ├── variables.tf
│   ├── outputs.tf
├── .github/
│   └── workflows/
│       └── deploy.yml        # CI/CD pipeline
├── README.md

⚙️ Technologies & Tools

| Tool / Tech         | Purpose                            |
| ------------------- | ---------------------------------- |
| Terraform           | Provision AWS infrastructure       |
| AWS ECS Fargate     | Run Medusa containers serverlessly |
| Amazon RDS          | PostgreSQL database                |
| Amazon ElastiCache  | Redis caching                      |
| AWS ECR             | Store Docker images                |
| GitHub Actions      | CI/CD pipeline                     |
| Docker              | Containerization                   |
| Node.js             | Medusa backend runtime             |
| AWS IAM             | Secure access management           |
| AWS CloudWatch      | Logs and monitoring                |
| AWS Secrets Manager | Manage secrets (optional)          |


🚀 Deployment Steps
🔧 1. Infrastructure Setup (Terraform)

cd terraform/
terraform init
terraform apply -auto-approve 
Creates: VPC, subnets, ECS cluster, task definitions, RDS, ElastiCache, IAM roles, etc.

🐳 2. Build & Push Docker Image

cd medusa-app/
docker build -t medusa-app .
aws ecr get-login-password | docker login ...
docker tag medusa-app:latest <your_ecr_repo_uri>
docker push <your_ecr_repo_uri>

✅ 3. CI/CD with GitHub Actions

Add AWS secrets to GitHub:
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY

GitHub Actions automatically triggers deployment via:

.github/workflows/deploy.yml

🌐 Accessing the Application
The application is accessible via ALB DNS name

Server listens on port 9000