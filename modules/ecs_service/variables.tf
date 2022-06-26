variable "name" {
  description = "the name of your stack, e.g. \"demo\""
}

variable "environment" {
  description = "the name of your environment, e.g. \"prod\""
}

variable "cluster_id" {
  description = "cluster id"
}

variable "task_definition_arn" {
  description = "task_definition_arn"
}

variable "desired_count" {
  description = "desired_count"
}

variable "min_percent" {
  description = "min_percent"
}

variable "max_percent" {
  description = "max_percent"
}

variable "launch_type" {
  description = "launch_type"
}

variable "scheduling_strategy" {
  description = "scheduling_strategy"
}

variable "security_groups" {
  description = "ecs_service_security_groups"
}

variable "subnets" {
  description = "subnets"
}

variable "aws_alb_target_group_arn" {
  description = "aws_alb_target_group_arn"
  default     = ""
}

variable "container_port" {
  description = "container_port"
  default     = 80
}

variable "container_name" {
  description = "container_name"
  default     = ""
}
