client_id       = "101df146-ddca-4422-8bba-1597fd8c0b55"
client_secret   = "lP38Q~V4NxqqErhOBQTxs.3.gMKc0RUx.OZksdBH"
tenant_id       = "4b6f90b2-12cc-45f0-8527-da31b2259cca"
subscription_id = "7b43c9f5-2b23-42c6-a7bf-d8e1cf4af406"

resource_group_name = "hubrg01"

resource_group_location = "eastus"

nsg_name = "hubnsg01"

virtual_network_name = "hubvnet01"

subnet_name = "hubsubnet01"

network_interface = ["vmnic0", "vmnic1"]

vm_name = ["bamboo-server", "webserver01"]

vm_size = "Standard_D2s_v3"

username = "hcloud"

storage_account_type = "Standard_LRS"

public_ip_name = ["bamboo_public_ip", "webserver01_public_ip"]
