variable "ecs_cluster_name" {
  description = "ECS cluster name"
  type        = string
}

variable "ecs_service_name" {
  description = "ECS service name"
  type        = string
}

variable "cpu_threshold" {
  description = "CPU threshold for alarm"
  type        = number
  default     = 80
}

variable "memory_threshold" {
  description = "Memory threshold for alarm"
  type        = number
  default     = 80
}

variable "environment" {
  description = "Environment name"
  type        = string
}
