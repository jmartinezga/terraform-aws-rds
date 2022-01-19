# Common variables
region      = "eu-west-1"
application = "helloworld"
environment = "dev"

# Module variables
rds_identifier     = "postgres-rds"
rds_engine         = "postgres"
rds_engine_version = "9.6.23"
rds_instance_class = "db.t2.micro"
rds_user           = "postgres"

# Networking
vpc_cidr                = "10.0.0.0/16"
vpc_subnet_list         = ["subnet-0d61bb60d3f0f837a", "subnet-00e68e973888cd82c"]
vpc_security_group_list = ["sg-0d6f507789dbe9ee3", "sg-04c6d4ea8c5822f44"]
