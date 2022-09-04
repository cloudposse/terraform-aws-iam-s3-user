provider "aws" {
  region = var.region
}

module "s3_user" {
  source        = "../../"
  force_destroy = true
  s3_actions    = var.s3_actions
  s3_resources  = var.s3_resources
  ssm_base_path = "/${module.this.id}"
  ssm_enabled   = var.ssm_enabled

  context = module.this.context
}
