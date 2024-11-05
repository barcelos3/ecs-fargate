# AWS Application and Network Load Balancer (ALB & NLB) Terraform module

Terraform module which creates Application and Network Load Balancer resources on AWS.

## Usage

When you're using ALB Listener rules, make sure that every rule's `actions` block ends in a `forward`, `redirect`, or `fixed-response` action so that every rule will resolve to some sort of an HTTP response. Checkout the [AWS documentation](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/listener-update-rules.html) for more information.

![aws](https://img.shields.io/badge/AWS-APPLICATION%20LOADBALANCER-orange)  ![develop](https://img.shields.io/badge/DIEGO%20COMITRE-TERRAFORM-blue) 
---
### Application Load Balancer

#### HTTP to HTTPS redirect

```hcl
module "alb" {
  source = "../modules/alb"

  name                = "abc123"
  subnets             = "subnet-sad909a"
  security_groups_ids = [sg-askjdlk213ijosdj09]

  target = {
    target_name     = "batinha"
    target_port     = 80
    target_protocol = "HTTP"
    target_type     = "[FOWARD]"
    target_vpc_id   = vpc-asdkljj82
    
    health_check = {
      healthy_threshold   = var.alb.health_check.healthy_threshold
      interval            = var.alb.health_check.interval
      protocol            = var.alb.health_check.protocol
      matcher             = var.alb.health_check.matcher
      timeout             = var.alb.health_check.timeout
      path                = var.alb.health_check.path
      unhealthy_threshold = var.alb.health_check.unhealthy_threshold
      port                = var.alb.health_check.port
    }
  }

  listener = {
    listener_port        = var.alb.listener_port
    listener_protocol    = var.alb.listener_protocol
    listener_action_type = var.alb.listener_action_type
  }
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

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_alb.application_load_balancer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb) | resource |
| [aws_alb_listener.listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_listener) | resource |
| [aws_alb_target_group.target_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_health_check_healthy_threshold"></a> [health\_check\_healthy\_threshold](#input\_health\_check\_healthy\_threshold) | Healthy threshold for the health check | `number` | n/a | yes |
| <a name="input_health_check_interval"></a> [health\_check\_interval](#input\_health\_check\_interval) | Interval for the health check | `number` | n/a | yes |
| <a name="input_health_check_matcher"></a> [health\_check\_matcher](#input\_health\_check\_matcher) | Matcher for the health check | `string` | n/a | yes |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | Path for the health check | `string` | n/a | yes |
| <a name="input_health_check_port"></a> [health\_check\_port](#input\_health\_check\_port) | Port for the health check | `string` | n/a | yes |
| <a name="input_health_check_protocol"></a> [health\_check\_protocol](#input\_health\_check\_protocol) | Protocol for the health check | `string` | n/a | yes |
| <a name="input_health_check_timeout"></a> [health\_check\_timeout](#input\_health\_check\_timeout) | Timeout for the health check | `number` | n/a | yes |
| <a name="input_health_check_unhealthy_threshold"></a> [health\_check\_unhealthy\_threshold](#input\_health\_check\_unhealthy\_threshold) | Unhealthy threshold for the health check | `number` | n/a | yes |
| <a name="input_internal"></a> [internal](#input\_internal) | Boolean to create an internal or external ALB, default is false | `bool` | `false` | no |
| <a name="input_listener_action_type"></a> [listener\_action\_type](#input\_listener\_action\_type) | Action type for the ALB listener | `string` | n/a | yes |
| <a name="input_listener_port"></a> [listener\_port](#input\_listener\_port) | Port for the ALB listener | `string` | n/a | yes |
| <a name="input_listener_protocol"></a> [listener\_protocol](#input\_listener\_protocol) | Protocol for the ALB listener | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the Application Load Balancer | `string` | n/a | yes |
| <a name="input_security_groups_ids"></a> [security\_groups\_ids](#input\_security\_groups\_ids) | List of security groups to attach to the ALB | `list(string)` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | List of subnets to attach to the ALB | `list(string)` | n/a | yes |
| <a name="input_target_name"></a> [target\_name](#input\_target\_name) | Name of the target | `string` | n/a | yes |
| <a name="input_target_port"></a> [target\_port](#input\_target\_port) | Port of the target | `number` | n/a | yes |
| <a name="input_target_protocol"></a> [target\_protocol](#input\_target\_protocol) | Protocol of the target | `string` | n/a | yes |
| <a name="input_target_type"></a> [target\_type](#input\_target\_type) | Type of the target | `string` | n/a | yes |
| <a name="input_target_vpc_id"></a> [target\_vpc\_id](#input\_target\_vpc\_id) | VPC ID of the target | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | (Optional) Type of load balancer to create. Possible values are application, gateway, or network. The default value is application. | `string` | `"application"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the Application Load Balancer |
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | DNS name of the Application Load Balancer |
| <a name="output_listener"></a> [listener](#output\_listener) | Listener of the Application Load Balancer |
| <a name="output_name"></a> [name](#output\_name) | Name of the Application Load Balancer |
| <a name="output_target_group_arn"></a> [target\_group\_arn](#output\_target\_group\_arn) | ARN of the target group |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | Zone ID of the Application Load Balancer |
<!-- END_TF_DOCS -->