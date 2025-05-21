variable "vm_name" {}
variable "datastore_id" {}
variable "network_id" {}
variable "host_id" {}
variable "resource_pool_id" {}
variable "num_cpus"{}
variable "memory"{}
variable "extra_disks" {
  type    = list(object({
    label        = string
    size         = number
    datastore_id = string
  }))
  default = []
}
