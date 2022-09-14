/*
locals {
  vpc_security_group_ids = element(aws_security_group.dev_sgs.*.id, [count.index])
  [for s in var.list : upper(s)]

}
*/
resource "aws_instance" "aws-ec2_instance" {

  #count = 2
  count                  = length(var.num)
  ami                    = var.aws-ec2_instance[count.index].ami
  instance_type          = var.aws-ec2_instance[count.index].instance_type
  key_name               = aws_key_pair.key-tf.key_name
  #security_groups = [aws_se'curity_group.public_rule.id]
  vpc_security_group_ids = element(aws_security_group.dev_sgs.*.id, [var.num[count.index]])
  #vpc_security_group_ids = [aws_security_group.allow_tls.id]
  #vpc_security_group_ids = aws_security_group[0].id
  #  vpc_security_group_ids = elementaws_security_group.allow_tls[0].id]
  #subnet_id = aws_subnet.subnet[0].id
  #subnet_id = element(aws_subnet.subnet.*.id, 1)
  #subnet_id = ["${element (aws_subnet.subnet.*.name, )}"]
  subnet_id = element(aws_subnet.subnet.*.id, var.num[count.index])
  tags = {
    Name = var.aws-ec2_instance[count.index].name
  }
  depends_on = [
    aws_security_group.dev_sgs
   
  ]


}



