terraform {
    required_version = ">= 0.12"
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = ">= 3.24"
      }
    }
}

variable "aws_region" {
    type = string
    default = "us-east-1"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}

provider "aws" {
  # Configuration options
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
}