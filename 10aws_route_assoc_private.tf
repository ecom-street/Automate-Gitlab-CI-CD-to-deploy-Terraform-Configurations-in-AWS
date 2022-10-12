resource "aws_route_table_association" "tfassoc2" {
  #associating the private subnet with its own route table inthis file
  subnet_id      = aws_subnet.tfprivatesubnet.id
  route_table_id = aws_route_table.tfroute2.id

  depends_on = [
    #check file 09 for dependency
    aws_route_table.tfroute2
  ]
}