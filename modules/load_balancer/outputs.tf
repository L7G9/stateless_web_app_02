output "lb_dns_name" {
  value       = aws_lb.main.dns_name
  description = "DNS name assigned to load balancer"
}
