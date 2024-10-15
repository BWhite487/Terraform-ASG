terraform {
backend "s3" {
    bucket = "bwhite-terraform-s3-bucket"
    key    = "terraform-asg-deployment/terraform.tfstate"
    region = "us-east-1"
  }
}