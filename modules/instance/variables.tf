variable "instance_name" {}
variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "vpc_id" {}
variable "subnet_id" {}
variable "allowed_ssh_cidr" {}

variable "tags" {
  type = map(string)
}