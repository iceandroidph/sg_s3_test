resource "aws_security_group" "sample_sg" {
  name        = "sample_sg_1"
  vpc_id      = "some_dummy_vpc"
  tags = {
    Name = "acme_web_wide_open"
  }
  # SSH access from anywhere
  ingress {
    to_port     = 22
    from_port   = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
