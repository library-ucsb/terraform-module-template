variable "github_owner" {
    type                            = string
    default                         = "library-ucsb"
}

variable "module_name" {
    type                            = string
}

variable "aws_region" {
    type                            = string
    default                         = "us-west-2"  
}

variable "terraform_s3_backend" {
    type = object({
        namespace                   = string
        environment                 = string
        stage                       = string
        name                        = string
        attributes                  = list(string)
    })
  
}