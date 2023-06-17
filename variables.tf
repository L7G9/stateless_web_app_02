variable "name_tag_prefix" {
  type        = string
  description = "Prefix to give all name tags of resources created by this module"
  default     = "swa_02"
}

variable "region" {
  type        = string
  description = "AWS region"
}

variable "user_data_file" {
  type        = string
  description = "File path of user-data script for EC2 instances"
  default     = "/files/user-data.sh"
}

variable "domain_name" {
  type        = string
  description = "Name of hosted zone"
}

variable "subdomain" {
  type        = string
  description = "Subdomain to be added to domain name to create alias record in hosted zone"
  default     = "www"
}
