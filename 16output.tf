

output "Web_public_ip" {
  value = aws_instance.tfweb.public_ip
}

output "Mysql_Instance_id" {
  value = aws_instance.tfsql.id
}

