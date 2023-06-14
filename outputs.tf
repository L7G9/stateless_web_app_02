output "lb_dns_name" {
  value       = module.load_balancer.lb_dns_name
  description = "DNS name assigned to load balancer"
}
