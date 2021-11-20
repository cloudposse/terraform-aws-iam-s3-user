provider "aws" {
  region = var.region
}

provider "awsutils" {
  region = var.region
}

module "s3_user" {
  source        = "../../"
  force_destroy = true
  s3_actions    = var.s3_actions
  s3_resources  = var.s3_resources

  context = module.this.context
}
