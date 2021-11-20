data "aws_iam_policy_document" "default" {
  count = module.this.enabled ? 1 : 0

  statement {
    actions   = var.s3_actions
    resources = var.s3_resources
    effect    = "Allow"
  }
}

module "s3_user" {
  source        = "cloudposse/iam-system-user/aws"
  version       = "0.23.0"
  force_destroy = var.force_destroy
  path          = var.path

  context = module.this.context
}

resource "aws_iam_user_policy" "default" {
  #bridgecrew:skip=BC_AWS_IAM_16:Skipping `Ensure IAM policies are attached only to groups or roles` check because this module intentionally attaches IAM policy directly to a user.
  count  = module.this.enabled ? 1 : 0
  name   = module.s3_user.user_name
  user   = module.s3_user.user_name
  policy = join("", data.aws_iam_policy_document.default.*.json)
}
