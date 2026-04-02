

variable "vpc_cidr" {}
variable "az1" {}
variable "az2" {}

variable "public_subnet_cidr_1" {}
variable "public_subnet_cidr_2" {}

variable "private_subnet_cidr_1" {}
variable "private_subnet_cidr_2" {}

variable "tags" {
  type = map(string)
}