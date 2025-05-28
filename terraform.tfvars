vm_definitions = {
  web_server = {
    name          = "dinesh-vm",
    cpu           = 4,
    mem           = 4192,
    disk_size     = 100
    iso_path      = "iso/ubuntu-22.04-live-server-amd64.iso",
    resource_pool = "/pidc/host/192.168.68.4/Resources",  # Full path to resource pool
    disks = [
      {
        label          = "data_disk",
        size           = 100,
        datastore_name = "truenas ds1",
        unit_number    = 1
      }
    ]
  }
  testing_server = {
    name          = "testing-vm"
    cpu           = 2
    mem           = 3072
    disk_size     = 100
    iso_path      = "iso/ubuntu-22.04-live-server-amd64.iso"
    resource_pool = "/pidc/host/192.168.68.5/Resources"
    disks = [
      {
        label          = "data_disk"
        size           = 150
        datastore_name = "datastore1 (2)"
        unit_number    = 1
      }
    ]
  }
  app_server1 = {
    name          = "testing-instance"
    count         = 2
    cpu           = 2
    mem           = 3072
    disk_size     = 100
    iso_path      = "iso/ubuntu-22.04-live-server-amd64.iso"
    resource_pool = "/pidc/host/192.168.68.3/Resources"
    disks = [
      {
        label          = "data_disk"
        size           = 150
        datastore_name = "truenas ds1"
        unit_number    = 1
      }
    ]
  }
}
