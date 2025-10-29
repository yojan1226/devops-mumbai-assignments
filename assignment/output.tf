output "instance_public_ip" {
  description = "the public IP address of the EC2 instace"
  value       = aws_instance.Nginxserver.public_ip
}

output "instace_url" {
  description = "The url to access the nginx server"
  value       = "http://${aws_instance.Nginxserver.public_ip}"
}

output "alb_dns_name" {
  description = "The DNS name of the ALB to access your application"
  value       = aws_lb.app_lb.dns_name
}

output "rds_endpoint" {
  description = "The connection endpoint for the PostgreSQL database"
  value       = aws_db_instance.postgres_db.address
}

output "rds_port" {
  description = "The port for the PostgreSQL database"
  value       = aws_db_instance.postgres_db.port
}