resource "aws_key_pair" "key" {
  key_name   = "id_ed25519"
  public_key = file("/home/sahil/.ssh/id_ed25519.pub")
}

resource "aws_default_vpc" "default_vpc" {

}



resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"

  # using default VPC
  vpc_id= aws_default_vpc.default_vpc.id
  ingress {
    description = "TLS from VPC"

    # we should allow incoming and outoging
    # TCP packets
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    # allow all traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_instance" "my_ec2" {
  ami             = var.ec2-ubuntu-aws
  instance_type   = "t2.micro"

  # refering key which we created earlier
  key_name        = aws_key_pair.key.key_name

  # refering security group created earlier
  security_groups = [aws_security_group.allow_ssh.name]

  tags={
  Name= "Secured-instance"
}
}
