data "aws_route53_zone" "selected" {
  name = var.hosted_zone_name
}

data "aws_lb" "selected" {
  arn = var.load_balancer_arn
}

resource "aws_route53_record" "main" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "${var.subdomain}.${var.hosted_zone_name}"
  type    = "A"

  alias {
    name                   = data.aws_lb.selected.dns_name
    zone_id                = data.aws_lb.selected.zone_id
    evaluate_target_health = true
  }
}
