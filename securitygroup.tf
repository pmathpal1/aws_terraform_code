resource "aws_security_group" "dev_sgs" {
  count = length(var.sg)
  name        = var.sg[count.index]
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id
/*
  tags = {
    Name = "public_rule"
  }
  */
}
resource "aws_security_group_rule" "public_rule" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = element(aws_security_group.dev_sgs.*.id, 0)
}
resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = element(aws_security_group.dev_sgs.*.id, 0)
}
resource "aws_security_group_rule" "http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = element(aws_security_group.dev_sgs.*.id, 0)
}

resource "aws_security_group_rule" "private_rule" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = element(aws_security_group.dev_sgs.*.id, 1)
}
resource "aws_security_group_rule" "private_out" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.main.cidr_block]
  security_group_id = element(aws_security_group.dev_sgs.*.id, 1)
}
