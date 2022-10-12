resource "aws_nat_gateway" "tfnat" {
  #Elastic ip creation being allocated here
  allocation_id = aws_eip.tfeip.id
  #nat gateways reside in the public subnet so we are associating it with the public subnet id
  subnet_id = aws_subnet.tfpublicsubnet.id

  tags = {
    Name = "Tf-NAT"
  }

  depends_on = [
    #check file 07 for the dependency
    aws_eip.tfeip
  ]
}