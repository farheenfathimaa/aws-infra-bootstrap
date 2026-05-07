output "alb_dns_name" {
  value = module.ecs.alb_dns_name
}

output "s3_bucket_arn" {
  value = module.s3.bucket_arn
}

output "db_endpoint" {
  value = module.rds.db_instance_endpoint
}
