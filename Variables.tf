variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "BW_subnet_cidr_block_1" {
  type    = string
  default = "172.31.101.0/24"
}

variable "BW_subnet_cidr_block_2" {
  type    = string
  default = "172.31.102.0/24"
}

variable "BW_subnet_az_1a" {
  type    = string
  default = "us-east-1a"
}

variable "BW_subnet_az_1b" {
  type    = string
  default = "us-east-1b"
}

variable "BW_sg_name" {
  type    = string
  default = "Terraform ASG Security Group"
}

data "aws_vpc" "BW_vpc" {
  default = true
}

variable "BW_vpc_id" {
  type    = string
  default = "vpc-00b956c34d98ec626"
}

variable "BW_cidr_block" {
  type    = string
  default = "0.0.0.0/0"
}

variable "BW_launch_template_name" {
  type    = string
  default = "LaunchTemplate-Terraform"
}

variable "BW_ami" {
  type    = string
  default = "ami-06b21ccaeff8cd686"
}

variable "BW_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "BW_s3_bucket_name" {
  type    = string
  default = "BWHITE-terraform-s3-bucket"
}