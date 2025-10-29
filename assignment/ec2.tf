
#creation of EC2
resource "aws_instance" "Nginxserver" {
  ami                         = "ami-00af95fa354fdb788"
  instance_type               = "t3.nano"
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = [aws_security_group.nginx-sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install nginx -y
              sudo systemctl start nginx
              EOF

  tags = {
    Name = "Nginxserver"
  }
}