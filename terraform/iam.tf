
# ---------------------------------------------
# IAM Role
# ---------------------------------------------

resource "aws_iam_role" "app_iam_role" {
  name               = "spa-paradigm-shift-iam-role-terraform"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
}

data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "amazon_ecs_task_execution_role_policy" {
  role       = aws_iam_role.app_iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}