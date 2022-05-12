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
}
