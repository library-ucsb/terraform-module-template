# create github repo
module "github_repository" {
  source                    = "github.com/library-ucsb/terraform-tfc-module-github_repository"
    
  name                      = "terraform-module-${var.module_name}"
  auto_init                 = true
  visibility                = "public"
  description               = "GitHub repository for Terraform Module: ${var.module_name}"
  has_downloads             = false
  is_template               = true
}

# ensure the 'main' branch is the default branch
resource "github_branch_default" "main" {
  repository                = module.github_repository.name
  branch                    = "main"
}

# create the s3 terraform state backend.  after the first run, the state should be migrated
# to the s3 bucket, along with a 'backend.tf' file created with the bucket details.  This file
# needs to remain with this 'init' branch. 
module "terraform_state_backend" {
  source                              = "cloudposse/tfstate-backend/aws"
  namespace                           = var.terraform_s3_backend.namespace
  environment                         = var.terraform_s3_backend.environment
  stage                               = var.terraform_s3_backend.stage
  name                                = var.terraform_s3_backend.name
  attributes                          = var.terraform_s3_backend.attributes

  terraform_backend_config_file_path = "."
  terraform_backend_config_file_name = "backend.tf"
  force_destroy                      = false
}