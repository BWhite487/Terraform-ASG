# Create a security group that allows traffic from the internet and associate it with the Auto Scaling group instances
resource "aws_security_group" "BW_sg_autoscaling" {
  name        = var.BW_sg_name
  vpc_id      = var.BW_vpc_id
  description = "Web Traffic"

  ingress {
    description = "Allow Port 80 for HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.BW_cidr_block]
  }

  ingress {
    description = "Allow Port 443 for HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.BW_cidr_block]
  }

  egress {
    description = "Allow all ip and ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.BW_cidr_block]
  }
}