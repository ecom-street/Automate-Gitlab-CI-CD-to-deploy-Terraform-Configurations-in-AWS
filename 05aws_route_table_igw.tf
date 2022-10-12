# Creating a Routing Table
resource "aws_route_table" "tfroute1" {
  vpc_id = aws_vpc.tfvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tfgateway.id
  }

  tags = {
    Name        = "Tf-RouteTable1"
    description = "Route table for inbound traffic to vpc"
  }

  depends_on = [
    #by now you probably get the point but check files 01, 02, & 03 for dependcies
    aws_vpc.tfvpc,
    aws_internet_gateway.tfgateway,
    aws_subnet.tfpublicsubnet
  ]
}

