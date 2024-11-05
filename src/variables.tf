variable "vpc" {
  description = "values for the vpc"
  default = {
    HML = {}
    PRD = {
      name       = "vpc-network"
      cidr_block = "10.0.0.0/16"
      region     = "us-east-1"
      nat        = true
      vpn        = false
      enable_dns = true
    }
  }
}

variable "subnet" {
  description = "values for the subnets"
  default = {
    HML = {}
    PRD = {
      region = ["use1-az1", "use1-az2", "use1-az3"]
      public = {
        name             = "sub-public"
        cidr_block       = ["10.0.101.0/24", "10.0.102.0/24"]
        route_table_name = "public-rt"
      }
      private = {
        name             = "sub-pvt"
        cidr_block       = ["10.0.1.0/24", "10.0.2.0/24"]
        route_table_name = "private-rt"
      }
    }
  }
}

variable "alb" {
  description = "values for the alb"
  default = {
    HML = {}
    PRD = {
      name                 = "desafio-load-balancer"
      target_name          = "test"
      target_port          = 80
      target_protocol      = "HTTP"
      target_type          = "ip"
      listener_port        = "80"
      listener_protocol    = "HTTP"
      listener_action_type = "forward"
      healthy_threshold    = 3
      interval             = 30
      protocol             = "HTTP"
      matcher              = "200"
      timeout              = 10
      path                 = "/"
      unhealthy_threshold  = 2
      port                 = "traffic-port"

    }
  }
}

variable "sg" {
  description = "values for the security group"
  default = {
    HML = {}
    PRD = {
      ecs = {
        name                   = "demo-sg-ecs"
        description            = "Security group for ecs app"
        revoke_rules_on_delete = true
        ingress                = "../rules/ecs_ingress_rules.csv"
        egress                 = "../rules/ecs_egress_rules.csv"
      }
      alb = {
        name                   = "demo-sg-alb"
        description            = "Security group for alb app"
        revoke_rules_on_delete = true
        ingress                = "../rules/alb_ingress_rules.csv"
        egress                 = "../rules/alb_egress_rules.csv"
      }
    }
  }
}

variable "ecs" {
  description = "values for the ecs"
  default = {
    HML = {}
    PRD = {
      tpl = {
        file           = "../templates/ecs/myapp.json.tpl"
        app_image      = "barcelos3/app-v1:latest"
        app_port       = 80
        fargate_cpu    = "1024"
        fargate_memory = "2048"
        region         = "us-east-1"
      }
      cluster = {
        name               = "demo-cluster"
        family             = "demo-family"
        execution_role_arn = "aws_iam_role.ecs_task_execution_role.arn"
      }
      service = {
        name             = "demo-service"
        container_name   = "demo-container"
        container_port   = 80
        assign_public_ip = true
      }
    }
  }
}
