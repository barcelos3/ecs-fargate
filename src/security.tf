resource "aws_security_group" "sg" {
  count = length(var.sg[terraform.workspace])

  name        = element([for i in var.sg[terraform.workspace] : i.name], count.index)
  description = element([for i in var.sg[terraform.workspace] : i.description], count.index)
  vpc_id      = module.vpc.vpc_id

  dynamic "ingress" {
    for_each = csvdecode(file(element([for i in var.sg[terraform.workspace] : i.ingress], count.index)))

    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = [ingress.value.cidr_blocks]
    }
  }

  dynamic "egress" {
    for_each = csvdecode(file(element([for i in var.sg[terraform.workspace] : i.egress], count.index)))

    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = [egress.value.cidr_blocks]
    }
  }
}
