#############################################################################
# Require terraform 0.9.3 or greater to run this template
#############################################################################
terraform {
  required_version = ">= 0.9.3"
}
#############################################################################
# Provider setup
#############################################################################
provider "ibmcloud" {
  bluemix_api_key    = "${var.ibmcloud_bx_api_key}"
  softlayer_username = "${var.ibmcloud_sl_username}"
  softlayer_api_key  = "${var.ibmcloud_sl_api_key}"
}
#############################################################################
# Get the bluemix cloudfoundry space information for running cf apps
#############################################################################
data "ibmcloud_cf_org" "bx_org" {
  org = "${var.org}"
}
data "ibmcloud_cf_space" "bx_space" {
  space = "${var.space}"
  org   = "${var.org}"
}
data "ibmcloud_cf_account" "bx_account" {
  org_guid = "${data.ibmcloud_cf_org.bx_org.id}"
}
##############################################################################
# Test Softlayer resources
##############################################################################
resource "ibmcloud_infra_ssh_key" "ssh_key" {
  label = "test-kelner"
  notes = "testing tf provider"
  public_key = "${var.public_key}"
}
resource "ibmcloud_infra_virtual_guest" "web_node" {
  count                = "${var.node_count}"
  hostname             = "test-kelner-node-${count.index+1}"
  domain               = "test-kelner.com"
  os_reference_code    = "${var.web_operating_system}"
  datacenter           = "${var.datacenter}"
  private_network_only = false
  cores                = "${var.vm_cores}"
  memory               = "${var.vm_memory}"
  local_disk           = true
  ssh_key_ids = [
    "${ibmcloud_infra_ssh_key.ssh_key.id}"
  ]
  tags = "${var.vm_tags}"
}
#############################################################################
# Test Bluemix resources
#############################################################################
resource "ibmcloud_cf_service_instance" "cloudant" {
  name       = "${var.cloudant_name}"
  space_guid = "${data.ibmcloud_cf_space.bx_space.id}"
  service    = "${var.cloudant_service}"
  plan       = "${var.cloudant_plan}"
  tags       = [
    "schematics",
    "test"
  ]
}
#############################################################################
# Variables
#############################################################################
variable "ibmcloud_bx_api_key" {
  description = "Your Bluemix API Key"
  type = "string"
}
variable "ibmcloud_sl_username" {
  description = "Your Softlayer username."
  type = "string"
}
variable "ibmcloud_sl_api_key" {
  description = "Your Softlayer API key."
  type = "string"
}
variable "space" {
  description = "Your Bluemix Space Name."
}
variable "org" {
  description = "Your Bluemix Org Name."
}
variable "datacenter" {
  description = "Your public SSH key."
  default = "dal06"
}
variable "public_key" {
  description = "Your public SSH key."
}
variable "node_count" {
  description = "The number of VM nodes to create."
  default = 1
}
variable "web_operating_system" {
  description = "The number of VM nodes to create."
  default = "UBUNTU_LATEST"
}
variable "vm_cores" {
  description = "The number of cores for the VMs."
  default = 1
}
variable "vm_memory" {
  description = "The amount of memory for the VMs."
  default = 1024
}
variable "vm_tags" {
  description = "The tags to be applied to the VMs."
  default = [
    "kelner",
    "schematics",
    "test"
  ]
}
# The Bluemix CF identifier for cloudant
# Can be obtained from CLI: `bx cf marketplace`
# As of 31 May 2017, see: https://gist.github.com/ckelner/aafa95732b8db03f3c7c85e7e024796a
variable "cloudant_service" {
  description = "The Bluemix CF identifier for cloudant."
  default = "cloudantNoSQLDB"
}
# The Bluemix CF Plan for cloudant
# Can be obtained from CLI: `bx cf marketplace`
# As of 31 May 2017, see: https://gist.github.com/ckelner/aafa95732b8db03f3c7c85e7e024796a
variable "cloudant_plan" {
  description = "The Bluemix CF plan for cloudant."
  default = "Lite"
}
# A name to give the cloudant db
variable "cloudant_name" {
  description = "The name for the cloudant DB instance."
  default = "schematics-test-cloudant" # must be unique across all CF apps
}
# A name to give the cloudant db service key
variable "cloudant_key" {
  description = "A name for the cloudant DB instance service key."
  default = "schematics-test-key"
}
#############################################################################
# Outputs
#############################################################################
output "node_ids" {
    value = ["${ibmcloud_infra_virtual_guest.web_node.*.id}"]
}
output "cloudant_db_id" {
  value = "${ibmcloud_cf_service_instance.cloudant.id}"
}
