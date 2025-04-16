terraform {
  backend "s3" {
    bucket         = "acs-project-final-prod"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}
