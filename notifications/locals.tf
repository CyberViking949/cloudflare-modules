# locals {
#   webhook_policies = {
#     for policy in var.notification_policies : policy.name => policy if policy.webhook_integration != null
#   }
# }