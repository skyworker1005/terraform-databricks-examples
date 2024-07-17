hubcidr          = "10.178.0.0/20"
spokecidr        = "10.179.0.0/20"
rglocation       = "koreacentral"
metastoreip      = "40.78.233.2"
dbfs_prefix      = "kdp"
workspace_prefix = "kdp"
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


# hubcidr      = "10.178.0.0/20"
# spokecidr    = "10.179.0.0/20"
# no_public_ip = true
# rglocation   = "koreacentral"
# metastore = [ "consolidated-koreacentral-prod-metastore.mysql.database.azure.com" ]
# scc_relay = [ "tunnel.koreacentral.azuredatabricks.net" ]
# webapp_ips = [ "52.141.22.164/32", "20.214.117.160/28", "4.150.168.160/28" ]
# eventhubs = [ "prod-koreacentral-observabilityeventhubs.servicebus.windows.net" ]
# dbfs_prefix       = "dbfs"
# workspace_prefix  = "adb"
# firewallfqdn = [ // dbfs rule will be added - depends on dbfs storage name
#   "dbartifactsprodkoreacen.blob.core.windows.net", //databricks artifacts
#   "dbartifactsprodwestus.blob.core.windows.net", //databricks artifacts secondary
#   "ucstprdkoreacen.dfs.core.windows.net",          // system tables storage
#   "dblogprodkoreacentral.blob.core.windows.net",    //log blob
#   "cdnjs.com",                                    //ganglia
#   // Azure monitor
#   "global.handler.control.monitor.azure.com",
#   "koreacentral.handler.control.monitor.azure.com",
# ]

