terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    ***REMOVED***
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.0.0-rc1"
    ***REMOVED***
  ***REMOVED***
***REMOVED***

provider "aws" {
  region = "${var.region***REMOVED***"
***REMOVED***

provider "cloudflare" {
  api_token = var.cloudflare_api_token
***REMOVED***
