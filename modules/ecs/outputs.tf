output "name" {
  description = "value of the ECS cluster name"
  value       = aws_ecs_cluster.ecs_clsuter.name
}

output "ecs_service_name" {
  description = "value of the ECS service name"
  value       = aws_ecs_service.ecs_service.name
}

output "task_memory" {
  description = "value of the ECS task memory"
  value       = aws_ecs_task_definition.app.memory
}

output "task_cpu" {
  description = "value of the ECS task memory"
  value       = aws_ecs_task_definition.app.cpu
}
