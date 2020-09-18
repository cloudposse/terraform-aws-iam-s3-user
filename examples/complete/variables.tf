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
