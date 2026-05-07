output "cluster_name" {
  value = aws_ecs_cluster.this.name
}

output "service_name" {
  value = aws_ecs_service.main.name
}

output "alb_dns_name" {
  value = aws_lb.main.dns_name
}

output "ecs_service_sg_id" {
  value = aws_security_group.ecs_service.id
}
