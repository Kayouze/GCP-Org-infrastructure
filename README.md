# GCP-Org-infrastructure
This project was designed to configure and deploy a simple cloud infrastructure environment on GCP in 2 different regions for an organization using Terraform.
It also involved the creation of various folders and subfolders on GCP using Terraform, these are often required for coordinating multiple operations by the organization.

The following were achieved in this project:
1. Terraform was used to create multiple folders/departments for the ORG.
2. one virtual private cloud with 2 subnets was designed and deployed in the US and Europe respectively. HTTP and HTTPS access were activated.
3. 2 virtual machines were deployed in the US and Europe respectively, the VMs were linked to the respective subnets in their region, with HTTP and HTTPS access.
4. The VMs were logged via the Secure Shell protocol (SSH) and with the use of Linux commands, additional files were created and a Python flask app was deployed.
5. A database instance named "mysql-db" was created using terraform and company-staff information was inputted through the activation shell terminal on the GCP CONSOLE.
6. A highly customizable Google Kubernetes Engine (GKE) cluster and a corresponding node pool were configured and deployed on GCP using Terraform. In the configuration, separate secondary IP ranges were utilized for the Pods and Services, to optimize networking for scalability.
