resource "aws_instance" "web" {
  ami                         = var.web_ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
    dnf install -y httpd
    systemctl enable --now httpd
    echo "<h1>Terraform Two-Tier Architecture</h1><p>Web Server is Running!</p>" > /var/www/html/index.html
  EOF

  tags = {
    Name = "Terraform-Web-Server"
  }
}

resource "aws_instance" "db" {
  ami                    = var.db_ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  key_name               = var.key_name

  associate_public_ip_address = false

  tags = {
    Name = "Terraform-DB-Server"
  }
}