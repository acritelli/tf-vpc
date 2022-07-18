terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.22.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  tags = var.vpc_tags
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = join("-", [
      var.name,
      "internet-gateway"])
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet_1_cidr
  availability_zone = var.availability_zone_1

  tags = var.subnet_1_tags
}

resource "aws_subnet" "subnet_2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet_2_cidr
  availability_zone = var.availability_zone_2
  tags = var.subnet_2_tags
}

resource "aws_security_group" "agents_security_group" {
  vpc_id = aws_vpc.vpc.id
  name = join("-", [var.name, "cfy-agents"])
}

resource "aws_security_group_rule" "agents_security_group_rule_ssh" {
  type = "ingress"
  security_group_id = aws_security_group.agents_security_group.id
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "agents_security_group_rule_outgoing" {
  type = "egress"
  security_group_id = aws_security_group.agents_security_group.id
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
