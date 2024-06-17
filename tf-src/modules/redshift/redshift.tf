resource "aws_redshift_cluster" "openweather-redshift-cluster" {
  cluster_identifier = "openweather-redshift-cluster"
  database_name      = "mydb"
  master_username    = "superuser"
  master_password    = "Password2024"
  node_type          = "dc2.large"
  cluster_type       = "single-node"
  default_iam_role_arn = var.redshift-role-arn
  vpc_security_group_ids = [var.sg-id]
  cluster_subnet_group_name = "openweather-redshift-subnet-group"
}