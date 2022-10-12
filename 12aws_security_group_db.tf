resource "aws_security_group" "tfdbSG" {
  name        = "mysqlbSG"
  description = "Allow mysql and all outbound traffic to Database EC2 Instance."
  vpc_id      = aws_vpc.tfvpc.id

  ingress {
    description = " Allowing DB communication"
    #here we are allowing communication from our db instance
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH from public subnet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #for proper security innput your private ip address for this cidr range /32
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Tf-mysqldbSG"
  }

  depends_on = [
    #check file 11 for dependency
    aws_route_table_association.tfassoc2 ]
}

