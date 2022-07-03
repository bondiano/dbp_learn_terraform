variable "var.region" {
  description = "aws region"
  type = string
}

variable "name" {
  description = "Name of the cluster"
  type        = string
}

variable "environment" {
  description = "environment"
  type        = string
}

variable "task_cpu" {
  description = "task_cpu"
  type        = number
}

variable "task_memory" {
  description = "task_memory"
  type        = number
}

variable "image" {
  description = "image"
  type        = string
}

variable "container_port" {
  description = "container_port"
  type        = number
}

variable "vpc_id" {
  description = "value of the vpc_id"
  type        = string
}

variable "public_subnets" {}

variable "ecs_sg" {
}

variable "alb_sg" {

}

variable "private_subnets" {}
