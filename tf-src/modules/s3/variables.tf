variable "bucket_names" {
  type = list(string)
  default = ["openweather-data-src-raw","openweather-lambda-bcuket","openweather-airflow-bcuket","openweather-temp-bcuket"]
}