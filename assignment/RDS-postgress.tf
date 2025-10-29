
#creation of RDS postgress 
resource "aws_db_instance" "postgres_db" {
  identifier             = "prod-postgres-db"
  engine                 = "postgres"
  engine_version         = "15"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  max_allocated_storage  = 100

  # Database settings
  db_name                = "myappdb"
  username               = "dbadmin"
  password               = "qwerty123!"
  port                   = 5432

  # Networking
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  publicly_accessible    = false
  multi_az               = true

  # Maintenance & Backup
  backup_retention_period = 7
  backup_window           = "03:00-06:00"
  maintenance_window      = "Sun:06:00-Sun:07:00"
  auto_minor_version_upgrade = true

  # Monitoring
  monitoring_interval = 0
  performance_insights_enabled = true

  deletion_protection = false
  skip_final_snapshot = true

  tags = {
    Name = "prod-postgres-db"
  }
}
