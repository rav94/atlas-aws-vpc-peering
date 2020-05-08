variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "ATLAS_PUBLIC_KEY" {
}

variable "ATLAS_PRIVATE_KEY" {
}

variable "ATLAS_PROVIDER" {
  default = "AWS"
}

variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AWS_VPC_CIDR" {
  default = "10.0.0.0/16"
}

variable "AWS_ACCOUNT_ID" {
  default = "$1"
}

variable "ATLAS_PROJECT_ID" {
  default = "$2"
}

variable "ATLAS_VPC_CIDR" {
  default = "192.168.248.0/21"
}

variable "INSTANCE_TYPE" {
  default = "t2.small"
}

variable "KEY_NAME" {
  default = "virginia"
}

