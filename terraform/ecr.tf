resource "aws_ecr_repository" "ecr-front" {
  name = "spa-front-paradigm-shift-ecr-terraform"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "ecr-back" {
  name = "spa-back-paradigm-shift-ecr-terraform"

  image_scanning_configuration {
    scan_on_push = true
  }
}