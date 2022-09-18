data "terraform_remote_state" "eip" {
  backend = "s3"
  config = {
    bucket = "my-test-bucket-guyb"
    key    = "network/03-remote-state-eip.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-locking"
  }
}