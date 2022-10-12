resource "aws_route_table" "tfroute2" {
  #check file 01
  vpc_id = aws_vpc.tfvpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.tfnat.id
  }

  tags = {
    Name        = "Tf-RouteTable2"
    description = "Route table for outbound traffic to private subnet"
  }

  depends_on = [
    #check file 08 for dependency 
    aws_nat_gateway.tfnat
  ]
}

