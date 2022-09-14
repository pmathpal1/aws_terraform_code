
terraform {
  backend "s3" {
    bucket = "pankajbucket11"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}


