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
