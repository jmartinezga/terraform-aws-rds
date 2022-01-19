# Terraform RDS Postgres module

### Install dependencies

<!-- markdownlint-disable no-inline-html -->

* [`pre-commit`](https://pre-commit.com/#install)
* [`terraform-docs`](https://github.com/terraform-docs/terraform-docs)
* [`terragrunt`](https://terragrunt.gruntwork.io/docs/getting-started/install/)
* [`terrascan`](https://github.com/accurics/terrascan)
* [`TFLint`](https://github.com/terraform-linters/tflint)
* [`TFSec`](https://github.com/liamg/tfsec)
* [`infracost`](https://github.com/infracost/infracost)
* [`jq`](https://github.com/stedolan/jq)

### Install the pre-commit hook globally

```bash
DIR=~/.git-template
git config --global init.templateDir ${DIR}
pre-commit init-templatedir -t pre-commit ${DIR}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.72.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_ssm_parameter.secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [random_password.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application"></a> [application](#input\_application) | (Required) Application name | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) Environment (dev, stg, prd) | `string` | n/a | yes |
| <a name="input_rds_backup_retention_period"></a> [rds\_backup\_retention\_period](#input\_rds\_backup\_retention\_period) | (Optional) RDS Backup retention period (days). | `number` | `7` | no |
| <a name="input_rds_engine"></a> [rds\_engine](#input\_rds\_engine) | (Required) RDS Engine | `string` | n/a | yes |
| <a name="input_rds_engine_version"></a> [rds\_engine\_version](#input\_rds\_engine\_version) | (Required) RDS Engine version | `string` | n/a | yes |
| <a name="input_rds_identifier"></a> [rds\_identifier](#input\_rds\_identifier) | (Required) RDS Instance name | `string` | n/a | yes |
| <a name="input_rds_instance_class"></a> [rds\_instance\_class](#input\_rds\_instance\_class) | (Required) RDS Instance class | `string` | n/a | yes |
| <a name="input_rds_max_storage"></a> [rds\_max\_storage](#input\_rds\_max\_storage) | (Optional) RDS max allocated storage (GB). | `number` | `100` | no |
| <a name="input_rds_name"></a> [rds\_name](#input\_rds\_name) | (Required) RDS database name. | `string` | `null` | no |
| <a name="input_rds_parameter_group"></a> [rds\_parameter\_group](#input\_rds\_parameter\_group) | (Optional) RDS parameter group. | `string` | `""` | no |
| <a name="input_rds_storage"></a> [rds\_storage](#input\_rds\_storage) | (Optional) RDS allocated storage (GB). | `number` | `5` | no |
| <a name="input_rds_user"></a> [rds\_user](#input\_rds\_user) | (Required) RDS user name | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | (Required) AWS Region | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) List of policies arn. | `any` | `{}` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | (Required) VPC CIDR. | `string` | n/a | yes |
| <a name="input_vpc_security_group_list"></a> [vpc\_security\_group\_list](#input\_vpc\_security\_group\_list) | (Required) VPC Security Group id list. | `list(string)` | n/a | yes |
| <a name="input_vpc_subnet_list"></a> [vpc\_subnet\_list](#input\_vpc\_subnet\_list) | (Required) VPC Subnet id list. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rds_address"></a> [rds\_address](#output\_rds\_address) | RDS Address. |
| <a name="output_rds_endpoint"></a> [rds\_endpoint](#output\_rds\_endpoint) | RDS Endpoint. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
