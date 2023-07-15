# Create a VS Code development environment in AWS using Terraform

<br>

## Usage

**Clone the repository to your local machine**
```bash
git clone https://github.com/rainierteope/terraform-dev-environment
```

<br>

**Change to the clone repository directory**
```bash
cd terraform-dev-environment
```

<br>

**Export your AWS credentials**

Linux
```bash
export AWS_ACCESS_KEY_ID="<YOUR_ACCESS_KEY>"
export AWS_SECRET_ACCESS_KEY="<YOUR_SECRET_ACCESS_KEY>"
```

Windows
```powershell
$env:AWS_ACCESS_KEY_ID = "<YOUR_ACCESS_KEY>"
$env:AWS_SECRET_ACCESS_KEY = "<YOUR_SECRET_ACCESS_KEY>"
```


<br>

**Generate a key-pair for SSH access**
```bash
ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/home/user/.ssh/id_rsa):
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/user/.ssh/id_rsa
Your public key has been saved in /home/user/.ssh/id_rsa.pub
-----
```

<br>

**Create a terraform.tfvars for your variables**
```python
region          = "ap-southeast-1"     # The AWS region to use. Defaults to ap-southeast-1
vpc_cidr_block  = "10.0.0.0/16"        # The VPC CIDR block
personal_ip     = "111.111.111.111/32" # Your public IP
public_key_path = "~/.ssh/key.pub"     # Your public key
instance_type   = "t2.nano"            # Defaults to t2.micro
volume_size     = 20                   # Defaults to 10 GiB
device_os       = "windows"            # Defaults to Linux
aws_profile     = "your-profile"       # Defaults to null. Do not set if you are going to export as environment variables
```

<br>

**Run terraform init, plan, and apply**
```bash
terraform init
terraform plan
terraform apply
```

<br>

## Authors

[@rainierteope](https://github.com/rainierteope)
