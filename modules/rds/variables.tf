variable "db_name" {}
variable "engine" { default = "mysql" }
variable "instance_class" { default = "db.t3.micro" }
variable "username" {}
variable "password" {}
variable "vpc_id" { type = string }
variable "private_subnet_ids" {
  type = list(string)
}
variable "allowed_ec2_sg" {}
variable "tags" {
  type = map(string)
}
