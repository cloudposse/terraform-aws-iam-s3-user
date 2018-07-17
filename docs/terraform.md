
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| attributes | Additional attributes (e.g. `1`) | list | `<list>` | no |
| delimiter | Delimiter to be used between `namespace`, `stage`, `name` and `attributes` | string | `-` | no |
| enabled | Set to false to prevent the module from creating any resources | string | `true` | no |
| force_destroy | Destroy even if it has non-Terraform-managed IAM access keys, login profiles or MFA devices | string | `false` | no |
| name | Application or solution name (e.g. `app`) | string | - | yes |
| namespace | Namespace (e.g. `cp` or `cloudposse`) | string | - | yes |
| path | Path in which to create the user | string | `/` | no |
| s3_actions | Actions to allow in the policy | list | `<list>` | no |
| s3_resources | S3 resources to apply the actions specified in the policy | list | - | yes |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | string | - | yes |
| tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`) | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| access_key_id | The access key ID |
| secret_access_key | The secret access key. This will be written to the state file in plain-text |
| user_arn | The ARN assigned by AWS for the user |
| user_name | Normalized IAM user name |
| user_unique_id | The user unique ID assigned by AWS |

