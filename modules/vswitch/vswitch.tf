resource "vsphere_host_virtual_switch" "switch" {
  name           = var.vswitch_name
  host_system_id = var.host_id 

  network_adapters = ["vmnic0", "vmnic1"]

  active_nics  = ["place active"]
  standby_nics = ["place standy "]
  teaming_policy = "failover_explicit"
}
