output "instance_ids" {
  value       = aws_instance.servers[*].id
  description = "List containing Ids of the EC2 instances created by this module"
}
