# ---------------------------------------------
# Route53
# ---------------------------------------------
resource "aws_route53_zone" "front-route53_zone" {
  name          = "spa-front-paradigm-shift.work"
  force_destroy = false

  tags = {
    Name = "spa-front-paradigm-shift.work"

  }
}


resource "aws_route53_record" "front-route53_record" {
  zone_id = aws_route53_zone.front-route53_zone.id
  name    = "spa-front-paradigm-shift.work"
  type    = "A"

  alias {
    name                   = aws_lb.alb_front.dns_name
    zone_id                = aws_lb.alb_front.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_zone" "back-route53_zone" {
  name          = "spa-back-paradigm-shift.work"
  force_destroy = false

  tags = {
    Name = "spa-back-paradigm-shift.work"

  }
}


resource "aws_route53_record" "back-route53_record" {
  zone_id = aws_route53_zone.back-route53_zone.id
  name    = "spa-back-paradigm-shift.work"
  type    = "A"

  alias {
    name                   = aws_lb.alb_back.dns_name
    zone_id                = aws_lb.alb_back.zone_id
    evaluate_target_health = true
  }
}
