# main.tf

# Retrieve the security group by its name
data "aws_security_group" "selected" {
  name = var.aws_security_group_name
}
resource "aws_instance" "managednode" {
  ami           = var.ami # Replace with the correct AMI ID for your region (use Amazon Linux 2 AMI)
  instance_type = var.instance_type

vpc_security_group_ids = [data.aws_security_group.selected.id]
  # Tagging the instance for easier identification
  tags = {
    Name = "Managednode"
  }
  # Set the key pair for SSH access
  key_name = "manaednodekey"  # Make sure you have the SSH key pair created in your AWS account
}

# Create the Security Group
resource "aws_security_group" "my_security_group" {
  name        = var.aws_security_group_name
  description = var.aws_security_group_description

  # Inbound rules to allow SSH access from your IP
  ingress {
    from_port   = var.ssh_port  # Use the SSH port defined in variables.tf
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ip}/32"]  # Allow access from your IP address
  }

  # Outbound rules (allow all outbound traffic by default)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.aws_security_group_name
  }
  
}

