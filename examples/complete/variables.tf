variable "region" {
  type        = string
  description = "AWS region"
}

variable "s3_actions" {
  type        = list(string)
  description = "Actions to allow in the policy"
}

variable "s3_resources" {
  type        = list(string)
  description = "S3 resources to apply the actions specified in the policy"
}

variable "ssm_enabled" {
  type        = bool
  description = <<-EOT
    Set `true` to store secrets in SSM Parameter Store,
    `false` to store secrets in Terraform state as outputs.
    Since Terraform state would contain the secrets in plaintext,
    use of SSM Parameter Store is recommended.
    EOT
}

