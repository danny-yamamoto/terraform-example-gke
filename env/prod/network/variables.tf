variable "GOOGLE_CREDENTIALS" {}
variable "PROJECT_ID" {}

variable "default_region" {
  default = "asia-northeast1"
}

variable "default_zone" {
  default = "asia-northeast1-a"
}

variable "subnet_cidr" {
  default = "172.28.4.0/22"
}

variable "vpc_name" {
  default = "prod"
}