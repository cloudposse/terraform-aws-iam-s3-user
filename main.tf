data "aws_iam_policy_document" "default" {
  statement {
    actions   = ["${var.s3_actions}"]
    resources = ["${var.s3_resources}"]
    effect    = "Allow"
  }
}

module "s3_user" {
  source        = "git::https://github.com/cloudposse/terraform-aws-iam-system-user.git?ref=feature/cp-34/terraform-aws-s3-bucket"
  namespace     = "${var.namespace}"
  stage         = "${var.stage}"
  name          = "${var.name}"
  attributes    = "${var.attributes}"
  tags          = "${var.tags}"
  enabled       = "${var.enabled}"
  force_destroy = "${var.force_destroy}"
  path          = "${var.path}"
}
