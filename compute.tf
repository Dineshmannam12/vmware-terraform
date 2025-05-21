module "vm" {
  for_each = {
    vm1 = {
      name        = "web01"
      cpu         = 2
      mem         = 2048
      extra_disks = []
    }
    vm2 = {
      name        = "db01"
      cpu         = 4
      mem         = 4096
      extra_disks = []
    }
    vm3 = {
      name        = "app01"
      cpu         = 3
      mem         = 2048
      extra_disks = []
    }
    vm4 = {
      name        = "app02"
      cpu         = 4
      mem         = 2048
      extra_disks = [
        {
          label         = "disk-1"
          size          = 100
          datastore_id  = data.vsphere_datastore.datastore.id
          unit_number = 1
        }
      ]
    }
  }

  source           = "./modules/vm"
  vm_name          = each.value.name
  num_cpus         = each.value.cpu
  memory           = each.value.mem
  datastore_id     = data.vsphere_datastore.datastore.id
  network_id       = data.vsphere_network.network.id
  host_id          = data.vsphere_host.esxi_host.id
  resource_pool_id = data.vsphere_resource_pool.host_pool.id
  extra_disks      = each.value.extra_disks
}

