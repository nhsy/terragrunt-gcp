remote_state {
  backend = "gcs"
  config = {
    bucket   = get_env("TG_BUCKET", "terragrunt-tfstate")
    prefix   = "${path_relative_to_include()}/terraform.tfstate"
    project  = get_env("TG_PROJECT", "NULL")
    location = get_env("TG_REGION", "europe-west2")
  }
}

terraform {
  extra_arguments "common_vars" {
    commands = get_terraform_commands_that_need_vars()
    arguments = [
      "-var-file=${get_parent_terragrunt_dir()}/../common/common.tfvars"
    ]
  }

  extra_arguments "parallelism" {
    commands = get_terraform_commands_that_need_parallelism()
    arguments = [
      "-parallelism=20"
    ]
  }

  before_hook "provider" {
    commands = ["init"]
    execute  = ["cp", "${get_parent_terragrunt_dir()}/../common/providers.tf", "."]
  }
}
