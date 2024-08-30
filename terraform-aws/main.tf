provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "demo-bucket" {
  bucket = "test123432bucket"

}

resource "aws_instance" "demo-ec2"{
     ami = var.ec2-ubuntu-aws
     instance_type= "t2.micro"   
      tags={
      Name ="ec2-test"
}
}
