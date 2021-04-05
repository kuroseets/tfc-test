resource "tfe_workspace" "test" {
  name         = "test-workspace"
  organization = tfe_organization.kuroseets.name
}

module "create_workspace" {
  source         = "git@github.com:kuroseets/terraform-tfe-test.git?ref=v0.0.2"
  workspace_name = "test-ws"
}

module "create_workspace2" {
  source         = "app.terraform.io/kuroseets/test/tfe"
  version        = "0.0.1"
  workspace_name = "test-ws2"
}

resource "tfe_workspace" "test-workspaces" {
  count        = 200
  name         = format("test-workspace-%s", count.index)
  organization = tfe_organization.kuroseets.name
}
