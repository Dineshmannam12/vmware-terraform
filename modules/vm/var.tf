variable "vm_name" {}
variable "datastore_id" {}
variable "network_id" {}
variable "host_id" {}
variable "resource_pool_id" {}
variable "num_cpus"{}
variable "memory"{}
variable "disk_size"{}
variable "disks" {
  type    = list(object({
    label        = string
    size         = number
    datastore_id = string
  }))
  default = []
}
variable "iso_datastore_id"{}
variable "iso_path_id"{}
