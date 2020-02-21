###
# Generate randon id to append to every created resource name
###
resource "random_id" "this" {
  byte_length = 3
}

###
# Create common labels
###
module "labels" {
  source = "../../modules/gcp-labels"

  project_id             = var.project_id
  environment            = var.environment
  creator                = var.creator
  project_name           = var.project_name
  business_name          = var.business_name
  cost_code              = var.cost_code
  project_sponsor        = var.project_sponsor
  project_technical_lead = var.project_technical_lead
  review_date            = replace(substr(timeadd(timestamp(), "168h"), 0, 10), "-", "")
}

locals {
  gce_service_account = format("gce-%s", random_id.this.hex)
  kms_key_ring_name   = format("kms-keyring-%s", random_id.this.hex)
  kms_crypto_name     = format("kms-crypto-%s", random_id.this.hex)
}
