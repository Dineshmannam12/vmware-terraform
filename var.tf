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