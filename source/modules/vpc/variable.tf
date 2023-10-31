variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  type        = string
  description = "cidr blocks for vpc"
  sensitive   = true
}

variable "vpc_tenancy" {
  default   = "default"
  type      = string
  sensitive = true
}

variable "vpc_name" {
  default     = "jmtfproject_vpc"
  type        = string
  description = "name for vpc"
}

variable "public_subnet1" {
  default     = "10.0.0.0/24"
  type        = string
  description = "public subnet1 cidr"
  sensitive   = true
}

variable "az1" {
  default = "us-east-1a"
  type    = string
}

variable "public_subnet1_name" {
  default     = "pub_sub1"
  type        = string
  description = "name for public subnet 1"
}

variable "public_subnet2" {
  default     = "10.0.1.0/24"
  type        = string
  description = "public subnet 2 cidr"
  sensitive   = true
}

variable "az2" {
  default = "us-east-1b"
  type    = string
}

variable "public_subnet2_name" {
  default     = "pub_sub2"
  type        = string
  description = "name for public subnet 2"
  sensitive   = true
}

variable "private_subnet" {
  default     = "10.0.2.0/24"
  type        = string
  description = "private subnet CIDR"
  sensitive   = true
}

variable "lb_out" {
  default   = ["10.0.2.0/24"]
  type      = list(string)
  sensitive = true
}

variable "default_route" {
  default   = ["0.0.0.0/0"]
  type      = list(string)
  sensitive = true
}

variable "az3" {
  default = "us-east-1c"
  type    = string
}

variable "private_subnet_name" {
  default     = "pri_sub"
  type        = string
  description = "name for private subnet"
  sensitive   = true
}

variable "igw_name" {
  default     = "jmtfproject_igateway"
  type        = string
  description = "Name of the internet gateway"
}

variable "nat-gateway-name" {
  default = "jmtfproject-ngw"
  type    = string
}

variable "ngw_cidr" {
  default   = "0.0.0.0/0"
  type      = string
  sensitive = true
}

variable "jmtfproject_pub_rt_name" {
  default = "jmtfproject_pub_rt"
  type    = string
}

variable "ngw_cidr_v6" {
  default = "::/0"
  type    = string
}

variable "jmtfproject_private_rt_name" {
  default = "jmtfproject_private_rt"
  type    = string
}

variable "lb-name" {
  default     = "jmtfproject-lb"
  type        = string
  description = "lb name"
}

variable "lb_type" {
  default     = "application"
  type        = string
  description = "lb type"
}

variable "lb_sg_name" {
  default     = "jmtfproject_lb_sg"
  type        = string
  description = "lb sg name"
}

variable "web" {
  default     = 80
  type        = number
  description = "web traffic port"
}

variable "lb_protocol" {
  default = "TCP"
  type    = string
}

variable "web-group" {
  default = "jmtfproject-target-group"
  type    = string
}

variable "lb_listener_protocol" {
  default = "HTTP"
  type    = string
}

variable "lb_action" {
  default = "forward"
  type    = string
}

variable "target_id" {
}

variable "instance_sg_name" {
  default = "jmtfproject_instance_sg"
  type    = string
}
