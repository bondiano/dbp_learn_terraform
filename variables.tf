variable "region" {
  description = "aws region"
  type        = string
}

variable "image" {
  description = "container image you will run on the instance"
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

variable "container_port" {
  description = "container_port"
  type        = number
}

variable "environment" {
  description = "environment"
  type        = string
}

variable "project" {
  description = "project name"
  type        = string
}

variable "cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "private_subnets" {
  description = "List of private subnets"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of public subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}
