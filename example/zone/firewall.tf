
module "firewall" {
  source     = "github.com/cyberviking949/cloudflare-modules//firewall?ref=v1.0.0"
  zone_id    = module.dns_zones.zone_id
  depends_on = [module.dns_zones]
  rules = [
    {
    name = "Test (WAF Bypass)"
    description = "Test (WAF Bypass)"
    paused      = false
    action      = "skip"
    expression  = "(http.user_agent contains \"UA-TEST/\" and ip.src eq 1.2.3.4 and http.request.uri.path eq \"/api/endpoint\")"
    skipped_phases = ["http_request_firewall_managed"]
    logging = false
    }
  ]
}