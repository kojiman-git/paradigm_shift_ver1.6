# ---------------------------------------------
# key pair
# ---------------------------------------------
resource "aws_key_pair" "keypair" {
  key_name   = "terraform-paradigm-shift-keypair"
  public_key = file("./src/terraform-paradigm-shift-keypair.pub")

  tags = {
    Name    = "terraform-paradigm-shift-keypair"
    
  }
}


# ---------------------------------------------
# EC2 Instance
# ---------------------------------------------
resource "aws_instance" "app_server" {
  ami                         = data.aws_ami.app.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet_1a.id
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.app_ec2_profile.name
  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]
  key_name = aws_key_pair.keypair.key_name
  # user_data                   = file("./src/initialize.sh")

  tags = {
    Name    = "paradigm_shift_instance_terraform"
   
  }
}