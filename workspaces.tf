resource "tfe_workspace" "test" {
  name         = "test-workspace"
  organization = tfe_organization.kuroseets.name
}
