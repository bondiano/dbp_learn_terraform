locals {
  app_name = "web"
}

module "cluster" {
  source      = "../ecs_cluster"
  name        = var.name
  environment = var.environment
}

module "roles" {
  source      = "../ecs_roles"
  environment = var.environment
}

module "task_definition" {
  source                   = "../ecs_task_definition"
  environment              = var.environment
  name                     = var.name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  execution_role_arn       = module.roles.execution_role_arn
  task_role_arn            = module.roles.task_role_arn
  container_definitions = [
    {
      name      = local.app_name
      image     = var.image
      essential = true
      links     = []

      volumesFrom = []
      mountPoints = []
      links       = []
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
        }
      ]
    }
  ]
}

module "alb" {
  source            = "../alb"
  name              = var.name
  environment       = var.environment
  security_groups   = var.alb_sg
  subnets           = var.public_subnets
  vpc_id            = var.vpc_id
  health_check_path = "/health_check"
}

module "service" {
  source                   = "../ecs_service"
  name                     = var.name
  environment              = var.environment
  cluster_id               = module.cluster.id
  task_definition_arn      = module.task_definition.arn
  desired_count            = 2
  min_percent              = 50
  max_percent              = 300
  launch_type              = "FARGATE"
  scheduling_strategy      = "REPLICA"
  security_groups          = var.ecs_sg
  subnets                  = var.private_subnets
  aws_alb_target_group_arn = module.alb.tg_arn
  container_port           = var.container_port
  container_name           = local.app_name
}
