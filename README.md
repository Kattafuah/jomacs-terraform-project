# AWS Terraform Project
## Training institution: Jomacs
### Author: Kwasi Attafua
### Date: 30/10/2023

# Jomacs-Terraform-Project
This is a cloud project aimed at testing my knowledge and understanding of infrastructure as code (IaC) via the use of terraform to provision AWS resources.

## Objective
Create a secure VPC environment in AWS using Terraform where an EC2 instance is running an Nginx web server. The EC2 instance should reside within a private subnet and should be accessible to the outside world via a load balancer. Traffic to the EC2 instance should be routed through a NAT gateway.

## Project Structure
![tree structure source directory](https://github.com/Kattafuah/jomacs-terraform-project/assets/16202873/85cbe821-3897-40fc-a301-060eaeaa07f7)

1. Within this jomacs-terraform-project repo is a source directory and this ReadMe.md file.
2. The source directory contains a modules directory and three files - *main.tf*, *provider.tf* and *output.tf* files.
3. The modules directory houses two sub-directories that contain two reusable modules named *vpc* and *ec2*
4. These two modules contain all the configuration files needed to provision the resources required. These files include - *vpc.tf, ec2.tf variable.tf, store.tf, data.tf, output.tf, providers.tf and script.sh*. 

## Resources that will be deployed include but are not limited to:
1. *VPC*
2. *Public Subnet 1*
3. *Public Subnet 2*
4. *Private Subnet*
5. *NAT Gateway*
6. *Internet Gateway*
7. *Application Load Balancer*
8. *Load Balancer Listener*
9. *Elastic IP (eip)*
10. *Target Group*
11. *Security Groups*
12. *Route Table Associations*
13. *Route Tables*
14. *Target Group Attachment*
15. *SSM Parameter Resources*
16. *EC2 Instance*

In all, this configuration will provision 22 resources. 

## Cloud Architecture

## How to deploy the infrastructure.
1. *Fork or clone* the repository to your local environment.
2. Move into the cloned repository. Create a branch and switch to it.
3. Change directory to the *source* directory. This contains the *modules* directory, *main.tf*, *provider.tf* and *output.tf* files.
4. Go through the code and *read the comments* modifying the code as necessary (NB terraform state files are stored in an already provisioned S3 bucket).
5. Run *terraform init* to initialize the terraform provider configuration.
6. Run *terraform plan* and *terraform apply* to have the resources created.
7. Run *terraform destroy* to destroy all resources after you're done

## Steps to validate the setup 
1. To validate this setup, copy and paste the load balancer dns name that is outputed after your resources have been created and are running into your browser address bar and hit enter.
2. You should get a response **Congratulating** for installing Nginix - just like the image below: 
