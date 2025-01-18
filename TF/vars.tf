variable ec2_type {
  type    = string
  default = "t2.micro"
***REMOVED***

variable ec2_ami {
  type    = string
  default = "ami-0fb04413c9de69305"
***REMOVED***

variable "price_limit" {
  type    = number
  default = 0.1
***REMOVED***

variable "ssh_key_name" {
  type    = string
  default = "aws-ed25519"
***REMOVED***

variable "name_prefix" {
  type    = string
  default = "dummy"
***REMOVED***

variable "region" {
  type    = string
  default = "ap-northeast-1"
***REMOVED***

variable "environment" {
  type    = string
  default = "Dev"
***REMOVED***

variable "cloudflare_api_token" {
  type = string
***REMOVED***

variable "cloudflare_dns_id" {
  type = string
***REMOVED***