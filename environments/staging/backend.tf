terraform {
  backend "s3" {
    bucket         = "acs-project-staging-s3"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}