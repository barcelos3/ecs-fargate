variable "cluster_name" {
  description = "The name of the ECS clsuter"
  type        = string
}

variable "template" {
  description = "The path to the ECS task definition template"
  type        = optional(string)
  default     = null
}

variable "tpl_app_image" {
  description = "The Docker image to use for the ECS task"
  type        = optional(string)
  default     = null
}

variable "tpl_app_port" {
  description = "The port the application listens on"
  type        = optional(number)
  default     = null
}

variable "tpl_fargate_cpu" {
  description = "The amount of CPU to allocate to the ECS task"
  type        = optional(string)
  default     = null
}

variable "tpl_fargate_memory" {
  description = "The amount of memory to allocate to the ECS task"
  type        = optional(string)
  default     = null
}

variable "tpl_aws_region" {
  description = "The AWS region to deploy the ECS task to"
  type        = optional(string)
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


