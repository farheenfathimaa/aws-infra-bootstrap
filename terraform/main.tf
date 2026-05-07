module "vpc" {
  source      = "./modules/vpc"
  environment = var.environment
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.s3_bucket_name
  environment = var.environment
}

module "ecs" {
  source            = "./modules/ecs"
  environment       = var.environment
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  container_image   = var.container_image
  db_host           = module.rds.db_instance_address
  db_name           = var.db_name
  db_user           = var.db_user
  db_password       = var.db_password
  s3_bucket_name    = module.s3.bucket_id
}

module "rds" {
  source             = "./modules/rds"
  environment        = var.environment
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  ecs_sg_id          = module.ecs.ecs_service_sg_id
  db_name            = var.db_name
  db_user            = var.db_user
  db_password        = var.db_password
}

module "cloudwatch" {
  source           = "./modules/cloudwatch"
  environment      = var.environment
  ecs_cluster_name = module.ecs.cluster_name
  ecs_service_name = module.ecs.service_name
}
