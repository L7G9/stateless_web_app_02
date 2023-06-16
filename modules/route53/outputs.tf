output "alias_record_name" {
  value       = aws_route53_record.main.name
  description = "Address used to reach load balancer"
}
