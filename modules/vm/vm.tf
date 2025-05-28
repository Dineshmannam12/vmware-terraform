resource "vsphere_virtual_machine" "test5-vm3" {
  count            = var.vm_count
  name             = var.vm_count > 1? "${var.vm_name}-${count.index+1}": "${var.vm_name}"
  resource_pool_id = var.resource_pool_id
  datastore_id     = var.datastore_id

  num_cpus = var.num_cpus
  memory   = var.memory
  guest_id = "ubuntu64Guest"
  scsi_type = "lsilogic"
  firmware  = "bios"

  enable_disk_uuid       = true
  cpu_hot_add_enabled    = true
  memory_hot_add_enabled = true

  network_interface {
    network_id   = var.network_id
    adapter_type = "vmxnet3"
  }

  disk {
    label            = "os_disk"
    size             = var.disk_size
    eagerly_scrub    = false
    unit_number      = 0
    thin_provisioned = true
  }

  dynamic "disk" {
    for_each = var.disks
    content {
      label            = disk.value.label
      size             = disk.value.size
      datastore_id     = disk.value.datastore_id
      thin_provisioned = true
      unit_number      = lookup(disk.value, "unit_number", 1 + index(var.disks, disk.value))
    }
  }

  cdrom {
    client_device = false
    datastore_id  = var.iso_datastore_id
    path          = var.iso_path_id
  }

  boot_delay = 5000

  wait_for_guest_net_timeout = 0
}

