provider "azurerm" {
  version = "~> 2.46.0"
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = var.RgName
  location = var.location
}

resource "azurerm_app_service_plan" "main" {
  name                = var.ServiceName
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "main" {
  name                = var.ServiceName
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  app_service_plan_id = azurerm_app_service_plan.main.id

  site_config {
    linux_fx_version = "DOTNETCORE|5.0"
  }
}