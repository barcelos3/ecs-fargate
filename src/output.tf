output "alb_dns_name" {
  description = "value of the alb dns name"
  value       = module.alb.dns_name
}

output "alb_name" {
  description = "value of the alb name"
  value       = module.alb.name
}

output "alb_arn" {
  description = "value of the alb arn"
  value       = module.alb.arn
}

output "ecs_cluster_name" {
  description = "value of the ecs cluster name"
  value       = module.cluster_ecs.name
}

output "ecs_service_name" {
  description = "value of the ecs service name"
  value       = module.cluster_ecs.ecs_service_name
}

output "ecs_task_memory" {
  description = "value of the ecs task memory"
  value       = module.cluster_ecs.task_memory
}

output "ecs_task_cpu" {
  description = "value of the ecs task cpu"
  value       = module.cluster_ecs.task_cpu
}

output "security_group_ids" {
  description = "value of the security group ids"
  value       = aws_security_group.sg[*].id
}
