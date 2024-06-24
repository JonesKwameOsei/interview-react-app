output "static_webapp_deployment_token" {
  value     = azurerm_static_web_app.web.api_key
  sensitive = true
}

output "static_webapp_default_host_name" {
  value = azurerm_static_web_app.web.default_host_name
}

output "static_webapp_auth_password" {
  value     = var.environment == "pre-prod" ? random_string.password[0].result : ""
  sensitive = true
  description = "The password for basic auth in pre-prod environment. Not applicable in production."
}
