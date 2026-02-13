# Terraform Cloudflare resources

An ad-hoc project to configure various resources within my Cloudflare account, using the Terraform [provider](https://registry.terraform.io/providers/cloudflare/cloudflare/latest).
This project is no necessarily tied to something, so will be creating and/or deleting resources. If you intend
to use anything found here your mileage may vary (YMMV).

## Development

### Dependencies

- [terraform](https://www.terraform.io/)
- [terragrunt](https://terragrunt.gruntwork.io/)
- [terraform-docs](https://terraform-docs.io/) this is required for `terraform_docs` hooks
- [pre-commit](https://pre-commit.com/)

## Prerequisites

1. Have a [Cloudflare](https://www.cloudflare.com/en-gb/) account and [API token](https://developers.cloudflare.com/cloudflare-one/api-terraform/)

## Pre-Commit hooks

Git hook scripts are very helpful for identifying simple issues before pushing any changes. Hooks will run on every commit automatically pointing out issues in the code e.g. trailing whitespace.

To help with the maintenance of these hooks, [pre-commit](https://pre-commit.com/) is used, along with [pre-commit-hooks](https://pre-commit.com/#install).

Please following [these instructions](https://pre-commit.com/#install) to install `pre-commit` locally and ensure that you have run `pre-commit install` to install the hooks for this project.

Additionally, once installed, the hooks can be updated to the latest available version with `pre-commit autoupdate`.

## Documentation Generation

Code formatting and documentation for `variables` and `outputs` is generated using [pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform/releases) hooks that in turn uses [terraform-docs](https://github.com/terraform-docs/terraform-docs) that will insert/update documentation. The following markers have been added to the `README.md`:

```
<!-- {BEGINNING|END} OF PRE-COMMIT-TERRAFORM DOCS HOOK --->
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK --->

## Requirements

| Name                                                                        | Version             |
| --------------------------------------------------------------------------- | ------------------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform)    | >= 1.5.7, <= 1.13.4 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement_cloudflare) | ~> 5.16.0           |

## Providers

| Name                                                                  | Version |
| --------------------------------------------------------------------- | ------- |
| <a name="provider_cloudflare"></a> [cloudflare](#provider_cloudflare) | 5.16.0  |

## Modules

No modules.

## Resources

| Name                                                                                                                                                                                                                                        | Type        |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [cloudflare_dns_record.ollama_zero_trust_tunnel_dns](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record)                                                                                        | resource    |
| [cloudflare_zero_trust_tunnel_cloudflared.windows_10_localhost_zero_trust_tunnel](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zero_trust_tunnel_cloudflared)                                        | resource    |
| [cloudflare_zero_trust_tunnel_cloudflared_config.windows_10_localhost_zero_trust_tunnel_zero_trust_tunnel_config](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zero_trust_tunnel_cloudflared_config) | resource    |
| [cloudflare_zone.intuitive_judgments_dot_com_zone](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/zone)                                                                                             | data source |

## Inputs

| Name                                                                                             | Description                   | Type     | Default | Required |
| ------------------------------------------------------------------------------------------------ | ----------------------------- | -------- | ------- | :------: |
| <a name="input_cloudflare_account_id"></a> [cloudflare_account_id](#input_cloudflare_account_id) | Account identifier tag.       | `string` | n/a     |   yes    |
| <a name="input_cloudflare_api_token"></a> [cloudflare_api_token](#input_cloudflare_api_token)    | The API Token for operations. | `string` | n/a     |   yes    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK --->
