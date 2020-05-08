data "aws_ami" "ubuntu-image" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "atlas-test-server" {
  ami = data.aws_ami.ubuntu-image.id
  instance_type = var.INSTANCE_TYPE
  key_name = var.KEY_NAME
  user_data = file("${path.module}/scripts/install-mongo-client.sh")
  
  # the VPC subnet
  subnet_id = element(module.main-vpc.public_subnets, 0)
  
  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  root_block_device {
    volume_size = "10"
    volume_type = "standard"
  }
  
  tags = {
    Name = "ATLAS-TEST-SERVER"
    Terraform = "true"
  }
}

resource "aws_security_group" "allow-ssh" {
  vpc_id      = module.main-vpc.vpc_id
  name        = "allow-ssh"
  description = "security group that allows tcp traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name         = "allow-open-ssh"
    Terraform    = "true"
  }
}