resource "aws_lb_target_group" "main" {
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    port = 80
  }

  tags = {
    Name = "${var.name_tag_prefix}_lb_tg"
  }
}

resource "aws_lb_target_group_attachment" "main" {
  count            = length(var.instance_ids)
  target_group_arn = aws_lb_target_group.main.arn
  target_id        = var.instance_ids[count.index]
  port             = 80
}

data "aws_subnets" "all" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

resource "aws_lb" "main" {
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_group_ids
  subnets            = toset(data.aws_subnets.all.ids)

  tags = {
    Name = "${var.name_tag_prefix}_lb"
  }
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.main.id
    type             = "forward"
  }

  tags = {
    Name = "${var.name_tag_prefix}_lb_listener"
  }
}
