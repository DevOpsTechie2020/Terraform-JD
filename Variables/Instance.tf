provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "flm" {
    tags= var.ec2_tags
    ami = var.ami_id
    instance_type = var.instance_type
    availability_zone = "us-east-1a"
    vpc_security_group_ids = [aws_security_group.mysg.id]
}
resource "aws_security_group" "mysg" {
    name = var.sg_name
    description = var.sg_description

    ingress {
        from_port = var.from_port
        to_port = var.to_port
        protocol = "-1"
        cidr_blocks = var.cidr_blocks
    }
    egress {
        from_port = var.from_port
        to_port = var.to_port
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}