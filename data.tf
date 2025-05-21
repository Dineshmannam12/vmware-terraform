data "vsphere_datacenter" "dc" {
    name = "pidc"
}
data "vsphere_datastore" "datastore" {
  name          = "truenas ds1"
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_datastore" "iso_datastore" {
  name          = "truenas ds1"
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_host" "esxi_host" {
  name          = "192.168.68.3"
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Resource pool on that host
data "vsphere_resource_pool" "host_pool" {
  name           = "/pidc/host/192.168.68.4/Resources"
  datacenter_id = data.vsphere_datacenter.dc.id
  #host_system_id = data.vsphere_host.esxi_host.id
}
data "vault_kv_secret_v2" "vsphere_creds" {
  mount = "kv"
  name  = "vsphere"
}




