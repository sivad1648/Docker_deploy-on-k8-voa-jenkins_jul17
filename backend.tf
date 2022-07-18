terraform {
  backend "s3" {
    bucket = "siva-demo-bucket"
    key = "main"
    region = "ap-south-1"
    dynamodb_table = "my_dynamo_db"
  }
}