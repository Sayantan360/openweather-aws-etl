resource "aws_s3_bucket" "buckets" {
  count = length(var.bucket_names)
  bucket = var.bucket_names[count.index]
  force_destroy = true
}

resource "aws_s3_object" "folder1" {
  bucket = var.bucket_names[0]
  key    = "openweather_raw_data/"
}

resource "aws_s3_object" "folder3" {
  bucket = var.bucket_names[2]
  key    = "dags/"
}


# resource "aws_s3_object" "file" {
#   bucket = aws_s3_bucket.mybucket.id
#   key    = "glue_script.py"
#   source = "./glue_script.py"