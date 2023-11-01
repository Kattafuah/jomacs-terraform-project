# AWS Terraform Project
## Training institution: Jomacs
### Author: Kwasi Attafua
### Date: 30/10/2023
### Last updated: 31/10/2023

# Jomacs-Terraform-Project
This is a cloud project aimed at testing my knowledge and understanding of infrastructure as code (IaC) via the use of terraform to provision AWS resources. It also tests my understanding and utilization of CI/CD via the Github Actions tool.

## Objective
To create a secure VPC environment in AWS using Terraform where an EC2 instance is running an Nginx web server. The EC2 instance should reside within a private subnet and should be accessible to the outside world via a load balancer. Traffic to the EC2 instance should be routed through a NAT gateway.

## Project Structure

![tree structure source directory](https://github.com/Kattafuah/jomacs-terraform-project/assets/16202873/85cbe821-3897-40fc-a301-060eaeaa07f7)

1. Within this jomacs-terraform-project repo is a source directory, a .github/workflows directory and this *README.md* file.
2. The source directory contains a modules directory and three terraform files - *main.tf*, *provider.tf* and *output.tf* files.
3. The .github/workflows directory holds an *actions.yaml* file to facilitate the utilization of Github actions which is a CI/CD tool used for automating, building, testing and deploying applications and infrastructure.
4. Workflows for Actions are defined in the YAML file *actions.yaml*. 
5. The modules directory houses two sub-directories that contain two reusable modules named *vpc* and *ec2*
6. These two modules contain all the configuration files needed to provision the resources required. These files include - *vpc.tf, ec2.tf variable.tf, store.tf, data.tf, output.tf, providers.tf and script.sh*. 

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

## Architecture

Below is a simple illustration of the architecture of the cloud solution to be deployed. 

![trialarcprop](https://github.com/Kattafuah/jomacs-terraform-project/assets/16202873/ca41703d-02b1-4b2d-923f-109081109a06)


## How to deploy the infrastructure.

*Fork or clone* the repository to your github account or local environment.

### In your local environment
1. Move into the cloned repository. Create a branch and switch to it.
2. Change directory to the *source* directory. This contains the *modules* directory, *main.tf*, *provider.tf* and *output.tf* files.
3. Go through the code and *read the comments* modifying the code as necessary (NB: terraform state files are stored in an already provisioned S3 bucket).
4. Run *terraform init* to initialize the terraform provider configuration.
5. Run *terraform plan* and *terraform apply* to have the resources created.
6. Run *terraform destroy* to destroy all resources after you're done should you have no use for the resources anymore. 
#### Steps to validate the setup
7. To validate this setup, copy and paste the load balancer dns name that is outputed after your resources have been created and are running into your browser address bar and hit enter.
8. You should get a response **Congratulating** you for installing Nginix - just like the image below:
   
![proof of setup](https://github.com/Kattafuah/jomacs-terraform-project/assets/16202873/43766e08-a810-46d3-9a00-e424ccfe3249)

### CI/CD - Deploying via GitHub Actions (Automation)
1. After going through the code, reading the comments and modifying the code as necessary in your github repo, commit your changes and push to main or the requisite branch. 
2. The first thing you'll need to do before your GitHub Actions can run is to add your AWS credentials to the repository. To do this you will need to follow these steps:

   a. Navigate to your repository and select the "Settings" tab.

   b. Once there you should see on the left a button labeled "Secret and Variables", click on that. From that dropdown menu, click on the "Actions" button.

   c. From the Actions panel that would open, click on the "New repository secret" button located on the right hand corner.

   d. Add your AWS_SECRET_ACCESS_KEY and click the "Add secret" button.

   e. Repeat *step d* and add your AWS_ACCESS_KEY_ID and click the "Add secret" button.
   
3. Subsequently select the "Actions" tab and select the requisite workflow. This should open up the workflow as shown below.
   
![githubactions_summary_test_success](https://github.com/Kattafuah/jomacs-terraform-project/assets/16202873/51d54b9f-1cce-44f2-b2dc-c98d1ca1ba1d)

4. Clicking on the "Terraform" tab under the actions.yaml should open up a successful Terraform log file as shown below.

![githubactions_test_success](https://github.com/Kattafuah/jomacs-terraform-project/assets/16202873/a4e21588-b793-4ca2-8322-81d74f17f1de)

#### Steps to validate automated setup
5. Just like working in your local environment, you can copy and paste the load balancer dns name that is outputed under the terraform apply log (above) after your resources have been created and are running into your browser address bar and hit enter.
6. You should get a response **Congratulating** you for installing Nginix.

