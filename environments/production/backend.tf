#terraform {
#  backend "s3" {
#    bucket         = "acs-project-prod-2025"
#    key            = "terraform.tfstate"
#    region         = "us-east-1"
#  }
#}

terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}
