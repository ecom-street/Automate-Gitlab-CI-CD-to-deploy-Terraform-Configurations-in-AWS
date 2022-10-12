resource "aws_route_table_association" "assoc1" {
  #we are now associcating route table no. 1 with our public subnet
  subnet_id      = aws_subnet.tfpublicsubnet.id
  route_table_id = aws_route_table.tfroute1.id
  depends_on = [
    #check files 05 for this dependency
    aws_route_table.tfroute1
  ]
}