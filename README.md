# Terraform IBM Cloud Provider Test
A test repo to try out new IBM Cloud terraform provider releases.

Current version tested
[`v0.3-tf-v0.9.3`](https://ibm-bluemix.github.io/tf-ibm-docs/v0.3-tf-v0.9.3/).

The repo will test both Bluemix and SoftLayer access.

# Outputs
Example output from terraform commands for this configuration template.

## Plan
```
$ terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

data.ibmcloud_cf_org.bx_org: Refreshing state...
data.ibmcloud_cf_space.bx_space: Refreshing state...
data.ibmcloud_cf_account.bx_account: Refreshing state...
The Terraform execution plan has been generated and is shown below.
Resources are shown in alphabetical order for quick scanning. Green resources
will be created (or destroyed and then created if an existing resource
exists), yellow resources are being changed in-place, and red resources
will be destroyed. Cyan entries are data sources to be read.

Note: You didn't specify an "-out" parameter to save this plan, so when
"apply" is called, Terraform can't guarantee this is what will execute.

+ ibmcloud_cf_service_instance.cloudant
    credentials.%:     "<computed>"
    name:              "schematics-test-cloudant"
    plan:              "Lite"
    service:           "cloudantNoSQLDB"
    service_plan_guid: "<computed>"
    space_guid:        "07405a67-e237-498e-a265-0bf708837471"
    tags.#:            "2"
    tags.1965403711:   "schematics"
    tags.3632233996:   "test"

+ ibmcloud_infra_ssh_key.ssh_key
    fingerprint: "<computed>"
    label:       "test-kelner"
    notes:       "testing tf provider"
    public_key:  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQEXzbz7uCQWfbWycU97ucC+Ka4yzwBebVbx5XuABCGybKzEjVcn2oYGWUOvxxckbg+bku6KyBfR8Aq4Ajz1ygeXl+1fuqaNVgj0BJKc9jzMdfYi53/gJzq7hypIQUcxdxu/UJiC79E7SEKpZ8DVETC4IqFe5mHVgeEyvXcXX8Xjb6xs1mCkNTAIfTc0UtZlGnKJZu3bEDvAw1/kqfpdDEuKVSqsEkjzF3cKNOATa2MRmU8djv/kS8rUhsuBKLqwAb4Brz3bo7hQtXlC8+kGuSMaKdC/Nds83hk5aX+wgGawGihlQhDRwJRgpBDAZSzT5ZIJ2Fz1BudXQnZ6tcps99 chris.kelner@weather.com"

+ ibmcloud_infra_virtual_guest.web_node
    cores:                    "1"
    datacenter:               "dal06"
    domain:                   "test-kelner.com"
    hostname:                 "test-kelner-node-1"
    hourly_billing:           "true"
    ip_address_id:            "<computed>"
    ip_address_id_private:    "<computed>"
    ipv4_address:             "<computed>"
    ipv4_address_private:     "<computed>"
    ipv6_address:             "<computed>"
    ipv6_address_id:          "<computed>"
    ipv6_enabled:             "false"
    local_disk:               "true"
    memory:                   "1024"
    network_speed:            "100"
    os_reference_code:        "UBUNTU_LATEST"
    private_network_only:     "false"
    private_subnet:           "<computed>"
    private_vlan_id:          "<computed>"
    public_ipv6_subnet:       "<computed>"
    public_subnet:            "<computed>"
    public_vlan_id:           "<computed>"
    secondary_ip_addresses.#: "<computed>"
    ssh_key_ids.#:            "<computed>"
    tags.#:                   "3"
    tags.1965403711:          "schematics"
    tags.3632233996:          "test"
    tags.387680100:           "kelner"
    wait_time_minutes:        "90"


Plan: 3 to add, 0 to change, 0 to destroy.
```

## Apply
```
$ terraform apply
data.ibmcloud_cf_space.bx_space: Refreshing state...
data.ibmcloud_cf_org.bx_org: Refreshing state...
data.ibmcloud_cf_account.bx_account: Refreshing state...
ibmcloud_infra_ssh_key.ssh_key: Creating...
  fingerprint: "" => "<computed>"
  label:       "" => "test-kelner"
  notes:       "" => "testing tf provider"
  public_key:  "" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQEXzbz7uCQWfbWycU97ucC+Ka4yzwBebVbx5XuABCGybKzEjVcn2oYGWUOvxxckbg+bku6KyBfR8Aq4Ajz1ygeXl+1fuqaNVgj0BJKc9jzMdfYi53/gJzq7hypIQUcxdxu/UJiC79E7SEKpZ8DVETC4IqFe5mHVgeEyvXcXX8Xjb6xs1mCkNTAIfTc0UtZlGnKJZu3bEDvAw1/kqfpdDEuKVSqsEkjzF3cKNOATa2MRmU8djv/kS8rUhsuBKLqwAb4Brz3bo7hQtXlC8+kGuSMaKdC/Nds83hk5aX+wgGawGihlQhDRwJRgpBDAZSzT5ZIJ2Fz1BudXQnZ6tcps99 chris.kelner@weather.com"
ibmcloud_cf_service_instance.cloudant: Creating...
  credentials.%:     "" => "<computed>"
  name:              "" => "schematics-test-cloudant"
  plan:              "" => "Lite"
  service:           "" => "cloudantNoSQLDB"
  service_plan_guid: "" => "<computed>"
  space_guid:        "" => "07405a67-e237-498e-a265-0bf708837471"
  tags.#:            "" => "2"
  tags.1965403711:   "" => "schematics"
  tags.3632233996:   "" => "test"
ibmcloud_infra_ssh_key.ssh_key: Creation complete (ID: 900421)
ibmcloud_infra_virtual_guest.web_node: Creating...
  cores:                    "" => "1"
  datacenter:               "" => "dal06"
  domain:                   "" => "test-kelner.com"
  hostname:                 "" => "test-kelner-node-1"
  hourly_billing:           "" => "true"
  ip_address_id:            "" => "<computed>"
  ip_address_id_private:    "" => "<computed>"
  ipv4_address:             "" => "<computed>"
  ipv4_address_private:     "" => "<computed>"
  ipv6_address:             "" => "<computed>"
  ipv6_address_id:          "" => "<computed>"
  ipv6_enabled:             "" => "false"
  local_disk:               "" => "true"
  memory:                   "" => "1024"
  network_speed:            "" => "100"
  os_reference_code:        "" => "UBUNTU_LATEST"
  private_network_only:     "" => "false"
  private_subnet:           "" => "<computed>"
  private_vlan_id:          "" => "<computed>"
  public_ipv6_subnet:       "" => "<computed>"
  public_subnet:            "" => "<computed>"
  public_vlan_id:           "" => "<computed>"
  secondary_ip_addresses.#: "" => "<computed>"
  ssh_key_ids.#:            "" => "1"
  ssh_key_ids.0:            "" => "900421"
  tags.#:                   "" => "3"
  tags.1965403711:          "" => "schematics"
  tags.3632233996:          "" => "test"
  tags.387680100:           "" => "kelner"
  wait_time_minutes:        "" => "90"
ibmcloud_cf_service_instance.cloudant: Creation complete (ID: fb917478-23fd-49e6-a7bd-af99c1656fe3)
ibmcloud_infra_virtual_guest.web_node: Still creating... (10s elapsed)
ibmcloud_infra_virtual_guest.web_node: Still creating... (20s elapsed)
ibmcloud_infra_virtual_guest.web_node: Still creating... (30s elapsed)
...
ibmcloud_infra_virtual_guest.web_node: Still creating... (6m40s elapsed)
ibmcloud_infra_virtual_guest.web_node: Still creating... (6m50s elapsed)
ibmcloud_infra_virtual_guest.web_node: Creation complete (ID: 34025457)

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path:

Outputs:

cloudant_db_id = fb917478-23fd-49e6-a7bd-af99c1656fe3
node_ids = [
    34025457
]
```

## Destroy
```
$ terraform destroy
Do you really want to destroy?
  Terraform will delete all your managed infrastructure.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

ibmcloud_infra_ssh_key.ssh_key: Refreshing state... (ID: 900421)
data.ibmcloud_cf_org.bx_org: Refreshing state...
data.ibmcloud_cf_space.bx_space: Refreshing state...
data.ibmcloud_cf_account.bx_account: Refreshing state...
ibmcloud_infra_virtual_guest.web_node: Refreshing state... (ID: 34025457)
ibmcloud_cf_service_instance.cloudant: Refreshing state... (ID: fb917478-23fd-49e6-a7bd-af99c1656fe3)
data.ibmcloud_cf_account.bx_account: Destroying... (ID: 2e9f8848b53515d920f2462cd08eab12)
data.ibmcloud_cf_account.bx_account: Destruction complete
ibmcloud_cf_service_instance.cloudant: Destroying... (ID: fb917478-23fd-49e6-a7bd-af99c1656fe3)
ibmcloud_infra_virtual_guest.web_node: Destroying... (ID: 34025457)
data.ibmcloud_cf_org.bx_org: Destroying... (ID: ee76d104-6a41-45fc-8ca1-8563dc5fd40d)
data.ibmcloud_cf_org.bx_org: Destruction complete
ibmcloud_cf_service_instance.cloudant: Destruction complete
data.ibmcloud_cf_space.bx_space: Destroying... (ID: 07405a67-e237-498e-a265-0bf708837471)
data.ibmcloud_cf_space.bx_space: Destruction complete
ibmcloud_infra_virtual_guest.web_node: Still destroying... (ID: 34025457, 10s elapsed)
ibmcloud_infra_virtual_guest.web_node: Destruction complete
ibmcloud_infra_ssh_key.ssh_key: Destroying... (ID: 900421)
ibmcloud_infra_ssh_key.ssh_key: Destruction complete

Destroy complete! Resources: 6 destroyed.
```
