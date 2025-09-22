resource "aws_route53_record" "www" {
  count = 4
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}" #mongodb.dive2devops.com
  type    = "A"
  ttl     = 300
  records = [aws_instance.flm[count.index].private_ip]
}