include {
  path = find_in_parent_folders()
}

dependency "bootstrap" {
  config_path = "../bootstrap"
  mock_outputs = {
    random_id = "12345"
    labels    = { "mock_label" = "mock_label" }
  }

}

inputs = {
  random_id = dependency.bootstrap.outputs.random_id
  labels    = dependency.bootstrap.outputs.labels
}
