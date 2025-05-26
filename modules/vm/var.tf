variable "vm_name" {
  type = string
}

variable "num_cpus" {
  type = number
}

variable "memory" {
  type = number
}

variable "disk_size" {
  type = number
}

variable "iso_path_id" {
  type = string
}

variable "disks" {
  type = list(object({
    label        = string
    size         = number
    datastore_id = string
    unit_number  = number
  }))
  default = []
}

variable "datacenter_id" {
  type = string
}
variable "datastore_id" {
 type = string
}
variable "network_id" {
  type = string
}

variable "resource_pool_id" {
  type = string
}
variable "iso_datastore_id"{}
