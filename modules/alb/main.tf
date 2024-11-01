resource "aws_alb" "application_load_balancer" {
  name               = var.name
  internal           = var.internal
  load_balancer_type = var.type
  subnets            = var.subnets
  security_groups    = var.security_groups_ids
}

resource "aws_lb_target_group" "target_group" {
  name        = var.target.target_name
  port        = var.target.target_port
  protocol    = var.target.target_protocol
  target_type = var.target.target_type
  vpc_id      = var.target.target_vpc_id
  health_check {
    path                = var.target.health_check.path
    protocol            = var.target.health_check.protocol
    matcher             = var.target.health_check.matcher
    port                = var.target.health_check.port
    healthy_threshold   = var.target.health_check.healthy_threshold
    unhealthy_threshold = var.target.health_check.unhealthy_threshold
    timeout             = var.target.health_check.timeout
    interval            = var.target.health_check.interval
  }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_alb.application_load_balancer.arn
  port              = var.listener.listener_port
  protocol          = var.listener.listener_protocol

  default_action {
    type             = var.listener.listener_action_type
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}
