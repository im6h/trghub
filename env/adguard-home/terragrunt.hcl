locals {
  env_vars = yamldecode(file("${find_in_parent_folders("env.yaml")}"))
  secret   = yamldecode(file("${find_in_parent_folders("secret.yaml")}"))
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }

  config = {
    bucket  = "${local.secret.aws.bucket}"
    key     = "envs/${local.env_vars.environment}/${path_relative_to_include()}/tf.state"
    region  = "us-east-2"
    encrypt = true
    profile = "${local.secret.aws.profile}"
  }
}

terraform {
  after_hook "success" {
    commands     = ["apply"]
    execute      = ["echo", "Changes have been applied successfully"]
    run_on_error = false
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
  terraform {
    required_providers {
      vultr = {
        source  = "vultr/vultr"
        version = "~> 2.15.1"
      }
    }
  }
  provider "vultr" {
    api_key     = var.api_key
    rate_limit  = 100
    retry_limit = 3
  }
EOF
}

######
### Global parameters
#####

inputs = merge(
  local.env_vars,
  local.secret
) 