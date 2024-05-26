# Configure the Azure provider with the service principal credentials
provider "azurerm" {
  skip_provider_registration = true
  features {}
  subscription_id = "46f4df35-d1c0-405a-9848-53912ea26f1a"
  client_id       = "0685951c-b1a0-49fd-9c2b-85f021f5212a"
  client_secret   = "but8Q~ooa7opC5LP.lDmAFjSuv2CtlNDCiQDdagp"
  tenant_id       = "6d0e1f23-22f0-485a-9b87-fa9b1ec7856a"
}

resource "azurerm_resource_group" "ex1"{
    name="${var.name}"
    location="${var.location}"
}

# Create a virtual network
resource "azurerm_virtual_network" "ex1"{
  name                = "${var.name}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.ex1.location
  resource_group_name = azurerm_resource_group.ex1.name
}