#shared_resource_group_name = "kdplina"
location = "koreacentral"
//name ("my_metastore_storage") can only consist of lowercase letters and numbers, and must be between 3 and 24 characters long
# metastore_storage_name     = "kdplina"
# access_connector_name      = "my_access_connector"
# metastore_name             = "kdplina"
# tags                       = {
#     "Environment" = "Dev"
#     "Owner"       = "YourName"
# }

project_name = "kdp"
environment_name = "dev"
spoke_vnet_address_space = "10.0.0.0/16"
spoke_resource_group_name = "kdp-spoke-rg"
managed_resource_group_name = "kdp-dev-rg"
tags = {
    "Environment" = "Dev"
    "Owner"       = "LinaJMH"
}
databricks_workspace_name = "kdp-databricks"
data_factory_name      = "kdp-data-factory"
key_vault_name         = "kdp-key-vault"

# Subnet Name: "private-subnet-kdp-databricks"): performing CreateOrUpdate: unexpected status 400 (400 Bad Request) with error: DelegatedSubnetNotSupportedForMultiPrefix: Multiple prefixes in a subnet not supported in case of delegations. Subnet referred: private-subnet-kdp-databricks
private_subnet_address_prefixes = ["10.0.2.0/24"]
public_subnet_address_prefixes  = ["10.0.1.0/24"]
storage_account_names           = ["kdplina"]
access_connector_name          = "kdp-access-connector"
#shared_resource_group_name = "kdplina"  
#metastore_name = "kdplina"
#metastore_storage_name = "kdplina"

