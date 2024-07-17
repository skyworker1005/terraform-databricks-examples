hubcidr      = "10.178.0.0/20"
spokecidr    = "10.179.0.0/20"
no_public_ip = true
rglocation   = "koreacentral"
# We can pull this information automatically, i.e. from
# https://github.com/microsoft/AzureTRE/blob/main/templates/workspace_services/databricks/terraform/databricks-udr.json
# that is maintained by Microsoft team (although it may not be updated immediately).
# metastore = [
#   "consolidated-westeurope-prod-metastore.mysql.database.azure.com",
#   "consolidated-westeurope-prod-metastore-addl-1.mysql.database.azure.com",
#   "consolidated-westeurope-prod-metastore-addl-2.mysql.database.azure.com",
#   "consolidated-westeurope-prod-metastore-addl-3.mysql.database.azure.com",
#   "consolidated-westeuropec2-prod-metastore-0.mysql.database.azure.com",
#   "consolidated-westeuropec2-prod-metastore-1.mysql.database.azure.com",
#   "consolidated-westeuropec2-prod-metastore-2.mysql.database.azure.com",
#   "consolidated-westeuropec2-prod-metastore-3.mysql.database.azure.com",
# ]
metastore = [ "consolidated-koreacentral-prod-metastore.mysql.database.azure.com" ]
// get from https://learn.microsoft.com/en-us/azure/databricks/resources/supported-regions#--metastore-artifact-blob-storage-system-tables-blob-storage-log-blob-storage-and-event-hub-endpoint-ip-addresses
# scc_relay = [
#   "tunnel.westeurope.azuredatabricks.net",
#   "tunnel.westeuropec2.azuredatabricks.net"
# ]
scc_relay = [ "tunnel.koreacentral.azuredatabricks.net" ]
# webapp_ips = [
#   "52.232.19.246/32",
#   "40.74.30.80/32",
#   "20.103.219.240/28",
#   "4.150.168.160/28",
# ]
webapp_ips = [ "52.141.22.164/32", "20.214.117.160/28", "4.150.168.160/28" ]
# eventhubs = [
#   "prod-westeurope-observabilityeventhubs.servicebus.windows.net",
#   "prod-westeuc2-observabilityeventhubs.servicebus.windows.net",
# ]
eventhubs = [ "prod-koreacentral-observabilityeventhubs.servicebus.windows.net" ]
dbfs_prefix       = "dbfs"
workspace_prefix  = "adb"
firewallfqdn = [ // dbfs rule will be added - depends on dbfs storage name
  "dbartifactsprodkoreacen.blob.core.windows.net", //databricks artifacts
  "dbartifactsprodwestus.blob.core.windows.net", //databricks artifacts secondary
  "ucstprdkoreacen.dfs.core.windows.net",          // system tables storage
  "dblogprodkoreacentral.blob.core.windows.net",    //log blob
  "cdnjs.com",                                    //ganglia
  // Azure monitor
  "global.handler.control.monitor.azure.com",
  "koreacentral.handler.control.monitor.azure.com",
]

