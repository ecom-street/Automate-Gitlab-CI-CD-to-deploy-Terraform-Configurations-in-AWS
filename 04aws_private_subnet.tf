resource "aws_subnet" "tfprivatesubnet" {
  vpc_id            = aws_vpc.tfvpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1b" 

  tags = {
    Name = "Tf-private-subnet"
  }
  depends_on = [
    #for this dependency see file 03
    aws_subnet.tfpublicsubnet
  ]
}