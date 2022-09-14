# ---------------------------------------------
# ecs cluster
# ---------------------------------------------

resource "aws_ecs_cluster" "ecs-cluster" {
  name = "paradigm-shift-ecs-cluster-terraform"
}

# ---------------------------------------------
# task definition
# ---------------------------------------------

resource "aws_ecs_task_definition" "task-definition" {
  family = "paradigm-shift-ecs-task-definition-terraform"
  cpu                      = "512"
  memory                   = "1024"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.app_iam_role.arn
  container_definitions = jsonencode([
    {
      name      = "paradigm-shift-ecs-container-terraform"
      image     = "683329863355.dkr.ecr.ap-northeast-1.amazonaws.com/paradigm-shift-ecs-terraform:latest"
      cpu       = 512
      memory    = 1024
      essential = true
      portMappings = [
        {
          "hostPort": 3000,
          "protocol": "tcp",
          "containerPort": 3000
        }
      ]
    }
  ])
}

# ---------------------------------------------
# ecs service
# ---------------------------------------------
resource "aws_ecs_service" "ecs-service" {
  name            = "paradigm-shift-ecs-servic-terraform"
  cluster         = aws_ecs_cluster.ecs-cluster.id
  task_definition = aws_ecs_task_definition.task-definition.arn
  desired_count   = 1
  launch_type    = "FARGATE"
  platform_version = "1.4.0"
  network_configuration {
    assign_public_ip = true
    security_groups  = [
      aws_security_group.web_sg.id,
    ]
    subnets          = [
      aws_subnet.public_subnet_1a.id,aws_subnet.public_subnet_1c.id
    ]
  }
 
  load_balancer {
    target_group_arn = aws_lb_target_group.alb_target_group.arn
    container_name   = "paradigm-shift-ecs-container-terraform"
    container_port   = 3000
  }
}