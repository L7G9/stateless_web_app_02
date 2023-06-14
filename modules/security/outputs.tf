output "lb_security_group_id" {
    value = aws_security_group.lb.id
    description = "Id of load balancer security group"
}

output "ec2_security_group_id" {
    value = aws_security_group.ec2.id
    description = "Id of EC2 instance security group"
}
