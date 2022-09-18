terraform {
  backend "s3" {
    # Reference to the S3 Bucket
    bucket = "my-test-bucket-guyb" # aws_s3_bucket.my-terraform-bucket.id
    # Path to tfstate file location on the S3 Bucket
    key    = "network/terraform-02-dynamodb.tfstate"
    # Bucket instance region
    region = "us-east-1"
    dynamodb_table = "terraform-state-locking"
  }
}

#resource "aws_s3_bucket" "terraform_state" {
#  bucket = "guyb-test-tfstate-bucket"
#
#  lifecycle {
#    prevent_destroy = true
#  }
#}
#
#resource "aws_s3_bucket_versioning" "terraform_state" {
#  bucket = aws_s3_bucket.terraform_state.id
#
#  versioning_configuration {
#    status = "Enabled"
#  }
#}
#
#resource "aws_dynamodb_table" "terraform_state_lock" {
#  name           = "app-state"
#  read_capacity  = 1
#  write_capacity = 1
#  hash_key       = "LockID"
#
#  attribute {
#    name = "LockID"
#    type = "S"
#  }
#}
#
