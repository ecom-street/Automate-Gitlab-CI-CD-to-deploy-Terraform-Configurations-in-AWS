# Creating a public subnet
resource "aws_subnet" "tfpublicsubnet" {
  vpc_id                  = aws_vpc.tfvpc.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "Tf-public-subnet"
  }
  depends_on = [
    #here you will see two dependencies see files 01 & 02 for these dependencies
    aws_vpc.tfvpc,
    aws_internet_gateway.tfgateway
  ]
}

