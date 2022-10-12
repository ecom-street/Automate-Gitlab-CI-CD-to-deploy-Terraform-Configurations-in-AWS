resource "aws_eip" "tfeip" {
  vpc = true
  tags = {
    Name = "Tf-eip"
  }
  depends_on = [
    #dependency check file 05
    aws_route_table_association.assoc1
  ]
}