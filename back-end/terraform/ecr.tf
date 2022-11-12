resource "aws_ecr_repository" "ecr-repo" {
  name                 = "paradigm-shift-ecs-terraform"
  

  image_scanning_configuration {
    scan_on_push = true
  }
}