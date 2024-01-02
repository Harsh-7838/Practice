# Output EC2 instance public IP
output "ec2_public_ip" {
  value = aws_instance.ec2_instance.public_ip
}

# Output ALB DNS name
output "alb_dns_name" {
  value = aws_lb.my_alb.dns_name
}