locals {
  enabled = module.this.enabled
}


data "aws_iam_policy_document" "default" {
  count = local.enabled ? 1 : 0

  statement {
    actions   = var.s3_actions
    resources = var.s3_resources
    effect    = "Allow"
  }
}

data "aws_iam_policy_document" "kms" {
  count = local.s3_bucket_key_enabled ? 1 : 0
  statement {
    actions = [
      "kms:Decrypt",
      "kms:GenerateDataKey",
    ]
    resources = var.s3_bucket_kms_master_key_arn
    effect    = "Allow"
  }
}

module "s3_user" {
  source                        = "cloudposse/iam-system-user/aws"
  version                       = "1.0.0"
  create_iam_access_key         = var.create_iam_access_key
  force_destroy                 = var.force_destroy
  ssm_ses_smtp_password_enabled = false
  ssm_enabled                   = var.ssm_enabled
  ssm_base_path                 = var.ssm_base_path
  path                          = var.path

  context = module.this.context
}

resource "aws_iam_user_policy" "default" {
  #bridgecrew:skip=BC_AWS_IAM_16:Skipping `Ensure IAM policies are attached only to groups or roles` check because this module intentionally attaches IAM policy directly to a user.
  count  = local.enabled ? 1 : 0
  name   = module.s3_user.user_name
  user   = module.s3_user.user_name
  policy = join("", data.aws_iam_policy_document.default.*.json, data.aws_iam_policy_document.kms.*.json)
}
