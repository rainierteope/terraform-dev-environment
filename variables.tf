variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "personal_ip" {
  type        = string
  description = "Personal public IP address"
  sensitive   = true
}

variable "public_key_path" {
  type        = string
  description = "Path to the public key to use"
}

variable "instance_type" {
  type        = string
  description = "Instance type of the EC2"
  default     = "t2.micro"
}

variable "volume_size" {
  type        = number
  description = "EC2 disk size in GiB"
  default     = 10
}

variable "device_os" {
  type = string
  description = "The operating system of the local device"
  default = "Linux"
}