module "cluster_ecs" {
  source = "../modules/ecs"

  template         = var.ecs[terraform.workspace].tpl.file
  ecs_cluster_name = var.ecs[terraform.workspace].cluster.name

  tpl_app_image      = var.ecs[terraform.workspace].tpl.app_image
  tpl_app_port       = var.ecs[terraform.workspace].tpl.app_port
  tpl_fargate_cpu    = var.ecs[terraform.workspace].tpl.fargate_cpu
  tpl_fargate_memory = var.ecs[terraform.workspace].tpl.fargate_memory
  tpl_aws_region     = var.ecs[terraform.workspace].tpl.region

  family             = var.ecs[terraform.workspace].cluster.family
  execution_role_arn = aws_iam_role.ecsTaskExecutionRole.arn
  task_role_arn      = aws_iam_role.ecsTaskRole.arn

  ecs_service_name                = var.ecs[terraform.workspace].service.name
  ecs_service_security_group      = [aws_security_group.sg[0].id, aws_security_group.sg[1].id]
  ecs_service_subnet_ids          = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]
  ecs_service_lb_target_group_arn = module.alb.target_group_arn

  depends_on = [
    module.vpc,
    module.alb,
    aws_iam_role.ecsTaskExecutionRole,
    aws_iam_role.ecsTaskRole
  ]
}
