include {
  path = find_in_parent_folders()
}

dependency "bootstrap" {
  config_path = "../bootstrap"
  mock_outputs = {
    random_id                 = "123445"
    gce_service_account_email = "mock_gce_service_account_email"
    kms_key                   = "mock_kms_key"
    labels                    = { "mock_label" = "mock_label" }
  }
}

dependency "network" {
  config_path = "../network"
  mock_outputs = {
    private_subnet_name = "mock_private_subnetwork"
    public_subnet_name  = "mock_public_subnetwork"
    vpc_self_link       = "mock_vpc_self_link"
  }
}

inputs = {
  labels                    = dependency.bootstrap.outputs.labels
  gce_service_account_email = dependency.bootstrap.outputs.gce_service_account_email
  kms_key                   = dependency.bootstrap.outputs.kms_key
  private_subnetwork        = dependency.network.outputs.private_subnet_name
  public_subnetwork         = dependency.network.outputs.public_subnet_name
  random_id                 = dependency.bootstrap.outputs.random_id
  vpc_self_link             = dependency.network.outputs.vpc_self_link
}
