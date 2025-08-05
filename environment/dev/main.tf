module "vnet" {
  source              = "../../modules/azurerm_vnet"
  vnet_name           = "V-Net"
  location            = "centralindia"
  resource_group_name = "rg-demon-slayer"
  address_space       = ["10.0.0.0/16"]
}

module "subnet" {
  depends_on = [ module.vnet ]
  source               = "../../modules/azurerm_subnet"
  subnet_name          = "frontend-subnet"
  resource_group_name  = "rg-demon-slayer"
  virtual_network_name = "V-Net"
  address_prefixes     = ["10.0.0.0/24"]
}

module "subnet1" {
  depends_on = [ module.vnet ]
  source               = "../../modules/azurerm_subnet"
  subnet_name          = "backend-subnet"
  resource_group_name  = "rg-demon-slayer"
  virtual_network_name = "V-Net"
  address_prefixes     = ["10.0.1.0/24"]
}