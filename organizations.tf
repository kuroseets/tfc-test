# 管理するOrganization
resource "tfe_organization" "kuroseets" {
  name                     = "kuroseets"
  email                    = "etsuo.kurose@gmail.com"
  collaborator_auth_policy = "two_factor_mandatory"
  session_remember_minutes = 0
  session_timeout_minutes  = 0
}
