data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
resource "aws_instance" "my_ec2_instance" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  subnet_id                   = "subnet-01b11e7120bf91e19"
  user_data                   = file("userdata.sh")
  tags = {
    Name = "terraform-user-data-ec2"
  }
}
