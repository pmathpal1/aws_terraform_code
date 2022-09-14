
variable "vpc" {
  type = string
}

variable "cidr_block" {
  type = string

}
variable "subnet" {
  type = list(object(
    {
      cidr_block = string
      name       = string
    }
  ))
}
/*
variable "ports" {
  type = list(number)

}


variable "image_id" {
  type = string

}
variable "instance_type" {
  type = string

}
*/
variable "aws-ec2_instance" {
  type = list(object(
    {
      ami           = string
      instance_type = string
      name          = string
    }

  ))
}

variable "sg" {
  type  = list
}

variable "num" {
  type  = list
}
