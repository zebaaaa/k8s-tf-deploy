variable "project_name" {
  description = "Project name"
  type        = string
  default     = "musician-app"
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}
# VPC
variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

# ECR 
variable "ecr_repository_names" {
  description = "List of ECR repository names for the application"
  type        = list(string)
  default     = ["musicwebapp"]  
}

#EKS
variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "musicwebapp-cluster"
}

variable "eks_node_group_name" {
  description = "Name of the EKS node group"
  type        = string
  default     = "musicwebapp-nodes"
}

variable "eks_node_instance_type" {
  description = "EC2 instance type for EKS nodes (Free Tier eligible)"
  type        = string
  default     = "t3.medium"  # Free Tier eligible
}

variable "eks_node_desired_size" {
  description = "Desired number of nodes (min 1 for Free Tier)"
  type        = number
  default     = 1
}

variable "eks_node_max_size" {
  description = "Maximum number of nodes"
  type        = number
  default     = 2
}

variable "eks_node_min_size" {
  description = "Minimum number of nodes"
  type        = number
  default     = 1
}