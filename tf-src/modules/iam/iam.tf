#IAM ROLE FOR GLUE

resource "aws_iam_role" "glue_role" {
  name = "glue_role"
  assume_role_policy  = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "glue.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "glue-role-policy-attachment" {
  count = length(var.glue_role_policy_arns)
  role  = aws_iam_role.glue_role.name
  policy_arn = var.glue_role_policy_arns[count.index]
}

#IAM ROLE FOR LAMBDA

resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"
  assume_role_policy  = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda-role-policy-attachment" {
  count = length(var.lambda_role_policy_arns)
  role  = aws_iam_role.lambda_role.name
  policy_arn = var.lambda_role_policy_arns[count.index]
}

#IAM ROLE FOR REDSHIFT

resource "aws_iam_role" "redshift_role" {
  name = "redshift_role"
  assume_role_policy  = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "redshift.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "redshift-role-policy-attachment" {
  count = length(var.redshift_role_policy_arns)
  role  = aws_iam_role.redshift_role.name
  policy_arn = var.redshift_role_policy_arns[count.index]
}

#IAM ROLE FOR AIRFLOW

resource "aws_iam_role" "airflow_role" {
  name = "airflow_role"
  assume_role_policy  = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "airflow.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "airflow-role-policy-attachment" {
  count = length(var.airflow_role_policy_arns)
  role  = aws_iam_role.airflow_role.name
  policy_arn = var.airflow_role_policy_arns[count.index]
}