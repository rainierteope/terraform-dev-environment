# Create a VS Code development environment in AWS using Terraform

## Usage

**Clone the repository to your local machine**
```bash
git clone https://github.com/rainierteope/terraform-dev-environment
```

**Change to the clone repository directory**
```bash
cd terraform-dev-environment
```

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


**Create a terraform.tfvars for your variables**
```python
vpc_cidr_block  = "10.0.0.0/16"        # The VPC CIDR block
personal_ip     = "111.111.111.111/32" # Your public IP
public_key_path = "~/.ssh/key.pub"     # Your public key
instance_type   = "t2.nano"            # Defaults to t2.micro
volume_size     = 20                   # Defaults to 10 GiB
device_os       = "windows"            # Defaults to Linux
aws_profile     = "your-profile"       # Defaults to null. Do not set if you are going to export as environment variables
```

**Run terraform init, plan, and apply**
```bash
terraform init
terraform plan
terraform apply
```

## Authors

[@rainierteope](https://github.com/rainierteope)
