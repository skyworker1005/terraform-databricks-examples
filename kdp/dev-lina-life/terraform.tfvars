location = "koreacentral"
spoke_resource_group_name = "myResourceGroup"
managed_resource_group_name = "myManagedResourceGroup"
project_name = "kdp"
environment_name = "dev-lina-life"
spoke_vnet_address_space = "10.0.0.0/16"
tags = { "Environment" = "Dev", "Owner" = "YourName" }
databricks_workspace_name = "myDatabricksWorkspace"
data_factory_name = "myDataFactory"
key_vault_name = "myKeyVault"
private_subnet_address_prefixes = ["10.0.1.0/24"]
public_subnet_address_prefixes = ["10.0.2.0/24"]
storage_account_names = ["mystorageaccount1", "mystorageaccount2"]
shared_resource_group_name = "mySharedResourceGroup"
metastore_name = "myMetastore"
metastore_storage_name = "mymetastorestorage"
access_connector_name = "myAccessConnector"
service_principals = { "sp1" = { sp_id = "sp1-id", permissions = ["read", "write"] } }
account_groups = { "group1" = { group_name = "group1-name", permissions = ["read", "write"] } }
landing_external_location_name = "myLandingExternalLocation"
landing_adls_path = "/my/path"
landing_adls_rg = "myLandingAdlsRg"
metastore_admins = ["admin1", "admin2"]
account_id = "myAccountId"