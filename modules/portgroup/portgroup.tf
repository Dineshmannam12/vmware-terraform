resource "vsphere_host_port_group" "pg" {
  name                = var.portgroup_name
  host_system_id      = var.host_id
  virtual_switch_name = vswitch_name
}
