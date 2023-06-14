resource "aws_security_group" "lb" {
  description = "Allow ssh, http & https inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.name_tag_prefix}_lb_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "lb_allow_http" {
  security_group_id = aws_security_group.lb.id

  description = "Allow incomming http from anywhere"
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80

  tags = {
    Name = "${var.name_tag_prefix}_lb_sg_ingress_http"
  }
}

resource "aws_vpc_security_group_egress_rule" "lb_allow_all" {
  security_group_id = aws_security_group.lb.id

  description = "Allow all outgoing to anywhere"
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"

  tags = {
    Name = "${var.name_tag_prefix}_lb_sg_egress_all"
  }
}

resource "aws_security_group" "ec2" {
  description = "Allow traffic to and from the lb security group"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.name_tag_prefix}_ec2_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ec2_allow_from_lb" {
  security_group_id = aws_security_group.ec2.id

  description = "Allow incomming from lb security group"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
  referenced_security_group_id = aws_security_group.lb.id

  tags = {
    Name = "${var.name_tag_prefix}_ec2_sg_ingress"
  }
}

resource "aws_vpc_security_group_egress_rule" "ec2_allow_to_lb" {
  security_group_id = aws_security_group.ec2.id

  description = "Allow all outgoing to anywhere"
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"

  tags = {
    Name = "${var.name_tag_prefix}_ec2_sg_egress"
  }
}
