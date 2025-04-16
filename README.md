Deployment Prerequisites

AWS Account: Ensure you have an active AWS account.

S3 Bucket for Terraform State: Create a globally unique S3 bucket to store the Terraform state files. Update the backend.tf file in each environment to use this bucket.

SSH Key Pair: ssh-keygen -t rsa -b 4096 -f ~/.ssh/finalprojectkey

aws ec2 import-key-pair \
--key-name "finalprojectkey" \
--public-key-material fileb://~/.ssh/finalprojectkey.pub

Deployment Steps

Clone the Repository
Clone this repository to your local system or an AWS Cloud9 environment.

Deploy Dev Environment

cd terraform/environment/dev
terraform init
terraform plan
terraform apply --auto-approve

Deploy Prod Environment

cd terraform/environment/production
terraform init
terraform plan
terraform apply --auto-approve

Deploy Staging Environment

cd terraform/environment/staging
terraform init
terraform plan
terraform apply --auto-approve

Tip: Make note of important output values such as bastion_public_ip, web_server_public_ips, and db_server_private_ips.

Accessing Resources

Bastion Host
SSH into the Bastion Host using the IP output from the Dev environment:

ssh -i "path/to/your/private/key.pem" ec2-user@<bastion_public_ip>

Web Servers (VM1 & VM2)
Open a browser and navigate to the web servers via the ALB DNS name:

http://<alb_dns_name>

private Servers (VM3 & VM4)


Cleanup Steps

To tear down the infrastructure, destroy resources in reverse order of creation:

Destroy Dev Environment

cd terraform/environments/dev
terraform destroy --auto-approve

Destroy Prod Environment

cd ../production
terraform destroy --auto-approve

Destroy Staging Environment

cd ../staging
terraform destroy --auto-approve

Important Reminders

Replace all placeholders like bucket names, SSH key names, and personal identifiers with actual values.

Review and update security group rules to meet your security standards—especially ingress CIDR ranges.

This setup serves as a foundational implementation; further customization may be necessary depending on your use case.

Always use terraform plan before terraform apply to understand the changes being made.

Use --auto-approve cautiously, especially in production environments.
