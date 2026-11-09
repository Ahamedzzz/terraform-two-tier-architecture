
variable "aws_region" {
  description = "AWS deployment region"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "Private subnet CIDR"
  type        = string
  default     = "10.0.2.0/24"
}

variable "web_ami_id" {
  description = "AMI ID for web server"
  type        = string
}

variable "db_ami_id" {
  description = "AMI ID for database server"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}

variable "admin_ip" {
  description = "Your public IP address in CIDR notation"
  type        = string
}