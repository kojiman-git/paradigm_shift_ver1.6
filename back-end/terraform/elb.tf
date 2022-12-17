# ---------------------------------------------
# ALB
# ---------------------------------------------
resource "aws_lb" "alb" {
  name               = "alb-paradimg-shift-terraform"
  internal           = false
  load_balancer_type = "application"
  security_groups = [
    aws_security_group.alb_sg.id
  ]
  subnets = [
    aws_subnet.public_subnet_1a.id,
    aws_subnet.public_subnet_1c.id
  ]
}


resource "aws_lb_listener" "alb_listener_http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}

resource "aws_lb_listener" "alb_listener_https" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.tokyo_cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}

# ---------------------------------------------
# target group
# ---------------------------------------------
resource "aws_lb_target_group" "alb_target_group" {
  name     = "tg-paradigm-shift-terraform"
  port     =  80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
  target_type = "ip"
  tags = {
    Name    = "tg-paradigm-shift-terraform"
  }
}