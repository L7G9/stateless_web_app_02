terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.region
}

module "network" {
  source = "./modules/network"
}

module "security" {
  source = "./modules/security"

  name_tag_prefix = var.name_tag_prefix
  vpc_id          = module.network.vpc_id
}

module "instances" {
  source = "./modules/instances"

  name_tag_prefix    = var.name_tag_prefix
  security_group_ids = [module.security.ec2_security_group_id]
  user_data_file     = "${path.module}${var.user_data_file}"
}

module "load_balancer" {
  source = "./modules/load_balancer"

  name_tag_prefix    = var.name_tag_prefix
  vpc_id             = module.network.vpc_id
  instance_ids       = module.instances.instance_ids
  security_group_ids = [module.security.lb_security_group_id]
}

module "route53" {
  source = "./modules/route53"

  hosted_zone_name  = var.domain_name
  subdomain = var.subdomain
  load_balancer_arn = module.load_balancer.lb_arn
}
