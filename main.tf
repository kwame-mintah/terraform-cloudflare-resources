data "cloudflare_zone" "intuitive_judgments_dot_com_zone" {
  filter = { name = "intuitive-judgments.com" }
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "windows_10_localhost_zero_trust_tunnel" {
  account_id = var.cloudflare_account_id
  name       = "windows-10-tunnel"
  config_src = "cloudflare"
}


resource "cloudflare_zero_trust_tunnel_cloudflared_config" "windows_10_localhost_zero_trust_tunnel_zero_trust_tunnel_config" {
  # Warning: Resource Destruction Considerations
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.windows_10_localhost_zero_trust_tunnel.id
  config = {
    ingress = [{
      hostname = "ollama.intuitive-judgments.com"
      service  = "http://localhost:11434"
      },
      { service = "http_status:404" }
    ]
  }
}

resource "cloudflare_zero_trust_access_identity_provider" "zero_trust_access_one_time_login_identity_provider" {
  account_id = var.cloudflare_account_id
  name       = "One time login"
  type       = "onetimepin"
  config = {

  }
}

resource "cloudflare_dns_record" "ollama_zero_trust_tunnel_dns" {
  zone_id = data.cloudflare_zone.intuitive_judgments_dot_com_zone.id
  name    = "ollama"
  ttl     = "1"
  type    = "CNAME"
  content = "${cloudflare_zero_trust_tunnel_cloudflared.windows_10_localhost_zero_trust_tunnel.id}.cfargotunnel.com"
  proxied = true
}

resource "cloudflare_dns_record" "resend_learneverything_dkim" {
  zone_id = data.cloudflare_zone.intuitive_judgments_dot_com_zone.id
  name    = "resend._domainkey.send"
  type    = "TXT"
  ttl     = 3600

  content = "\"p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCXz69SUNQUTCFNtnleI7JCZu+W3wS+IUfgw26BTA1SksXaLBQO/1UXiLD7hbt2JA1bEc45QXS1hia3pi3Uf76JQok5DDMO5b0t3Xe418I12haQM5/N6b4NlaIDNnGsxemRWgzJ7yEJs/CaKNfss7eGeEyg2wnyqOWQTdcznquiEwIDAQAB\""
}

resource "cloudflare_dns_record" "resend_learneverything_mx" {
  zone_id  = data.cloudflare_zone.intuitive_judgments_dot_com_zone.id
  name     = "send"
  type     = "MX"
  ttl      = 3600
  priority = 10
  content  = "feedback-smtp.sa-east-1.amazonses.com"
}

resource "cloudflare_dns_record" "resend_learneverything_spf" {
  zone_id = data.cloudflare_zone.intuitive_judgments_dot_com_zone.id
  name    = "send"
  type    = "TXT"
  ttl     = 3600

  content = "\"v=spf1 include:amazonses.com ~all\""
}

resource "cloudflare_dns_record" "resend_learneverything_dmarc" {
  zone_id = data.cloudflare_zone.intuitive_judgments_dot_com_zone.id
  name    = "_dmarc"
  type    = "TXT"
  ttl     = 3600

  content = "\"v=DMARC1; p=none;\""
}
