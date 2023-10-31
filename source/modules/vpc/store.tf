#ssm parameter resource code blocks to securely store VPC, public subnets' 1 & 2 & Private subnet id's

resource "aws_ssm_parameter" "vpc" {
  name  = format("/%s/%s", "jmtfproject", "vpc")
  type  = "String"
  value = aws_vpc.main.id
}

resource "aws_ssm_parameter" "public_subnet1" {
  name  = format("/%s/%s", "jmtfproject", "public_subnet")
  type  = "String"
  value = aws_subnet.public_subnet1.id
}

resource "aws_ssm_parameter" "public_subnet2" {
  name  = format("/%s/%s", "jmtfproject", "public_subnet2")
  type  = "String"
  value = aws_subnet.public_subnet2.id
}

resource "aws_ssm_parameter" "private_subnet" {
  name  = format("/%s/%s", "jmtfproject", "private_subnet")
  type  = "String"
  value = aws_subnet.private_subnet.id
}
