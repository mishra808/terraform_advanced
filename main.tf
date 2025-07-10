module "dev_infra" {
    source = "./infra-app"
    enviroment = "dev"
    project_name = "project001"
    block_public_access = false
    instance_type = "t2.micro"
    application_run_port = 80
    instance_count = 2
    dynamodb_table_name = "project001_dynamo_db_table"
    ec2_root_storage_size =10
}