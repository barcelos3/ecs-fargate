module "alb" {
  source = "../modules/alb"

  name                = var.alb[terraform.workspace].name
  subnets             = module.vpc.public_subnets
  security_groups_ids = [aws_security_group.sg[1].id]

  target = {
    target_name     = var.alb[terraform.workspace].target_name
    target_port     = var.alb[terraform.workspace].target_port
    target_protocol = var.alb[terraform.workspace].target_protocol
    target_type     = var.alb[terraform.workspace].target_type
    target_vpc_id   = module.vpc.vpc_id
    health_check = {
      healthy_threshold   = var.alb[terraform.workspace].health_check.healthy_threshold
      interval            = var.alb[terraform.workspace].health_check.interval
      protocol            = var.alb[terraform.workspace].health_check.protocol
      matcher             = var.alb[terraform.workspace].health_check.matcher
      timeout             = var.alb[terraform.workspace].health_check.timeout
      path                = var.alb[terraform.workspace].health_check.path
      unhealthy_threshold = var.alb[terraform.workspace].health_check.unhealthy_threshold
      port                = var.alb[terraform.workspace].health_check.port
    }
  }

  listener = {
    listener_port        = var.alb[terraform.workspace].listener_port
    listener_protocol    = var.alb[terraform.workspace].listener_protocol
    listener_action_type = var.alb[terraform.workspace].listener_action_type
  }
}
