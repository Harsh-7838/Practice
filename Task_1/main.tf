# Create VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}


# Create subnets using count
resource "aws_subnet" "subnets" {
  count = length(var.subnet_configs)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_configs[count.index].cidr_block
  availability_zone       = var.subnet_configs[count.index].availability_zone
  map_public_ip_on_launch = var.subnet_configs[count.index].public
}

# Create security group for EC2 instance
resource "aws_security_group" "ec2_sg" {
  name        = "ec2_sg"
  description = "Allow inbound traffic to EC2 instance"

  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create EC2 instance in a private subnet
resource "aws_instance" "ec2_instance" {
  ami           = "ami-xxxxxxxxxxxxxxxx" # Replace with your desired AMI
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnets[2].id  # Choosing the first private subnet

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "EC2_Instance"
  }
}

# Create Application Load Balancer (ALB) in public subnets
resource "aws_lb" "my_alb" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ec2_sg.id]
  subnets            = [aws_subnet.subnets[0].id, aws_subnet.subnets[1].id]
}


