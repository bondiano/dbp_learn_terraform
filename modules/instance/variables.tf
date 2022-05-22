variable "ssh_key" {
  description = "public key path"
  type        = string
}

variable "instance_ami" {
  description = "AWS AMI"
  type        = string
}

variable "user" {
  description = "instance user"
  type        = string
}

variable "ec2_sg_id" {
  description = "EC2 security group id"
  type        = string
}
