variable "project_name" {
  description = "The Project Name for the App"
  type        = string
}

variable "enviroment" {
  description = "The environment for the App"
  type        = string
}

variable "block_public_access" {
  description = "Turn on off public access"
  type        = bool
}

variable "instance_type" {
  description = "The instance type for EC2"
  type        = string
}

variable "application_run_port" {
  description = "Enter port which at Application running"
  type        = number
}

variable "ec2_root_storage_size" {
  description = "Enter EC2 root size"
  type        = number
}

variable "instance_count" {
  description = "Number for EC2 instance"
  type        = number
}

variable "dynamodb_table_name" {
  description = "Name of table"
  type        = string
}

