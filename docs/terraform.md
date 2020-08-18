## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |
| aws | ~> 2.0 |
| local | ~> 1.2 |
| null | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attributes | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| delimiter | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes` | `string` | `"-"` | no |
| enabled | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| environment | Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT' | `string` | `""` | no |
| force\_destroy | Destroy even if it has non-Terraform-managed IAM access keys, login profiles or MFA devices | `bool` | `false` | no |
| name | Solution name, e.g. 'app' or 'jenkins' | `string` | `""` | no |
| namespace | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | `""` | no |
| path | Path in which to create the user | `string` | `"/"` | no |
| s3\_actions | Actions to allow in the policy | `list(string)` | <pre>[<br>  "s3:GetObject"<br>]</pre> | no |
| s3\_resources | S3 resources to apply the actions specified in the policy | `list(string)` | n/a | yes |
| stage | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `""` | no |
| tags | Additional tags (e.g. `map('BusinessUnit','XYZ')` | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| access\_key\_id | Access Key ID |
| secret\_access\_key | Secret Access Key. This will be written to the state file in plain-text |
| user\_arn | The ARN assigned by AWS for the user |
| user\_name | Normalized IAM user name |
| user\_unique\_id | The user unique ID assigned by AWS |

