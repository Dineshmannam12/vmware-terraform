data "vsphere_datacenter" "dc" {
    name = "pidc"
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
data "vault_kv_secret_v2" "vsphere_creds" {
  mount = "kv"
  name  = "vsphere"
}
data "vsphere_datastore" "all_datastores" {
  for_each = toset(
    flatten([
      for vm in var.vm_definitions : [
        for disk in vm.disks : disk.datastore_name
      ] if can(vm.disks)
    ])
  )
  name          = each.key
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pools" {
  for_each      = { for vm_key, vm in var.vm_definitions : vm_key => vm.resource_pool }
  name          = each.value
  datacenter_id = data.vsphere_datacenter.dc.id
}



