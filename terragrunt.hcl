# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# Terragrunt is a thin wrapper for Terraform/OpenTofu that provides extra tools for working with multiple modules,
# remote state, and locking: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------

locals {
  region       = "london"
  project_name = "adhoc-cloudflare"
}

#-------------------------------------------------------------------------------------------
# GLOBAL INPUTS
# These inputs apply to all terragrunt configurations in this subfolder. 
# There will be automatically merged into the child `terragrunt.hcl` using `include {}` block.
#-------------------------------------------------------------------------------------------

inputs = {
  region                = "${local.region}"
  project_name          = "${local.project_name}"
  cloudflare_api_token  = ""
  cloudflare_account_id = ""
}