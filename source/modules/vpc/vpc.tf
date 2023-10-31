# resource code block to create VPC
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.vpc_tenancy
  provider         = aws.jmtfproject_region

  tags = {
    Name = var.vpc_name
  }
}

# resource code block to create public subnet 1
resource "aws_subnet" "public_subnet1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet1
  availability_zone = var.az1

  tags = {
    Name = var.public_subnet1
  }
}

# resource code block to create public subnet 2
resource "aws_subnet" "public_subnet2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet2
  availability_zone = var.az2

  tags = {
    Name = var.public_subnet2
  }
}

# resource code block to create private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet
  availability_zone = var.az1

  tags = {
    Name = var.private_subnet
  }
}

# resource code block to create internet gateway
resource "aws_internet_gateway" "jmtfproject_igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.igw_name
  }
}

# resource code block to create elastic IP
resource "aws_eip" "jmtfproject_eip" {

}

# resource code block to create NAT gateway
resource "aws_nat_gateway" "jmtfproject_ngw" {
  allocation_id = aws_eip.jmtfproject_eip.id
  subnet_id     = aws_subnet.public_subnet1.id

  tags = {
    Name = var.nat-gateway-name
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.jmtfproject_igw]
}

# resource code block to create public route table
resource "aws_route_table" "jmtfproject_pub_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.ngw_cidr
    gateway_id = aws_internet_gateway.jmtfproject_igw.id
  }
  tags = {
    Name = var.jmtfproject_pub_rt_name
  }
}

# resource code block to create private route table
resource "aws_route_table" "jmtfproject_private_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = var.ngw_cidr
    nat_gateway_id = aws_nat_gateway.jmtfproject_ngw.id
  }

  tags = {
    Name = var.jmtfproject_private_rt_name
  }
}

# resource code block to create public route table association to the public subnet
resource "aws_route_table_association" "jmtfproject_rta_pub" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.jmtfproject_pub_rt.id
}

# resource code block to create private route table association to the private subnet
resource "aws_route_table_association" "jmtfproject_rta_pr" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.jmtfproject_private_rt.id
}

# resource code block to create an application load balancer
resource "aws_lb" "jmtfproject_lb" {
  name                       = var.lb-name
  internal                   = false
  load_balancer_type         = var.lb_type
  security_groups            = [aws_security_group.lb_sg.id]
  subnets                    = [aws_subnet.public_subnet1.id, aws_subnet.public_subnet2.id]
  enable_deletion_protection = false

  tags = {
    Name = var.lb-name
  }
}

# resource code block creating a load balancer security group
resource "aws_security_group" "lb_sg" {
  name        = var.lb_sg_name
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "TLS from VPC"
    from_port   = var.web
    to_port     = var.web
    protocol    = var.lb_protocol
    cidr_blocks = var.default_route

  }

  egress {
    from_port        = var.web
    to_port          = var.web
    protocol         = var.lb_protocol
    cidr_blocks      = var.lb_out
    ipv6_cidr_blocks = [var.ngw_cidr_v6]
  }

  tags = {
    Name = var.lb_sg_name
  }
}

# resource code block to create an instance security group
resource "aws_security_group" "instance_sg" {
  name        = var.instance_sg_name
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "TLS from VPC"
    from_port       = var.web
    to_port         = var.web
    protocol        = var.lb_protocol
    security_groups = [aws_security_group.lb_sg.id]
  }

  egress {
    from_port   = var.web
    to_port     = var.web
    protocol    = var.lb_protocol
    cidr_blocks = var.default_route
  }

  tags = {
    Name = var.instance_sg_name
  }
}

# resource code block to create a load balancer target group
resource "aws_lb_target_group" "web-group" {
  name     = var.web-group
  port     = var.web
  protocol = var.lb_listener_protocol
  vpc_id   = aws_vpc.main.id

  tags = {
    Name = var.web-group
  }
}

# resource code block to create a load balancer listener
resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.jmtfproject_lb.arn
  port              = var.web
  protocol          = var.lb_listener_protocol

  default_action {
    type             = var.lb_action
    target_group_arn = aws_lb_target_group.web-group.arn
  }
}

# resource code block to attach the target group to the load balancer
resource "aws_lb_target_group_attachment" "project_lb_tg_attachment" {
  target_group_arn = aws_lb_target_group.web-group.arn
  target_id        = var.target_id
  port             = var.web
}
