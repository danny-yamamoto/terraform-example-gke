variable "GOOGLE_CREDENTIALS" {}
variable "PROJECT_ID" {}

variable "default_region" {
  default = "asia-northeast1"
}

variable "default_zone" {
  default = "asia-northeast1-b"
}

variable "template_name" {
  default = "smart-stystei-dev"
}

variable "tag" {
  default = ["dev"]
}

variable "label" {
  default = "dev"
}

variable "machine_type" {
  default = "e2-standard-4"
}

variable "network" {
  default = "dev"
}

variable "email" {
  default = "hoge@hoge.iam.gserviceaccount.com"
}

variable "disk_size" {
  default = 1024
}

variable "disk_type" {
  default = "pd-standard"
}