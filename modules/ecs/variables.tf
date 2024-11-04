variable "ecs_cluster_name" {
  description = "The name of the ECS clsuter"
  type        = string
}

variable "template" {
  description = "The path to the ECS task definition template"
  type        = string
  default     = null
}

variable "tpl_app_image" {
  description = "The Docker image to use for the ECS task"
  type        = string
  default     = null
}

variable "tpl_app_port" {
  description = "The port the application listens on"
  type        = number
  default     = null
}

variable "tpl_fargate_cpu" {
  description = "The amount of CPU to allocate to the ECS task"
  type        = string
  default     = null
}

variable "tpl_fargate_memory" {
  description = "The amount of memory to allocate to the ECS task"
  type        = string
  default     = null
}

variable "tpl_aws_region" {
  description = "The AWS region to deploy the ECS task to"
  type        = string
  default     = null
}

variable "family" {
  description = "The family of the ECS task definition"
  type        = string
}

variable "execution_role_arn" {
  description = "The ARN of the IAM role to use for the ECS task"
  type        = string
}

variable "network_mode" {
  description = "The network mode to use for the ECS task"
  type        = string
  default     = "awsvpc"
}

variable "requires_compatibilities" {
  description = "The compatibilities required for the ECS task"
  type        = list(string)
  default     = ["FARGATE"]
}

variable "ecs_service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "ecs_service_desired_count" {
  description = "The desired number of tasks to run in the ECS service"
  type        = number
  default     = 1
}

variable "ecs_service_launch_type" {
  description = "The launch type to use for the ECS service"
  type        = string
  default     = "FARGATE"
}

variable "ecs_service_security_group" {
  description = "The ID of the security group to use for the ECS tasks"
  type        = list(string)
}

variable "ecs_service_subnet_ids" {
  description = "The ID of the subnet to use for the ECS tasks"
  type        = list(string)
}

variable "ecs_service_assign_public_ip" {
  description = "Whether to assign a public IP address to the ECS tasks"
  type        = bool
  default     = true
}

variable "ecs_service_lb_target_group_arn" {
  description = "The ARN of the target group loadbalancer to use for the ECS service"
  type        = string
}

variable "ecs_service_container_name" {
  description = "The name of the container in the ECS service"
  type        = string
  default     = "myapp"
}

variable "ecs_service_container_port" {
  description = "The port of the container in the ECS service"
  type        = number
  default     = 80
}

variable "task_role_arn" {
  description = "The ARN of the IAM role to use for the ECS task"
  type        = string
}
