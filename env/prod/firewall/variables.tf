variable "GOOGLE_CREDENTIALS" {}
variable "PROJECT_ID" {}

variable "default_region" {
  default = "asia-northeast1"
}

variable "default_zone" {
  default = "asia-northeast1-a"
}

variable "source_ranges_iap" {
    default = ["35.235.240.0/20"]
}

variable "vpc_name" {
  default = "prod"
}