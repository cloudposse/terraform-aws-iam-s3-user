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

variable "create_iam_access_key" {
  type        = bool
  description = <<-EOT
    Set `true` to create an IAM Access Key for the user.
    To rotate the key, set `false` to delete it and then back to `true` to create a new key.
    Best practice is to never create a key and instead authenticate with OIDC or some other mechanism
    that does not require long-lived bearer tokens.
    EOT
  default     = true
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

variable "permissions_boundary" {
  type        = string
  description = "Permissions Boundary ARN to attach to our created user"
  default     = null
}


variable "enable_ip_filter" {
  type        = bool
  description = "If permissions policy is filtered by IP"
  default     = false
}

variable "ip_filtered_list" {
  type        = list(any)
  description = "List of IPs to filter by in permissions policy"
  default     = []
}