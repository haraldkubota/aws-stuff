variable ec2_type {
  type    = string
  default = "t2.micro"
}

variable ec2_ami {
  type    = string
  default = "ami-0fb04413c9de69305"
}

variable "price_limit" {
  type    = number
  default = 0.1
}

variable "ssh_key_name" {
  type    = string
  default = "aws-ed25519"
}

variable "name_prefix" {
  type    = string
  default = "dummy"
}

variable "region" {
  type    = string
  default = "ap-northeast-1"
}

variable "environment" {
  type    = string
  default = "Dev"
}

variable "cloudflare_api_token" {
  type = string
}

variable "cloudflare_dns_id" {
  type = string
}