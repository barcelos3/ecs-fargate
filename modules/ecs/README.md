# Amazon Elastic Container Service - Terraform module

Terraform module which creates Elastic Container Service on AWS.

## Usage

Amazon Elastic Container Service (ECS) is a fully managed container orchestration service that helps you to more efficiently deploy, manage, and scale containerized applications. It deeply integrates with the AWS environment to provide an easy-to-use solution for running container workloads in the cloud and on premises with advanced security features using Amazon ECS Anywhere. Checkout the [AWS documentation](https://aws.amazon.com/pt/ecs/) for more information.

![aws](https://img.shields.io/badge/AWS-ECS-orange)  ![develop](https://img.shields.io/badge/DIEGO%20COMITRE-TERRAFORM-blue) 
---
### Application Load Balancer

#### HTTP to HTTPS redirect

```hcl
module "cluster_ecs" {
  source = "../modules/ecs"

  template         = var.ecs.tpl.file
  ecs_cluster_name = var.ecs.cluster.name

  tpl_app_image      = var.ecs.tpl.app_image
  tpl_app_port       = var.ecs.tpl.app_port
  tpl_fargate_cpu    = var.ecs.tpl.fargate_cpu
  tpl_fargate_memory = var.ecs.tpl.fargate_memory
  tpl_aws_region     = var.ecs.tpl.region

  family             = var.ecs.cluster.family
  execution_role_arn = aws_iam_role.ecsTaskExecutionRole.arn
  task_role_arn      = aws_iam_role.ecsTaskRole.arn

  ecs_service_name                = var.ecs.service.name
  ecs_service_security_group      = [aws_security_group.sg[0].id, aws_security_group.sg[1].id]
  ecs_service_subnet_ids          = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]
  ecs_service_lb_target_group_arn = module.alb.arn

  depends_on = [
    module.vpc,
    module.alb,    
    aws_iam_role.ecsTaskExecutionRole,
    aws_iam_role.ecsTaskRole
  ]
}

```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.73 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.73 |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecs_cluster.ecs_clsuter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_service.ecs_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [template_file.cb_app](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ecs_cluster_name"></a> [ecs\_cluster\_name](#input\_ecs\_cluster\_name) | The name of the ECS clsuter | `string` | n/a | yes |
| <a name="input_ecs_service_assign_public_ip"></a> [ecs\_service\_assign\_public\_ip](#input\_ecs\_service\_assign\_public\_ip) | Whether to assign a public IP address to the ECS tasks | `bool` | `true` | no |
| <a name="input_ecs_service_container_name"></a> [ecs\_service\_container\_name](#input\_ecs\_service\_container\_name) | The name of the container in the ECS service | `string` | `"myapp"` | no |
| <a name="input_ecs_service_container_port"></a> [ecs\_service\_container\_port](#input\_ecs\_service\_container\_port) | The port of the container in the ECS service | `number` | `80` | no |
| <a name="input_ecs_service_desired_count"></a> [ecs\_service\_desired\_count](#input\_ecs\_service\_desired\_count) | The desired number of tasks to run in the ECS service | `number` | `1` | no |
| <a name="input_ecs_service_launch_type"></a> [ecs\_service\_launch\_type](#input\_ecs\_service\_launch\_type) | The launch type to use for the ECS service | `string` | `"FARGATE"` | no |
| <a name="input_ecs_service_lb_target_group_arn"></a> [ecs\_service\_lb\_target\_group\_arn](#input\_ecs\_service\_lb\_target\_group\_arn) | The ARN of the target group loadbalancer to use for the ECS service | `string` | n/a | yes |
| <a name="input_ecs_service_name"></a> [ecs\_service\_name](#input\_ecs\_service\_name) | The name of the ECS service | `string` | n/a | yes |
| <a name="input_ecs_service_security_group"></a> [ecs\_service\_security\_group](#input\_ecs\_service\_security\_group) | The ID of the security group to use for the ECS tasks | `list(string)` | n/a | yes |
| <a name="input_ecs_service_subnet_ids"></a> [ecs\_service\_subnet\_ids](#input\_ecs\_service\_subnet\_ids) | The ID of the subnet to use for the ECS tasks | `list(string)` | n/a | yes |
| <a name="input_execution_role_arn"></a> [execution\_role\_arn](#input\_execution\_role\_arn) | The ARN of the IAM role to use for the ECS task | `string` | n/a | yes |
| <a name="input_family"></a> [family](#input\_family) | The family of the ECS task definition | `string` | n/a | yes |
| <a name="input_network_mode"></a> [network\_mode](#input\_network\_mode) | The network mode to use for the ECS task | `string` | `"awsvpc"` | no |
| <a name="input_requires_compatibilities"></a> [requires\_compatibilities](#input\_requires\_compatibilities) | The compatibilities required for the ECS task | `list(string)` | <pre>[<br>  "FARGATE"<br>]</pre> | no |
| <a name="input_task_role_arn"></a> [task\_role\_arn](#input\_task\_role\_arn) | The ARN of the IAM role to use for the ECS task | `string` | n/a | yes |
| <a name="input_template"></a> [template](#input\_template) | The path to the ECS task definition template | `string` | `null` | no |
| <a name="input_tpl_app_image"></a> [tpl\_app\_image](#input\_tpl\_app\_image) | The Docker image to use for the ECS task | `string` | `null` | no |
| <a name="input_tpl_app_port"></a> [tpl\_app\_port](#input\_tpl\_app\_port) | The port the application listens on | `number` | `null` | no |
| <a name="input_tpl_aws_region"></a> [tpl\_aws\_region](#input\_tpl\_aws\_region) | The AWS region to deploy the ECS task to | `string` | `null` | no |
| <a name="input_tpl_fargate_cpu"></a> [tpl\_fargate\_cpu](#input\_tpl\_fargate\_cpu) | The amount of CPU to allocate to the ECS task | `string` | `null` | no |
| <a name="input_tpl_fargate_memory"></a> [tpl\_fargate\_memory](#input\_tpl\_fargate\_memory) | The amount of memory to allocate to the ECS task | `string` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->