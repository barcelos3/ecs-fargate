output "name" {
  description = "Name of the Application Load Balancer"
  value       = aws_alb.application_load_balancer.name
}

output "dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_alb.application_load_balancer.dns_name
}

output "arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_alb.application_load_balancer.arn
}

output "zone_id" {
  description = "Zone ID of the Application Load Balancer"
  value       = aws_alb.application_load_balancer.zone_id
}

output "listener" {
  description = "Listener of the Application Load Balancer"
  value       = aws_alb_listener.listener

}

output "target_group_arn" {
  description = "ARN of the target group"
  value       = aws_alb_target_group.target_group.arn
}
