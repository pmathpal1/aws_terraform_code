vpc        = "Hub_VPC"
cidr_block = "10.0.0.0/16"

subnet = [
  { name = "public-subnet", cidr_block = "10.0.0.0/24" },
  { name = "private-subnet", cidr_block = "10.0.1.0/24" }
]
#ports = [22, 80, 443]
#port = [3306]   Application

aws-ec2_instance = [
  { ami = "ami-068257025f72f470d", instance_type = "t3.micro", name = "Application-EC2" },
{ ami = "ami-068257025f72f470d", instance_type = "t3.micro", name = "Data-Base-EC2" }]

sg = [ "app_sg" , "db_sg" ]

num = ["0" , "1"]