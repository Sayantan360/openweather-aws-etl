resource "aws_s3_bucket" "bucket1" {
  bucket = "openweather-data-raw"
  force_destroy = true
}

# resource "aws_s3_object" "file" {
#   bucket = aws_s3_bucket.mybucket.id
#   key    = "glue_script.py"
#   source = "./glue_script.py"