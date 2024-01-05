variable "GOOGLE_CREDENTIALS" {}
variable "PROJECT_ID" {}
variable "cluster_name" {
    default = "cashflow"
}
variable "location" {
    default = "asia-northeast1-b"
}
variable "vpc_name" {
    default = "dev"
}
variable "region" {
    default = "asia-northeast1"
}
variable "subnet" {
    default = "dev-subnet1"
}
variable "pod_range" {
    default = "172.24.0.0/14"
}
variable "service_range" {
    default = "172.16.16.0/20"
}
variable "master_range" {
    default = "172.16.0.0/28"
}
variable "min_master_version" {
    default = "1.20.9-gke.1001"
}
