resource "aws_security_group" "aws_security_group" {
  vpc_id = var.vpc_id
  name = var.name
  description = "Security group for ${var.name} managed by Terraform"
  tags = {
    Name = var.name
  }
  egress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "All Open"
    from_port = 0
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    protocol = "-1"
    security_groups = []
    self = false
    to_port = 0
  } ]
  dynamic "ingress"{
    for_each = var.ingress
    content {
      cidr_blocks = lookup(ingress.value, cidr_blocks, null)
      description = lookup(ingress.value, description, null)
      from_port = lookup(ingress.value, from_port, 0)
      ipv6_cidr_blocks = lookup(ingress.value, ipv6_cidr_blocks, null)
      prefix_list_ids = lookup(ingress.value, prefix_list_ids, null)
      protocol = lookup(ingress.value, protocol, -1)
      security_groups = lookup(ingress.value, security_groups, null)
      self = lookup(ingress.value, self, null)
      to_port = lookup(ingress.value, to_port, null)
    }
  }
}
