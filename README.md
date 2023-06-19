# koko-deployment
This repository contains deployment related files.
# provider.tf
  - This is a terraform script and it's task is to 
  - It create EC2 instance with security group.
  - I have also provided one shell script which will contain all the commands related to docker installation and fetching latest docker image from ECR and executing it. 
# kube8_installation.sh
  - This is a schell script which contains all the commands.
# Execution
 - install terraform on your machine or EC2 instance
 - run these commands: 
             - terraform init
             - terraform apply
  This will execute the docker image which contains our applicatition.
