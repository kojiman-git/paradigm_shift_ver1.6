# ---------------------------------------------
# Certificate
# ---------------------------------------------
# for Tokyo region
resource "aws_acm_certificate" "front_tokyo_cert" {
  domain_name       = "spa-front-paradigm-shift.work"
  validation_method = "DNS"

  tags = {
    Name = "spa-front-paradigm-shift.work"
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    aws_route53_zone.front-route53_zone
  ]
}


resource "aws_route53_record" "front_route53_acm_dns_resolve" {
  for_each = {
    for dvo in aws_acm_certificate.front_tokyo_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      record = dvo.resource_record_value
    }
  }

  allow_overwrite = true
  zone_id         = aws_route53_zone.front-route53_zone.zone_id
  name            = each.value.name
  type            = each.value.type
  ttl             = 600
  records         = [each.value.record]
}

resource "aws_acm_certificate_validation" "front_cert_valid" {
  certificate_arn         = aws_acm_certificate.front_tokyo_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.front_route53_acm_dns_resolve : record.fqdn]
}

resource "aws_acm_certificate" "back_tokyo_cert" {
  domain_name       = "spa-back-paradigm-shift.work"
  validation_method = "DNS"

  tags = {
    Name = "spa-back-paradigm-shift.work"
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    aws_route53_zone.back-route53_zone
  ]
}


resource "aws_route53_record" "back_route53_acm_dns_resolve" {
  for_each = {
    for dvo in aws_acm_certificate.back_tokyo_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      record = dvo.resource_record_value
    }
  }

  allow_overwrite = true
  zone_id         = aws_route53_zone.back-route53_zone.zone_id
  name            = each.value.name
  type            = each.value.type
  ttl             = 600
  records         = [each.value.record]
}

resource "aws_acm_certificate_validation" "back_cert_valid" {
  certificate_arn         = aws_acm_certificate.back_tokyo_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.back_route53_acm_dns_resolve : record.fqdn]
}
