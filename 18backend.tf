terraform {
  backend "s3" {
    bucket = "my-terraform-state-s3-witcher"
    key    = "terraform-state/terraform.tfstate"
    region = "us-east-1"
  }
}