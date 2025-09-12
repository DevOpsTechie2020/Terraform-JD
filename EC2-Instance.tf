provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "flm" {
    tags={
        Name = "Terraform-server"
        Environment = "Dev"
        Project = "swiggy"
    }
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"
    vpc_security_group_ids = [aws_security_group.mysg.id]
}
resource "aws_security_group" "mysg" {
    name = "terraform-security-group"
    description = "It has all types of SG"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}