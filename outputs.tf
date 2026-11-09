output "web_server_public_ip" {
  description = "Public IP address of the web server"
  value       = aws_instance.web.public_ip
}

output "web_server_url" {
  description = "URL of the web server"
  value       = "http://${aws_instance.web.public_ip}"
}

output "db_server_private_ip" {
  description = "Private IP address of the database server"
  value       = aws_instance.db.private_ip
}