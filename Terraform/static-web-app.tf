module "resource_group" {
  source   = "./modules/resource_group"
  name     = var.rg_name
  location = var.location
  tags     = var.rg_tags
}

resource "random_string" "password" {
  count      = var.environment == "pre-prod" ? 1 : 0
  length     = 10
  min_special = 1
  min_upper  = 1
  min_numeric = 1
}

resource "azurerm_static_web_app" "web" {
  name                = var.app_name
  resource_group_name = module.resource_group.rg_name
  location            = module.resource_group.rg_location
  sku_tier            = var.sku_tier
  sku_size            = var.sku_size
  tags                = var.tags

  dynamic "basic_auth" {
    for_each = var.environment == "pre-prod" ? [1] : []
    content {
      password     = resource.random_string.password[0].result
      environments = var.auth_environment
    }
  }
}
