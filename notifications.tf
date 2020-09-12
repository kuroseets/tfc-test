variable slack_hook_url {
  type = string
}

data "tfe_workspace" "tfc-test" {
  name = "tfc-test"
  organization = tfe_organization.kuroseets.name
}

resource "tfe_notification_configuration" "test_slack" {
  name             = "test-slack"
  enabled          = true
  destination_type = "slack"
  url              = var.slack_hook_url
  workspace_id     = data.tfe_workspace.tfc-test.id
  triggers = [
    "run:created",
    "run:planning",
    "run:needs_attention",
    "run:applying",
    "run:completed",
    "run:errored"
  ]
}
