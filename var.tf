variable "vsphere_user" {
    description = "this is the vsphere user name"
    type = string
    default = "administrator@pidc.local"
  
}
variable "vsphere_password" {
    description = "this is the password"
    type = string
    default = "6!Admin@123"
}
variable "vsphere_hostname" {
    description = "this is host name"
    type = string
    default = "192.168.68.2"
}
variable "vault_token"{
    description = "this is vault token"
    type = string
}
variable "vm_definitions" {
  type = map(object({
    name            = string
    count           = optional(number, 1)
    cpu             = number
    mem             = number
    disk_size       = number
    iso_path        = string
    resource_pool   = string  # Resource pool path (e.g. "Cluster1/Resources/Dev")
    disks = list(object({
      label          = string
      size           = number
      datastore_name = string
      unit_number    = number
    }))
  }))
  default = {}
}
