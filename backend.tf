terraform {
  backend "s3" {
    bucket = "siva-demo-bucket"
    key = "main"
    region = var.region
    dynamodb_table = "my_dynamo_db"
  }
}