resource "aws_alb" "application_load_balancer" {
  name               = var.name
  internal           = var.internal
  load_balancer_type = var.type
  subnets            = var.subnets
  security_groups    = var.security_groups_ids
}

resource "aws_alb_target_group" "target_group" {
  name        = var.target_name
  port        = var.target_port
  protocol    = var.target_protocol
  target_type = var.target_type
  vpc_id      = var.target_vpc_id
  health_check {
    path                = var.health_check_path
    protocol            = var.health_check_protocol
    matcher             = var.health_check_matcher
    port                = var.health_check_port
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
    timeout             = var.health_check_timeout
    interval            = var.health_check_interval
  }
}

resource "aws_alb_listener" "listener" {
  load_balancer_arn = aws_alb.application_load_balancer.arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  default_action {
    type             = var.listener_action_type
    target_group_arn = aws_alb_target_group.target_group.arn
  }
}
