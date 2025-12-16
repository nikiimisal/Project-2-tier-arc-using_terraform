


# print app server

  output "public_ip" {
    value = aws_instance.public_server.public_ip
  }

# print db-server

  output "private_ip" {
    value = aws_instance.private_server.private_ip
  }






