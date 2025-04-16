terraform {
  backend "s3" {
    bucket         = "acs-project-prod"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}
