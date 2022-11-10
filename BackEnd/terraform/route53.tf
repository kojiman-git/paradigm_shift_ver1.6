# ---------------------------------------------
# Route53
# ---------------------------------------------
resource "aws_route53_zone" "route53_zone" {
  name          = "tf-paradigm-shift.work"
  force_destroy = false

  tags = {
    Name    = "tf-paradigm-shift.work"
   
  }
}


resource "aws_route53_record" "route53_record" {
  zone_id = aws_route53_zone.route53_zone.id
  name    = "tf-paradigm-shift.work"
  type    = "A"

  alias {
    name                   = aws_lb.alb.dns_name
    zone_id                = aws_lb.alb.zone_id
    evaluate_target_health = true
  }
}