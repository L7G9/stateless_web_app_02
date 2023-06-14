variable "name_tag_prefix" {
  type        = string
  description = "Prefix to give all name tags of resources created by this module"
  default     = ""
}

variable "vpc_id" {
  type        = string
  description = "Id of vpc to create target group in"
}

variable "instance_ids" {
  type        = list(string)
  description = "Ids of EC2 instances to add to target group"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Ids of security groups to add load balancer to"
}
