provider "vsphere" {
  user                 = data.vault_kv_secret_v2.vsphere_creds.data["username"]
  password             = data.vault_kv_secret_v2.vsphere_creds.data["password"]
  vsphere_server       = var.vsphere_hostname
  allow_unverified_ssl = true
}
provider "vault" {
  address = "http://192.168.68.23:8200"
  token   = var.vault_token  # Or use VAULT_TOKEN env variable
}
