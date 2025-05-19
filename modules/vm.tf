resource "vsphere_virtual_machine" "testingvm" {
  name             = "ubuntu-vm-from-iso"
  resource_pool_id = data.vsphere_resource_pool.host_pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus             = 4
  memory               = 4096
  guest_id             = "ubuntu64Guest"
  scsi_type            = "lsilogic"
  firmware             = "bios"
  enable_hot_add_cpu   = true
  enable_hot_add_memory = true

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }

  disk {
    label            = "boot-disk"
    size             = 100
    thin_provisioned = true
  }

  cdrom {
    client_device = false
    datastore_id  = data.vsphere_datastore.datastore.id
    path          = "iso/ubuntu-22.04-live-server-amd64.iso"
  }

  boot_delay = 5000

  boot_options {
    boot_order = ["cdrom", "disk"]
  }

  wait_for_guest_net_timeout = 0
}