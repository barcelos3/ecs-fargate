module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name               = lower("${var.vpc[terraform.workspace].name}-${terraform.workspace}")
  cidr               = var.vpc[terraform.workspace].cidr_block
  enable_dns_support = var.vpc[terraform.workspace].enable_dns

  azs             = [for i in var.subnet[terraform.workspace].region : i]
  private_subnets = [for i in var.subnet[terraform.workspace].private.cidr_block : i]
  public_subnets  = [for i in var.subnet[terraform.workspace].public.cidr_block : i]

  enable_nat_gateway = var.vpc[terraform.workspace].nat
  enable_vpn_gateway = var.vpc[terraform.workspace].vpn

  tags = {
    TERRAFORM   = upper("true")
    ENVIRONMENT = upper(terraform.workspace)
  }
}
