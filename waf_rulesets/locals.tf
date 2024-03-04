locals {
    cloudflare_owasp_ruleset = {
        for rule in data.cloudflare_rulesets.owasp_rulesets.rulesets[0].rules :
        rule.description => rule.id
    }
    cf_managed_ruleset = {
        for rule in data.cloudflare_rulesets.cf_managed_rulesets.rulesets[0].rules :
        "${rule.description}-${rule.id}" => rule.id
    }
}