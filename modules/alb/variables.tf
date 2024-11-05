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

variable "listener_port" {
  description = "Port for the ALB listener"
  type        = string
}

variable "listener_protocol" {
  description = "Protocol for the ALB listener"
  type        = string
}

variable "listener_action_type" {
  description = "Action type for the ALB listener"
  type        = string
}

variable "target_name" {
  description = "Name of the target"
  type        = string
}

variable "target_port" {
  description = "Port of the target"
  type        = number
}

variable "target_protocol" {
  description = "Protocol of the target"
  type        = string
}

variable "target_type" {
  description = "Type of the target"
  type        = string
}

variable "target_vpc_id" {
  description = "VPC ID of the target"
  type        = string
}

variable "health_check_healthy_threshold" {
  description = "Healthy threshold for the health check"
  type        = number
}

variable "health_check_interval" {
  description = "Interval for the health check"
  type        = number
}

variable "health_check_protocol" {
  description = "Protocol for the health check"
  type        = string
}

variable "health_check_matcher" {
  description = "Matcher for the health check"
  type        = string
}

variable "health_check_timeout" {
  description = "Timeout for the health check"
  type        = number
}

variable "health_check_path" {
  description = "Path for the health check"
  type        = string
}

variable "health_check_unhealthy_threshold" {
  description = "Unhealthy threshold for the health check"
  type        = number
}

variable "health_check_port" {
  description = "Port for the health check"
  type        = string
}

