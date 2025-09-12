variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
    description = "ami id of joindevops RHEL"
}

variable "instance_type" {
  default = t2.micro
}

variable "ec2_tags" {
    type = map(string)
    default = {
        Name = "Terraform-Server"
        Purpose = "Variables-demo"
        Environment = "Dev"
    }
}

variable "sg_name" {
  default = "terraform-security-group"
}

variable "sg_description" {
  default = "Allowing all ports from internet"
}

variable "from_port" {
  default = 0
}

variable "to_port" {
  type = number
  default = 0
}

variable "cidr_blocks" {
  type = list(string)
  default = ["0.0.0.0/0"]
}