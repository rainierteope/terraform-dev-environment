resource "random_integer" "rand_int" {
  min = 0
  max = 254
}

resource "aws_vpc" "dev_env_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "${local.project_name}-vpc"
  }
}

resource "aws_subnet" "dev_env_subnet" {
  vpc_id                  = aws_vpc.dev_env_vpc.id
  cidr_block              = cidrsubnet(var.vpc_cidr_block, 8, random_integer.rand_int.id)
  map_public_ip_on_launch = true

  tags = {
    Name = "${local.project_name}-public-subnet"
  }
}

resource "aws_internet_gateway" "dev_env_gw" {
  vpc_id = aws_vpc.dev_env_vpc.id

  tags = {
    Name = "${local.project_name}-igw"
  }
}

resource "aws_route_table" "dev_env_rtb" {
  vpc_id = aws_vpc.dev_env_vpc.id

  tags = {
    Name = "${local.project_name}-rtb"
  }
}

resource "aws_route" "dev_env_route" {
  route_table_id         = aws_route_table.dev_env_rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.dev_env_gw.id
}

resource "aws_route_table_association" "rtb_association" {
  subnet_id      = aws_subnet.dev_env_subnet.id
  route_table_id = aws_route_table.dev_env_rtb.id
}

resource "aws_security_group" "dev_env_allow_all" {
  name        = "${local.project_name}-allow-all"
  description = "Allow all traffic from your public IP"
  vpc_id      = aws_vpc.dev_env_vpc.id

  ingress {
    description = "Allow all traffic from your public IP"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.personal_ip]
  }

  egress {
    description = "Allow all traffic from the instances to the internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.project_name}-allow-all"
  }
}

resource "aws_key_pair" "dev_env_key" {
  key_name   = "${local.project_name}-key"
  public_key = file("${var.public_key_path}")
}

resource "aws_instance" "dev_env_ec2" {
  ami                    = data.aws_ami.dev_env_ami.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.dev_env_key.id
  subnet_id              = aws_subnet.dev_env_subnet.id
  vpc_security_group_ids = [aws_security_group.dev_env_allow_all.id]
  user_data              = file("user_data.tpl")

  root_block_device {
    volume_size = var.volume_size
    tags = {
      Name = "${local.project_name}-ec2-root"
    }
  }

  tags = {
    Name = "${local.project_name}-ec2"
  }

  provisioner "local-exec" {
    command = templatefile(local.ssh_config_file[lower(var.device_os)], {
      hostname = self.public_ip
      user = "ubuntu"
      identityfile = var.public_key_path
    })
    interpreter = lower(var.device_os) == "linux" ? ["bash", "-c"] : ["Powershell", "-Command"]
  }
}