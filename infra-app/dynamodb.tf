resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "${var.enviroment}-${var.dynamodb_table_name}"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"
  

  attribute {
    name = "LockID"
    type = "S"
  }

  

  tags = {
    Name        = "dev-state-table"
    Environment = "dev"
  }
}