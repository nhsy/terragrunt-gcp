# terragrunt-gcp

The aim of this repo is to provide familiarisation with the gcp cloud environment, terraform and terragrunt.

## Development Environment
Preferred software and platform are described below:
* IntelliJ or VSCode
* Git
* Google Cloud SDK
* Terraform
* Terraform-docs
* Terragrunt

## Platform
A native bash shell provides the best user experience.
* GCP CloudShell
* Linux
* MacOS
* Windows with Docker or WSL

## Authentication
Terraform requires application default authentication setup as follows:
```shell script
gcloud auth application-default login
```

If using GCP CloudShell, then authentication is already setup.

## IAM Role
For ease of use, the project owner role is needed by the iam user or service account.

# Resources
The terraform code deploys the following resources:

* Bastion & Management GCE instances
* GCE Service Account
* Firewall rules to allow Identity Aware Proxy and SSH ingress
* KMS Key
* VPC with Public and Private Subnets

# Usage
## Pre-requisites
Create the file named common/common.tfvars and populate variables accordingly.
```hcl
region                  = "europe-west2"
project_id              = "gcp-project-id"
project_name            = "my-project"
project_sponsor         = "joe-bloggs"
project_technical_lead  = "joe-bloggs"
cost_code               = "123456"
business_name           = "dept-1"
creator                 = "owner"
```

Export the variables below in your shell:
```shell script
export TG_BUCKET=     # Name of the Terraform State Bucket to create
export TG_PROJECT=    # Project ID of the Terraform State Bucket to create
export TG_REGION=     # REGION of the Terraform State Bucket to create
```

Enable the APIs below on your GCP project:
```shell script
for api in \
    cloudkms.googleapis.com \
    cloudresourcemanager.googleapis.com \
    compute.googleapis.com \
    iam.googleapis.com \
    iap.googleapis.com \
    storage-api.googleapis.com; \
do; \
    echo enabling $api; \
    gcloud services enable $api; \
done 
```

## Deployment
Execute the commands below from the [platform](platform) directory.
```shell script
terragrunt plan-all
terragrunt apply-all
```

## Destruction
Execute the commands below from the [platform](platform) directory.
```shell script
terragrunt destroy-all
```

# Exercises
Execute the commands below from the [platform](platform) directory.

## SSH to the compute instances
The gcloud command below creates a SSH session to the bastion compute instance over the public ip address.
```shell script
gcloud compute ssh $(cd compute;terraform output bastion_name) \
  --zone $(cd compute;terraform output bastion_zone)
```
The gcloud command below creates a SSH session to the management compute instance over the private ip address using identity aware proxy.
```shell script
gcloud compute ssh $(cd compute;terraform output mgmt_name) \
  --zone $(cd compute;terraform output mgmt_zone) \
  --tunnel-through-iap
```