# Terraform Two-Tier AWS Architecture

A beginner-friendly Infrastructure as Code (IaC) project that provisions a two-tier architecture on AWS using Terraform.

## Project Overview

This project creates an AWS environment with:

- A custom Virtual Private Cloud (VPC).
- A public subnet hosting a Web Server.
- A private subnet hosting a Database Server.
- Internet Gateway and routing configuration.
- Separate security groups for web and database tiers.
- EC2 instances provisioned using Terraform.

## Architecture

```text
                    Internet
                       |
                Internet Gateway
                       |
                 Public Subnet
                       |
                 Web EC2 Server
                  Apache HTTP
                       |
                  Private Subnet
                       |
                  Database EC2
```

## AWS Services Used

- Amazon EC2
- Amazon VPC
- Public and Private Subnets
- Internet Gateway
- Route Tables
- Security Groups
- Terraform

## Configuration

| Component | Configuration |
|---|---|
| AWS Region | ap-south-1 (Mumbai) |
| Instance Type | t3.micro |
| VPC CIDR | 10.0.0.0/16 |
| Public Subnet | 10.0.1.0/24 |
| Private Subnet | 10.0.2.0/24 |
| Web Server | Amazon Linux 2023 |
| Web Server Software | Apache |

The database-tier EC2 instance is provisioned in the private subnet. MySQL installation and application-level database connectivity are not included in the current implementation.

## Project Structure

```text
terraform-two-tier/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── network.tf
├── security.tf
├── compute.tf
├── terraform.tfvars.example
├── .terraform.lock.hcl
├── .gitignore
└── README.md
```

## Prerequisites

- AWS account
- AWS CLI
- Terraform
- Git
- An existing EC2 key pair

## Deployment Instructions

1. Clone this repository.
2. Configure AWS CLI credentials locally.
3. Copy `terraform.tfvars.example` to `terraform.tfvars`.
4. Update the AMI IDs, key pair name and your public IP address.
5. Initialize Terraform:

```bash
terraform init
```

6. Validate the configuration:

```bash
terraform validate
```

7. Review the deployment:

```bash
terraform plan
```

8. Deploy the infrastructure:

```bash
terraform apply
```

9. Access the web server using the public URL shown in Terraform outputs.

## Security

- HTTP access is permitted through the Web Security Group.
- SSH access should be restricted to the administrator's public IP.
- Database port 3306 is restricted to the Web Security Group.
- The private subnet has no direct Internet Gateway route.
- Sensitive Terraform state, variable files and private keys must not be committed to GitHub.

## Cleanup

To remove Terraform-managed infrastructure:

```bash
terraform destroy
```

Confirm the destruction when prompted.

## Project Outcome

Successfully provisioned a two-tier AWS network architecture using Terraform, deployed an Apache web server, verified website accessibility and established SSH connectivity to the Web Server.

---

**Technology:** Terraform | AWS | Infrastructure as Code