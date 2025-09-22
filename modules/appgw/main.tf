# Public IP for App Gateway
resource "azurerm_public_ip" "appgw_ip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.public_ip_allocation
  sku                 = "Standard"
}

# Application Gateway
resource "azurerm_application_gateway" "appgw" {
  name                = var.appgw_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    name     = "WAF_v2"
    tier     = "WAF_v2"
    capacity = var.capacity
  }

  gateway_ip_configuration {
    name      = "appgw-ip-config"
    subnet_id = var.subnet_id
  }

  frontend_ip_configuration {
    name                 = "appgw-frontend"
    public_ip_address_id = azurerm_public_ip.appgw_ip.id
  }

  frontend_port {
    name = "http"
    port = 80
  }

  backend_address_pool { name = "appgw-backend-pool" }

  backend_http_settings {
    name                  = "appgw-backend-http-settings"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 30
  }

  http_listener {
    name                           = "appgw-http-listener"
    frontend_ip_configuration_name = "appgw-frontend"
    frontend_port_name             = "http"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                      = "appgw-rule"
    rule_type                 = "Basic"
    http_listener_name         = "appgw-http-listener"
    backend_address_pool_name  = "appgw-backend-pool"
    backend_http_settings_name = "appgw-backend-http-settings"
    priority = 100 
  }

  waf_configuration {
    enabled           = true
    firewall_mode     = "Prevention"
    rule_set_type     = "OWASP"
    rule_set_version  = "3.2"
  }
}
