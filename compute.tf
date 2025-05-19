module "vm" {
  source           = "./modules/vm"
  vm_name          = "my-vm"
  datastore_id     = data.vsphere_datastore.datastore.id
  network_id       = data.vsphere_network.network.id
  host_id          = data.vsphere_host.esxi_host.id
  resource_pool_id = data.vsphere_resource_pool.host_pool.id
}