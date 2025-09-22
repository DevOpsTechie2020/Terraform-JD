resource "aws_route53_record" "www" {
  for_each = aws_instance.flm
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}" #mongodb.dive2devops.com
  type    = "A"
  ttl     = 300
  records = [each.value.private_ip]
}