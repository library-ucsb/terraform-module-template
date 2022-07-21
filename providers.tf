terraform {

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.26.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "4.22.0"
    }
  }
}

# GitHub - set environment variable: GITHUB_TOKEN
provider "github" {
  owner			= var.github_owner
}

provider "aws" {
  region    = var.aws_region  
}