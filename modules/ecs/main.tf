resource "aws_ecs_cluster" "ecs_clsuter" {
  name = var.ecs_cluster_name
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
  task_role_arn            = var.task_role_arn
  network_mode             = var.network_mode
  requires_compatibilities = var.requires_compatibilities
  cpu                      = var.tpl_fargate_cpu
  memory                   = var.tpl_fargate_memory
  container_definitions    = data.template_file.cb_app.rendered
}

resource "aws_ecs_service" "ecs_service" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.ecs_clsuter.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = var.ecs_service_desired_count
  launch_type     = var.ecs_service_launch_type

  network_configuration {
    security_groups  = var.ecs_service_security_group
    subnets          = var.ecs_service_subnet_ids
    assign_public_ip = var.ecs_service_assign_public_ip
  }

  load_balancer {
    target_group_arn = var.ecs_service_lb_target_group_arn
    container_name   = var.ecs_service_container_name
    container_port   = var.ecs_service_container_port
  }
}
