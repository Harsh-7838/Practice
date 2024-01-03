# Output ALB DNS name
output "alb_dns_name" {
  value = aws_lb.my_alb.dns_name
}