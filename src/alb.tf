module "alb" {
  source = "../modules/alb"

  name                = var.alb[terraform.workspace].name
  subnets             = module.vpc.public_subnets
  security_groups_ids = [aws_security_group.sg[1].id]

  target_name     = var.alb[terraform.workspace].target_name
  target_port     = var.alb[terraform.workspace].target_port
  target_protocol = var.alb[terraform.workspace].target_protocol
  target_type     = var.alb[terraform.workspace].target_type
  target_vpc_id   = module.vpc.vpc_id

  health_check_healthy_threshold   = var.alb[terraform.workspace].healthy_threshold
  health_check_interval            = var.alb[terraform.workspace].interval
  health_check_protocol            = var.alb[terraform.workspace].protocol
  health_check_matcher             = var.alb[terraform.workspace].matcher
  health_check_timeout             = var.alb[terraform.workspace].timeout
  health_check_path                = var.alb[terraform.workspace].path
  health_check_unhealthy_threshold = var.alb[terraform.workspace].unhealthy_threshold
  health_check_port                = var.alb[terraform.workspace].port

  listener_port        = var.alb[terraform.workspace].listener_port
  listener_protocol    = var.alb[terraform.workspace].listener_protocol
  listener_action_type = var.alb[terraform.workspace].listener_action_type

}
