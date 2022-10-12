/* resource "aws_s3_bucket" "terraform-state-storage-s3-witcher" {
  bucket = "my-terraform-state-s3-witcher"
  versioning {
    # enable with caution, makes deleting S3 buckets tricky
    enabled = false
  }

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    name = "S3 Remote Terraform State Store"
  }
}

*/