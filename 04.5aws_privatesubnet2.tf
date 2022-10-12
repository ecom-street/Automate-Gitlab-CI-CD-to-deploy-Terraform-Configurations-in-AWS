resource "aws_subnet" "tfprivatesubnet2" {
  vpc_id            = aws_vpc.tfvpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "Tf-private-subnet2"
  }
  depends_on = [
    #for this dependency see file 03
    aws_subnet.tfpublicsubnet
  ]
}