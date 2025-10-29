# Create the Application Load Balancer
resource "aws_lb" "app_lb" {
  name               = "nginx-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.nginx-sg.id]
  subnets            = [
    aws_subnet.public-subnet.id,
    aws_subnet.public-subnet-2.id
  ]

  tags = {
    Name = "nginx-alb"
  }
}

# Create a Target Group for the ALB
resource "aws_lb_target_group" "app_tg" {
  name     = "nginx-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my-vpc.id
  target_type = "instance"

  health_check {
    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "nginx-target-group"
  }
}

# Attach the EC2 instance to the Target Group
resource "aws_lb_target_group_attachment" "app_tg_attachment" {
  target_group_arn = aws_lb_target_group.app_tg.arn
  target_id        = aws_instance.Nginxserver.id
  port             = 80
}

# Create a Listener for the ALB
resource "aws_lb_listener" "app_listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}