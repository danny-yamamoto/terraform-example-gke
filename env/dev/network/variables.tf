variable "GOOGLE_CREDENTIALS" {}
variable "PROJECT_ID" {}

variable "default_region" {
  default = "asia-northeast1"
}

variable "default_zone" {
  default = "asia-northeast1-b"
}

variable "subnet_cidr" {
  default = "172.16.4.0/22"
}

variable "vpc_name" {
  default = "dev"
}