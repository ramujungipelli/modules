output "network_interface" {
  value = azurerm_network_interface.network_interface.name
}
output "vm_name" {
  value = azurerm_linux_virtual_machine.ubuntu_linux_server.name
}
output "vm_size" {
  value = azurerm_linux_virtual_machine.ubuntu_linux_server.size
}
output "username" {
  value = azurerm_linux_virtual_machine.ubuntu_linux_server.admin_username
}
output "storage_account_type" {
  value = azurerm_linux_virtual_machine.ubuntu_linux_server.os_disk
}
output "public_ip_name"{
value = azurerm_public_ip.public_ip.name
}