variable "bucket_names" {
  type = list(string)
  default = ["openweather-data-src-raw","openweather-lambda-bucket","openweather-airflow-bucket","openweather-temp-bucket"]
}