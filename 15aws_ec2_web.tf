resource "aws_instance" "tfweb" {
  ami           = "ami-02354e95b39ca8dec" #region specific
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer.key_name #depends on file 13
  subnet_id     = aws_subnet.tfpublicsubnet.id   #depends on file 03
  user_data     = <<EOF
	  #!/bin/bash 
    sudo yum update -y 
    sudo yum install httpd -y 
    sudo service httpd start 
    sudo chkconfig httpd on
EOF

  vpc_security_group_ids = [
    #depends on file 11
    aws_security_group.tfwebSG.id
  ]

  tags = {
    Name = "Web"
  }

  depends_on = [
    #depends on file 14
    aws_instance.tfsql
  ]
}

