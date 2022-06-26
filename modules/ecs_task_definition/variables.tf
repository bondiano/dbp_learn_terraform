variable "environment" {
  description = "environment"
  type        = string
}

variable "name" {
  description = "name"
  type        = string
}

variable "network_mode" {
  description = "network_mode"
  type        = string
}

variable "requires_compatibilities" {
  description = "requires_compatibilities"
  type        = list(string)
}

variable "cpu" {
  description = "cpu"
  type        = number
}

variable "memory" {
  description = "memory"
  type        = number
}

variable "execution_role_arn" {}

variable "task_role_arn" {}

variable "container_definitions" {}
