variable "aws_region" {
  type = string
}

variable "name" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "vpc_tags" {
  type = map(string)
}

variable "availability_zone_1" {
  type = string
}

variable "availability_zone_2" {
  type = string
}

variable "subnet_1_cidr" {
  type = string
}

variable "subnet_2_cidr" {
  type = string
}

variable "subnet_1_tags" {
  type = map(string)
}

variable "subnet_2_tags" {
  type = map(string)
}
