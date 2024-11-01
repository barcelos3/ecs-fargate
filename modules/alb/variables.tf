variable "name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "internal" {
  description = "Boolean to create an internal or external ALB, default is false"
  type        = bool
  default     = false
}

variable "type" {
  description = "(Optional) Type of load balancer to create. Possible values are application, gateway, or network. The default value is application."
  type        = string
  default     = "application"
}

variable "subnets" {
  description = "List of subnets to attach to the ALB"
  type        = list(string)
}

variable "security_groups_ids" {
  description = "List of security groups to attach to the ALB"
  type        = list(string)
}

variable "target" {
  description = "values for the alb"
  type = object({
    target_name     = string
    target_port     = number
    target_protocol = string
    target_type     = string
    target_vpc_id   = string
    health_check = object({
      healthy_threshold   = number
      interval            = number
      protocol            = string
      matcher             = string
      timeout             = number
      path                = string
      unhealthy_threshold = number
      port                = string
    })
  })
}

variable "listener" {
  description = "values for the alb listener"
  type = object({
    listener_port        = string
    listener_protocol    = string
    listener_action_type = string
  })
}

