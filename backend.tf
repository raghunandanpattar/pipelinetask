terraform {
  backend "s3"{
    bucket ="raghus-89511-tfstate"
    key="main"
    region ="us-east-1"
    dynamodb_table = "raghus-dynamodb-table"
  }
}