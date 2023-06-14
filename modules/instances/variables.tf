variable "name_tag_prefix" {
  type        = string
  description = "Prefix to give all name tags of resources created by this module"
}

variable "number_of_instances" {
  type        = number
  description = "Number of EC2 instances to create"
  default     = 2
}

variable "instance_type" {
  type        = string
  description = "Instance type of the EC2 instances to create"
  default     = "t2.micro"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Ids of the security groups to add the EC2 instances to"
}

variable "user_data_file" {
  type        = string
  description = "File path for user-data script"
}
