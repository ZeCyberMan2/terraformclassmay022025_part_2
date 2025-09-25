variable "ssh_public_key" {
  type = string
  default="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCq6Liwu/rATm2xYEK/OLWFr0BWvvOcgyuH+ncRuGZroRNQF+9V8t2pBFhq1EdV8zt0ime8IuRlXGhsus3kLJjE5MtFVlVAxHxmOYu+db7/a0v+Rm6/l1CatZQgAJXPcVNIC2s6SWOD10rCKhKlfRGMA/CbkpJTRY42yyOt7SwoaAI7NqeE4zlGl/dQ7etnsGGn05D7kIWLzVEvQpWFCcQ7/s7Z61Ht9UgjUETyEL4ygUqOoM9g7e2B4KKJY62NAuCj0uRb4KORlrAxR9DmIl/GnlFQuDK3Jhcjx93OkT6D+2lHubXTDjOE7MlEQAPFvkoxCjevmJIyEiDSAffwn6MbW3rgnGNN25ZgtXBx/3sfoPGFX8S0+5vyFdrS1WGm8dgM2ZsbGa1VXYwjswI50EW/b3mbBx40SPh7O4EXyn7lndIEUx45yY/zBD3cRv7VakMBPfX6jDhi9x6oOfE5up9SmCiw6obGSxzUSz4x4xRr1bCw7D2VSFSHX/3JprE8FSF5JIIIlPWO+Ehi6PG0sJofJRvreKms7JYh0YzcHBUXhPoCJIMEZK3I1x4dOdDE+59YFvC/W0tqCm8p2AEejPK+LjoA9gsc8PDWBTQlrmsyjzTO9LkRyC8q6zGORTqNajQ+EO8j0JGOoAecna8idBy5REYnab9A7GIUxPm2hyj3ZQ== marvi@DESKTOP-PLACC03"
}

resource "azurerm_resource_group" "linuxvm" {
  name     = "linux-virtual-machine"
  location = "Canada East"
}

resource "azurerm_virtual_network" "network1" {
  name                = "linux-network"
  address_space       = ["192.10.2.0/24"]
  location            = azurerm_resource_group.linuxvm.location
  resource_group_name = azurerm_resource_group.linuxvm.name
}

resource "azurerm_subnet" "subnet1" {
  name                 = "linux-internal"
  resource_group_name  = azurerm_resource_group.linuxvm.name
  virtual_network_name = azurerm_virtual_network.network1.name
  address_prefixes     = ["192.10.2.0/24"]
}

resource "azurerm_network_interface" "networkinterface1" {
  name                = "linux-network-interface"
  location            = azurerm_resource_group.linuxvm.location
  resource_group_name = azurerm_resource_group.linuxvm.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_linux_virtual_machine" "linux1" {
  name                = "linux1-machine"
  resource_group_name = azurerm_resource_group.linuxvm.name
  location            = azurerm_resource_group.linuxvm.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.networkinterface1.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
