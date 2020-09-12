variable tfc_hostname {
  type    = string
  default = "app.terraform.io"
}

variable tfc_token {
  type = string
  default = null
}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"  # Terraform Cloudのホスト名
    organization = "kuroseets"         # 使用するOrganization

    workspaces {
      name = "tfc-test"                # 使用するWorkspace
    }
  }
}

# Terraform Enterprise Provider
provider "tfe" {
  hostname = var.tfc_hostname
  token    = var.tfc_token
}
