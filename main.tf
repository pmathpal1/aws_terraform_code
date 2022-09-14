resource "aws_vpc" "main" {
  cidr_block = var.cidr_block

  tags = {
    Name = "Hub_VPC"
  }
}

resource "aws_subnet" "subnet" {
  count      = length(var.subnet)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet[count.index].cidr_block

  tags = {
    Name = var.subnet[count.index].name
  }
  depends_on = [
    aws_vpc.main
  ]


}


