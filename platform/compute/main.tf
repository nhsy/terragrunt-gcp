
###
# Create bastion gce instnace
###
module "bastion" {
  source           = "../../modules/gcp-compute"
  name             = local.bastion_instance_name
  network          = var.vpc_self_link
  region           = var.region
  service_account  = var.gce_service_account_email != null ? var.gce_service_account_email : data.google_compute_default_service_account.this.email
  subnetwork       = var.public_subnetwork
  machine_type     = var.machine_type
  labels           = var.common_labels
  zone             = random_shuffle.zone.result[0]
  image            = data.google_compute_image.centos7.self_link
  enable_public_ip = true
  metadata         = local.common_metadata
  kms_key          = var.kms_key
  tags             = ["bastion"]
}


###
# Create management gce instnace
###
module "mgmt" {
  source          = "../../modules/gcp-compute"
  name            = local.mgmt_instance_name
  network         = var.vpc_self_link
  region          = var.region
  service_account = var.gce_service_account_email != null ? var.gce_service_account_email : data.google_compute_default_service_account.this.email
  subnetwork      = var.private_subnetwork
  machine_type    = var.machine_type
  labels          = var.common_labels
  zone            = random_shuffle.zone.result[0]
  image           = data.google_compute_image.centos7.self_link
  metadata        = local.common_metadata
  kms_key         = var.kms_key
  tags            = ["mgmt"]
}

###
# Create unique names for resources
###
locals {
  bastion_instance_name = format("bastion-%s", var.random_id)
  mgmt_instance_name    = format("mgmt-%s", var.random_id)
  common_metadata = {
    environment = var.environment
    project     = var.project_id
    workspace   = terraform.workspace
  }
}
