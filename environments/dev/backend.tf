terraform {
  backend "s3" {
    bucket         = "acs-project-dev2025"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}