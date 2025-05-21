module "vm" {
  for_each = {
    vm4 = {
      name        = "app02"
      cpu         = 4
      mem         = 2048
      size        = 100
      iso_path    = "iso/ubuntu-22.04-live-server-amd64.iso"
      disks = [
        {
          label         = "disk-1"
          size          = 100
          datastore_id  = data.vsphere_datastore.datastore.id
          unit_number = 0
        }
      ]
    }
     vm5 = {
      name        = "app04"
      cpu         = 4
      mem         = 4196
      size        = 200
      iso_path    = "iso/CentOS-Stream-10-latest-x86_64-dvd1.iso"
      disks = [
        {
          label         = "disk-1"
          size          = 200
          datastore_id  = data.vsphere_datastore.datastore.id
          unit_number = 0
        }
      ]
    }
    vm6 = {
      name        = "app06"
      cpu         = 4
      mem         = 2048
      size        = 100
      iso_path    = "iso/CentOS-Stream-10-latest-x86_64-dvd1.iso"
      disks = [
        {
          label         = "disk-1"
          size          = 150
          datastore_id  = data.vsphere_datastore.datastore.id
          unit_number = 1
        }
      ]
    }
    vm7 = {
      name        = "app08"
      cpu         = 2
      mem         = 2048
      size        = 150
      iso_path    = "iso/SW_DVD9_Win_Server_STD_CORE_2022_2108.16_64Bit_English_DC_STD_MLF_X23-32717.ISO"
      disks = [
        {
          label         = "disk-1"
          size          = 210
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
  disks            = each.value.disks
  disk_size        = each.value.size
  iso_datastore_id = data.vsphere_datastore.iso_datastore.id
  iso_path_id      = each.value.iso_path
}

