variable "name_tag_prefix" {
  type        = string
  description = "Prefix to give all name tags of resources created by this module"
}

variable "vpc_id" {
  type = string
  description = "Id of VPC to add security groups to"
}
