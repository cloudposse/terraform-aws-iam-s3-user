variable "s3_actions" {
  type        = list(string)
  default     = ["s3:GetObject"]
  description = "Actions to allow in the policy"
}

variable "s3_resources" {
  type        = list(string)
  description = "S3 resources to apply the actions specified in the policy"
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "Destroy even if it has non-Terraform-managed IAM access keys, login profiles or MFA devices"
}

variable "path" {
  type        = string
  default     = "/"
  description = "Path in which to create the user"
}

variable "ssm_enabled" {
  type        = bool
  description = <<-EOT
    Set `true` to store secrets in SSM Parameter Store,
    `false` to store secrets in Terraform state as outputs.
    Since Terraform state would contain the secrets in plaintext,
    use of SSM Parameter Store is recommended.
    EOT
  default     = false
}

variable "ssm_base_path" {
  type        = string
  description = "The base path for SSM parameters where secrets are stored"
  default     = "/s3_user/"
}
