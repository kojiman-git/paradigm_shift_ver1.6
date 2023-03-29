# ---------------------------------------------
# ALB
# ---------------------------------------------
resource "aws_lb" "alb_front" {
  name               = "spa-front-alb-paradimg-terraform"
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


resource "aws_lb_listener" "alb_front_listener_http" {
  load_balancer_arn = aws_lb.alb_front.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_front_target_group.arn
  }
}

resource "aws_lb_listener" "alb_front_listener_https" {
  load_balancer_arn = aws_lb.alb_front.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.front_tokyo_cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_front_target_group.arn
  }
}


resource "aws_lb" "alb_back" {
  name               = "spa-back-alb-paradimg-terraform"
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


resource "aws_lb_listener" "alb_back_listener_http" {
  load_balancer_arn = aws_lb.alb_back.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_back_target_group.arn
  }
}

resource "aws_lb_listener" "alb_back_listener_https" {
  load_balancer_arn = aws_lb.alb_back.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.back_tokyo_cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_back_target_group.arn
  }
}



# ---------------------------------------------
# target group
# ---------------------------------------------
resource "aws_lb_target_group" "alb_front_target_group" {
  name        = "spa-front-tg-paradigm-terraform"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc.id
  target_type = "ip"
  tags = {
    Name = "spa-front-tg-paradigm-shift-terraform"
  }
}

resource "aws_lb_target_group" "alb_back_target_group" {
  name        = "spa-back-tg-paradigm-terraform"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc.id
  target_type = "ip"
  tags = {
    Name = "spa-back-tg-paradigm-shift-terraform"
  }
}