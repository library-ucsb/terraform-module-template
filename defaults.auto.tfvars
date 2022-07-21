github_owner                    = "library-ucsb"

# This will be used throughout the module.  terraform-module-MODULE_NAME
module_name                     = "template"

terraform_s3_backend = {
  namespace                     = "ucsb-library"
  environment                   = "iac-github"
  stage                         = "tf-module-template"
  name                          = "terraform"
  attributes                    = [ "state" ]
}