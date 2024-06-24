variable "app_name" {
  description = "The name of the Static Web App."
  type        = string
}

variable "rg_name" {
  description = "The name of the Resource Group where Static Web App should exist."
  type        = string
}

variable "location" {
  description = "The Azure Region where the Static Web App should exist."
  type        = string
}

variable "sku_tier" {
  description = "The SKU tier for the Static Web App. Accepted values are Free or Standard. Default value is Free."
  type        = string
}

variable "sku_size" {
  description = "The SKU size for the Static Web App. Accepted values are Free or Standard. Default value is Free."
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the Static Web App."
  type        = map(string)
  default = {}
}

variable "rg_tags" {
  description = "Tags to be applied to the Resource Group."
  type        = map(string)
}

variable "environment" {
  description = "The environment for this deployment."
  type        = string
  default     = "pre-prod"
}

variable "auth_environment" {
  description = "Environments where basic auth should be enabled. Accepted values are AllEnvironments and StagingEnvironments"
  type        = string
  default     = "StagingEnvironments"
}
