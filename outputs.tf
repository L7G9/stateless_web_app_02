output "lb_dns_name" {
  value       = module.load_balancer.lb_dns_name
  description = "DNS name assigned to load balancer"
}

output "route53_alias_name" {
  value       = module.route53.alias_record_name
  description = "URL of alias record poiting to load balancer"
}
