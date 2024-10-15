# Launch an Auto Scaling group that spans 2 subnets in your default vpc
resource "aws_launch_template" "BW_launch_template" {
  name                   = var.BW_launch_template_name
  image_id               = var.BW_ami
  instance_type          = var.BW_instance_type
  vpc_security_group_ids = [aws_security_group.BW_sg_autoscaling.id]
  user_data              = filebase64("InstallApache.sh")
}

resource "aws_autoscaling_group" "BW_asg" {
  desired_capacity    = 2
  max_size            = 5
  min_size            = 2
  vpc_zone_identifier = [aws_subnet.BW_subnet_1.id, aws_subnet.BW_subnet_2.id]

  launch_template {
    id      = aws_launch_template.BW_launch_template.id
    version = "$Latest"
  }
}

resource "aws_subnet" "BW_subnet_1" {
  vpc_id                  = data.aws_vpc.BW_vpc.id
  cidr_block              = var.BW_subnet_cidr_block_1
  availability_zone       = var.BW_subnet_az_1a
  map_public_ip_on_launch = true

  tags = {
    Name      = "Terraform Subnet 1"
    Terraform = "true"
  }
}

resource "aws_subnet" "BW_subnet_2" {
  vpc_id                  = data.aws_vpc.BW_vpc.id
  cidr_block              = var.BW_subnet_cidr_block_2
  availability_zone       = var.BW_subnet_az_1b
  map_public_ip_on_launch = true

  tags = {
    Name      = "Terraform Subnet 2"
    Terraform = "true"
  }
}