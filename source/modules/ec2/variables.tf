variable "instance_type" {
  default     = "t2.micro"
  description = "instance type"
  type        = string
}

variable "instance_sg" {

}

variable "instance_subnet" {
  
}

variable "instance_name" {
  default = "jmtfproject_instance"
  type    = string
}
