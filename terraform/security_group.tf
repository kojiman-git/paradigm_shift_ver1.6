# ---------------------------------------------
# Security Group
# ---------------------------------------------

# web security group

resource "aws_security_group" "web_sg" {
  name        = "SecurityGroup_for_paradigm_shift_terraform_spa"
  description = "web front role security group"
  vpc_id      = aws_vpc.vpc.id
  tags = {
    Name = "SecurityGroup_for_paradigm_shift_terraform_spa"
  }
}
resource "aws_security_group_rule" "web_in_http" {
  security_group_id = aws_security_group.web_sg.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 80
  to_port           = 80
  cidr_blocks       = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "web_in_https" {
  security_group_id = aws_security_group.web_sg.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 443
  to_port           = 443
  cidr_blocks       = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "web_in_tcp3000" {
  security_group_id = aws_security_group.web_sg.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 3000
  to_port           = 3000
  cidr_blocks       = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "web_in_tcp8080" {
  security_group_id = aws_security_group.web_sg.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 8080
  to_port           = 8080
  cidr_blocks       = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "web_in_ssh" {
  security_group_id = aws_security_group.web_sg.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_blocks       = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "web_out_all" {
  security_group_id = aws_security_group.web_sg.id
  type              = "egress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
}

# db security group

resource "aws_security_group" "db_sg" {
  name        = "SecurityGroup_for_paradigm_shift_db_terraform_spa"
  description = "database role security group"
  vpc_id      = aws_vpc.vpc.id
  tags = {
    Name = "SecurityGroup_for_paradigm_shift_db_terraform_spa"
  }
}
resource "aws_security_group_rule" "db_in_tcp3306" {
  security_group_id = aws_security_group.db_sg.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 3306
  to_port           = 3306
  cidr_blocks       = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "db_out_all" {
  security_group_id = aws_security_group.db_sg.id
  type              = "egress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
}

# alb security group

resource "aws_security_group" "alb_sg" {
  name        = "SecurityGroup_for_paradigm_shift_alb_terraform_spa"
  description = "alb role security group"
  vpc_id      = aws_vpc.vpc.id
  tags = {
    Name = "SecurityGroup_for_paradigm_shift_alb_terraform_spa"
  }
}

resource "aws_security_group_rule" "alb_in_http" {
  security_group_id = aws_security_group.alb_sg.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 80
  to_port           = 80
  cidr_blocks       = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "alb_in_https" {
  security_group_id = aws_security_group.alb_sg.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 443
  to_port           = 443
  cidr_blocks       = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "alb_out_all" {
  security_group_id = aws_security_group.alb_sg.id
  type              = "egress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
}