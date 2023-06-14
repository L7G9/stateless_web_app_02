output "vpc_id" {
  value       = aws_default_vpc.default.id
  description = "Id of VPC"
}
