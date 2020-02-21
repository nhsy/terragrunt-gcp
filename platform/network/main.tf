###
# Create VPC
###
module "vpc" {
  source = "../../modules/gcp-vpc"

  common_labels      = var.labels
  create_nat_gateway = var.create_nat_gateway
  project_id         = var.project_id
  region             = var.region
  router_name        = local.router_name
  vpc_name           = local.vpc_name
}

###
# Create subnetworks
###
module "private_subnet" {
  source = "../../modules/gcp-subnet"

  enable_flow_logs         = var.enable_flow_logs
  ip_cidr_range            = cidrsubnet(var.network_cidr, 8, 128)
  network                  = module.vpc.name
  private_ip_google_access = true
  region                   = var.region
  subnet_name              = format("%s-%s", "private", var.random_id)
}

module "public_subnet" {
  source = "../../modules/gcp-subnet"

  enable_flow_logs         = var.enable_flow_logs
  ip_cidr_range            = cidrsubnet(var.network_cidr, 8, 1)
  network                  = module.vpc.name
  private_ip_google_access = true
  region                   = var.region
  subnet_name              = format("%s-%s", "public", var.random_id)
}


###
# Create unique names for resources
###
locals {
  vpc_name       = format("%s-%s", var.vpc_prefix, var.random_id)
  router_name    = format("%s-%s", var.router_prefix, var.random_id)
  workstation_ip = ["${chomp(data.http.workstation_ip.body)}/32"]

  common_metadata = {
    environment = var.environment
    project     = var.project_id
    workspace   = terraform.workspace
  }
}
