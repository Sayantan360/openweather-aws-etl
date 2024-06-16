variable "glue_role_policy_arns" {
  type = list(string)
  default = ["arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole","arn:aws:iam::aws:policy/AmazonS3FullAccess","arn:aws:iam::aws:policy/SecretsManagerReadWrite"]
}

variable "lambda_role_policy_arns" {
  type = list(string)
  default = ["arn:aws:iam::aws:policy/AWSLambda_FullAccess","arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
  "arn:aws:iam::aws:policy/AmazonS3FullAccess","arn:aws:iam::aws:policy/AmazonVPCFullAccess",
  "arn:aws:iam::aws:policy/service-role/AWSLambdaRole","arn:aws:iam::aws:policy/SecretsManagerReadWrite"]
}

variable "redshift_role_policy_arns" {
  type = list(string)
  default = ["arn:aws:iam::aws:policy/AmazonRedshiftFullAccess","arn:aws:iam::aws:policy/AmazonRedshiftQueryEditor",
  "arn:aws:iam::aws:policy/AmazonS3FullAccess","arn:aws:iam::aws:policy/SecretsManagerReadWrite"]
}

variable "airflow_role_policy_arns" {
  type = list(string)
  default = ["arn:aws:iam::aws:policy/AmazonRedshiftFullAccess","arn:aws:iam::aws:policy/AmazonRedshiftQueryEditor",
  "arn:aws:iam::aws:policy/AmazonS3FullAccess","arn:aws:iam::aws:policy/SecretsManagerReadWrite"]
}