data "aws_iam_policy_document" "default" {
  count = "${var.enabled == "true" ? 1 : 0}"

  statement {
    actions   = ["${var.s3_actions}"]
    resources = ["${var.s3_resources}"]
    effect    = "Allow"
  }
}

module "s3_user" {
  source        = "git::https://github.com/cloudposse/terraform-aws-iam-system-user.git?ref=tags/0.3.3"
  namespace     = "${var.namespace}"
  stage         = "${var.stage}"
  name          = "${var.name}"
  attributes    = "${var.attributes}"
  tags          = "${var.tags}"
  enabled       = "${var.enabled}"
  force_destroy = "${var.force_destroy}"
  path          = "${var.path}"
}

resource "aws_iam_user_policy" "default" {
  count  = "${var.enabled == "true" ? 1 : 0}"
  name   = "${module.s3_user.user_name}"
  user   = "${module.s3_user.user_name}"
  policy = "${join("", data.aws_iam_policy_document.default.*.json)}"
}
