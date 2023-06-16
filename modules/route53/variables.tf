variable "hosted_zone_name" {
  type        = string
  description = "Name of hosted zone to create alias record in"
}

variable "subdomain" {
  type        = string
  description = "Subdomain of alias record name"
}

variable "load_balancer_arn" {
  type        = string
  description = "Id of load balancer to point alias record to"
}
