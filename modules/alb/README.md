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
| [aws_lb_listener.listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.target_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_internal"></a> [internal](#input\_internal) | Boolean to create an internal or external ALB, default is false | `bool` | `false` | no |
| <a name="input_listener"></a> [listener](#input\_listener) | values for the alb listener | <pre>object({<br>    listener_port        = string<br>    listener_protocol    = string<br>    listener_action_type = string<br>  })</pre> | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the Application Load Balancer | `string` | n/a | yes |
| <a name="input_security_groups_ids"></a> [security\_groups\_ids](#input\_security\_groups\_ids) | List of security groups to attach to the ALB | `list(string)` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | List of subnets to attach to the ALB | `list(string)` | n/a | yes |
| <a name="input_target"></a> [target](#input\_target) | values for the alb | <pre>object({<br>    target_name     = string<br>    target_port     = number<br>    target_protocol = string<br>    target_type     = string<br>    target_vpc_id   = string<br>    health_check = object({<br>      healthy_threshold   = number<br>      interval            = number<br>      protocol            = string<br>      matcher             = string<br>      timeout             = number<br>      path                = string<br>      unhealthy_threshold = number<br>      port                = string<br>    })<br>  })</pre> | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | (Optional) Type of load balancer to create. Possible values are application, gateway, or network. The default value is application. | `string` | `"application"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the Application Load Balancer |
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | DNS name of the Application Load Balancer |
| <a name="output_name"></a> [name](#output\_name) | Name of the Application Load Balancer |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | Zone ID of the Application Load Balancer |
<!-- END_TF_DOCS -->