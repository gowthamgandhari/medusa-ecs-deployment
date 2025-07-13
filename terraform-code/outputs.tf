## terraform/outputs.tf
#
#output "vpc_id" {
#  value = aws_vpc.main.id
#}
#
#output "public_subnet_ids" {
#  value = aws_subnet.public[*].id
#}
#
#output "private_subnet_ids" {
#  value = aws_subnet.private[*].id
#}
#
#output "rds_endpoint" {
#  value = aws_db_instance.medusa_db.endpoint
#}
#
#output "redis_endpoint" {
#  value = aws_elasticache_cluster.medusa_redis.cache_nodes[0].address
#}
#
#output "alb_dns_name" {
#  value = aws_lb.medusa_alb.dns_name
#}
#
#output "ecr_repository_url" {
#  value = aws_ecr_repository.medusa.repository_url
#}
#
#output "ecs_cluster_name" {
#  value = aws_ecs_cluster.medusa_cluster.name
#}
#
#output "ecs_task_execution_role_arn" {
#  value = aws_iam_role.ecs_task_execution.arn
#}
#
#output "ecs_task_role_arn" {
#  value = aws_iam_role.ecs_task_role.arn
#}
