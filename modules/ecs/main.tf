resource "aws_ecs_cluster" "ecs_clsuter" {
  name = "cb-cluster"
}

data "template_file" "cb_app" {
  template = file(var.template)

  vars = {
    app_image      = var.tpl_app_image
    app_port       = var.tpl_app_port
    fargate_cpu    = var.tpl_fargate_cpu
    fargate_memory = var.tpl_fargate_memory
    aws_region     = var.tpl_aws_region
  }
}

resource "aws_ecs_task_definition" "app" {
  family                   = var.family
  execution_role_arn       = var.execution_role_arn
  network_mode             = var.network_mode
  requires_compatibilities = var.requires_compatibilities
  cpu                      = var.tpl_fargate_cpu
  memory                   = var.tpl_fargate_memory
  container_definitions    = data.template_file.cb_app.rendered
}

resource "aws_ecs_service" "main" {
  name            = "cb-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = var.app_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [aws_security_group.ecs_tasks.id]
    subnets          = aws_subnet.private.*.id
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.app.id
    container_name   = "cb-app"
    container_port   = var.app_port
  }

  depends_on = [aws_alb_listener.front_end, aws_iam_role_policy_attachment.ecs-task-execution-role-policy-attachment]
}
