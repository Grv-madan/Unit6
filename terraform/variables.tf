# variables.tf
variable "ami" {
  description = "Manage node to run Ansible"
  default     = "ami-05b10e08d247fb927"  # Example for Amazon Linux 2
}

variable "instance_type" {
  description = "Managednode"
  default     = "t2.micro"
}

variable "my_ip" {
  description = "Your public IP address"
  type        = string
  default     = "172.20.10.2"  # Replace with your actual public IP
}

# Define the security group name
variable "aws_security_group_name" {
  description = "SG_gmadan"
  type        = string
  default     = "SG_gmadan"  # You can provide a default name
}

# Define the security group description
variable "aws_security_group_description" {
  description = "Description of the security group"
  type        = string
  default     = "Security group for SSH and HTTP access"
}

# Define the port for SSH (default is 22)
variable "ssh_port" {
  description = "The port to allow for SSH access"
  type        = number
  default     = 22
}

