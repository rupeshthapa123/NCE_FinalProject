terraform {
  backend "s3" {
    bucket         = "acs-project-staging"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}
