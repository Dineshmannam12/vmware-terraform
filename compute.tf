module "vm" {
  for_each = var.vm_definitions
  source   = "./modules/vm"

  vm_name          = each.value.name
  num_cpus         = each.value.cpu
  vm_count         = each.value.count
  memory           = each.value.mem
  disk_size        = each.value.disk_size
  iso_path_id         = each.value.iso_path
  disks = [for disk in each.value.disks : {
    label        = disk.label
    size         = disk.size
    datastore_id = data.vsphere_datastore.all_datastores[disk.datastore_name].id
    unit_number  = disk.unit_number
  }]

  datacenter_id    = data.vsphere_datacenter.dc.id
  network_id       = data.vsphere_network.network.id
  resource_pool_id = data.vsphere_resource_pool.pools[each.key].id
  iso_datastore_id = data.vsphere_datastore.iso_datastore.id
  datastore_id     = data.vsphere_datastore.all_datastores[each.value.disks[0].datastore_name].id
}
