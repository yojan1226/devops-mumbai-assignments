resource "aws_security_group" "nginx-sg" {
  vpc_id = aws_vpc.my-vpc.id

  #Inbound rule for HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Outbound rule 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nginxServer"
  }

}

#RDS security group
resource "aws_security_group" "rds_sg" {
  name        = "rds-postgres-sg"
  description = "Allow PostgreSQL access from ECS tasks"
  vpc_id      = aws_vpc.my-vpc.id

  # Example: allow only from ECS or app servers
  ingress {
    description     = "Allow PostgreSQL access from ECS/App SG"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.nginx-sg.id] # Replace with ECS/app SG
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-postgres-sg"
  }
}

# Subnet group for private subnets
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-private-subnet-group"
  description = "Subnet group for RDS in private subnets"
  subnet_ids  = [
    aws_subnet.private-subnet.id,
    aws_subnet.private-subnet-2.id
  ]

  tags = {
    Name = "rds-subnet-group"
  }
}
