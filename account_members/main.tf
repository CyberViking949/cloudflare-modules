resource "cloudflare_account_member" "account_member" {
  account_id    = var.account_id
  for_each      = var.users
  email_address = lower(each.key)
  role_ids      = [for role in each.value : lookup(local.member_roles, role)]
}