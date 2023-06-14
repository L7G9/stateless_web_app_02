data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "servers" {
  count = var.number_of_instances

  ami                     = data.aws_ami.amazon_linux.id
  instance_type           = var.instance_type
  vpc_security_group_ids  = var.security_group_ids
  user_data               = file(var.user_data_file)

  tags = {
    Name = "${var.name_tag_prefix}_ec2_${count.index + 1}"
  }
}
