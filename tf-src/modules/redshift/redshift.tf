resource "aws_redshift_cluster" "openweather-redshift-cluster" {
  cluster_identifier = "openweather-redshift-cluster"
  database_name      = "mydb"
  master_username    = "superuser"
  master_password    = "Password@2024"
  node_type          = "dc2.large"
  cluster_type       = "single-node"
  default_iam_role_arn = ""
  vpc_security_group_ids = []
  cluster_subnet_group_name = "openweather-redshift-subnet-group"
}