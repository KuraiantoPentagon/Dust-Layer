terraform {
  backend "s3" {
    key                         = "key/terraform.tfstate"
    region                      = "auto"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    use_path_style              = true
  }
  required_providers {
    supabase = {
      source  = "supabase/supabase"
      version = "1.5.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "supabase" {
  access_token = var.supabase_access_token
}

resource "random_id" "project_suffix" {
  byte_length = 4
}

resource "supabase_project" "ycms" {
  name              = "${var.project_name}-${random_id.project_suffix.hex}"
  organization_id   = var.org_id
  database_password = var.db_password
  region            = "ap-southeast-1"
}
