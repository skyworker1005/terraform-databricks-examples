# 허브 앤 스포크 방화벽으로 데이터 유출 방지를 위한 Azure Databricks 작업 공간 프로비저닝

이 템플릿은 Databricks 서브넷에서 모든 아웃바운드 트래픽을 제어하기 위한 방화벽을 사용하는 허브-스포크 네트워킹의 예제 배포를 제공합니다. 자세한 내용은 다음 링크를 참조하십시오: https://databricks.com/blog/2020/03/27/data-exfiltration-protection-with-azure-databricks.html

이 설정을 통해 방화벽 규칙을 설정하여 Databricks 클러스터에서 나가는 트래픽을 차단하거나 허용할 수 있습니다. 또한 방화벽을 통해 모든 스토리지 계정 접근을 차단하고, 프라이빗 엔드포인트 연결을 사용하여 특정 스토리지 계정에만 접근을 허용할 수 있습니다.

배포에 대한 IP 및 FQDN을 찾으려면 다음 링크를 참조하십시오: https://docs.microsoft.com/en-us/azure/databricks/administration-guide/cloud-configurations/azure/udr

## 전체 아키텍처

![alt text](https://raw.githubusercontent.com/databricks/terraform-databricks-examples/main/modules/adb-exfiltration-protection/images/adb-exfiltration-classic.png?raw=true)

생성할 리소스:
* 랜덤 접두어가 있는 리소스 그룹
* `az account show --query user`에서 가져온 `Owner`를 포함한 태그
* 허브 VNet의 서브넷에 있는 허브 방화벽이 있는 허브-스포크 토폴로지
* FQDN 및 IP를 사용하는 관련 방화벽 규칙

## 사용 방법

> **참고**
> 이 모듈은 Azure 리소스를 추가, 삭제 또는 업데이트하여 사용자 요구에 맞게 모듈을 맞춤화할 수 있습니다.
> 이 모듈을 사용하는 배포 예제는 [examples/adb-exfiltration-protection](../../examples/adb-exfiltration-protection)에서 찾을 수 있습니다.

1. 다양한 [모듈 소스 유형](https://developer.hashicorp.com/terraform/language/modules/sources)을 사용하여 이 모듈을 참조합니다.
2. [variables.tf](variables.tf)와 동일한 내용을 포함하는 `variables.tf`를 추가합니다.
3. `terraform.tfvars` 파일을 추가하고 정의된 각 변수에 값을 제공합니다.
4. `output.tf` 파일을 추가합니다.
5. (선택 사항) [원격 백엔드](https://developer.hashicorp.com/terraform/language/settings/backends/azurerm)를 구성합니다.
6. `terraform init`을 실행하여 Terraform을 초기화하고 제공자를 준비합니다.
7. `terraform apply`를 실행하여 리소스를 생성합니다.

## 변수 값 채우는 방법

대부분의 값은 다음 링크에서 찾을 수 있습니다: https://learn.microsoft.com/en-us/azure/databricks/resources/supported-regions 및 https://docs.microsoft.com/en-us/azure/databricks/administration-guide/cloud-configurations/azure/udr

`variables.tfvars` 파일에서 다음 변수를 설정하십시오 (큰 지역은 각 서비스의 여러 인스턴스가 있음):

```hcl
metastore         = ["consolidated-westeurope-prod-metastore.mysql.database.azure.com"]
scc_relay         = ["tunnel.westeurope.azuredatabricks.net"]
webapp_ips        = ["52.230.27.216/32"] # UDR 페이지에서 제공됨
eventhubs         = ["prod-westeurope-observabilityeventhubs.servicebus.windows.net"]
# 해당 지역에 대한 값을 찾고, Databricks 블로그 튜토리얼을 따르십시오.
firewallfqdn = ["dbartifactsprodseap.blob.core.windows.net","dbartifactsprodeap.blob.core.windows.net","dblogprodseasia.blob.core.windows.net","cdnjs.com"]
```

<!-- BEGIN_TF_DOCS -->
## Requirements(요구 사항)

| Name                                                                         | Version |
| ---------------------------------------------------------------------------- | ------- |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm)          | =2.83.0 |
| <a name="requirement_databricks"></a> [databricks](#requirement\_databricks) | 0.3.10  |

## Providers(제공자)

| Name                                                             | Version |
| ---------------------------------------------------------------- | ------- |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm)    | 2.83.0  |
| <a name="provider_external"></a> [external](#provider\_external) | 2.2.0   |
| <a name="provider_random"></a> [random](#provider\_random)       | 3.1.0   |
| <a name="provider_dns"></a> [dns](#provider\_dns)                | 3.3.0   |

## Modules

No modules.

## Resources

| Name                                                                                                                                                                                   | Type        |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [azurerm_databricks_workspace.this](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/databricks_workspace)                                              | resource    |
| [azurerm_firewall.hubfw](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/firewall)                                                                     | resource    |
| [azurerm_firewall_application_rule_collection.adbfqdn](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/firewall_application_rule_collection)           | resource    |
| [azurerm_firewall_network_rule_collection.adbfnetwork](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/firewall_network_rule_collection)               | resource    |
| [azurerm_network_security_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/network_security_group)                                          | resource    |
| [azurerm_public_ip.fwpublicip](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/public_ip)                                                              | resource    |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/resource_group)                                                          | resource    |
| [azurerm_route_table.adbroute](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/route_table)                                                            | resource    |
| [azurerm_storage_account.allowedstorage](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/storage_account)                                              | resource    |
| [azurerm_storage_account.deniedstorage](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/storage_account)                                               | resource    |
| [azurerm_subnet.hubfw](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/subnet)                                                                         | resource    |
| [azurerm_subnet.private](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/subnet)                                                                       | resource    |
| [azurerm_subnet.public](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/subnet)                                                                        | resource    |
| [azurerm_subnet_network_security_group_association.private](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/subnet_network_security_group_association) | resource    |
| [azurerm_subnet_network_security_group_association.public](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/subnet_network_security_group_association)  | resource    |
| [azurerm_subnet_route_table_association.privateudr](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/subnet_route_table_association)                    | resource    |
| [azurerm_subnet_route_table_association.publicudr](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/subnet_route_table_association)                     | resource    |
| [azurerm_virtual_network.hubvnet](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/virtual_network)                                                     | resource    |
| [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/virtual_network)                                                        | resource    |
| [azurerm_virtual_network_peering.hubvnet](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/virtual_network_peering)                                     | resource    |
| [azurerm_virtual_network_peering.spokevnet](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/virtual_network_peering)                                   | resource    |
| [random_string.naming](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string)                                                                          | resource    |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/data-sources/client_config)                                                      | data source |
| [external_external.me](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external)                                                                   | data source |

## Inputs

| Name                                                                                                           | Description | Type        | Default           | Required |
| -------------------------------------------------------------------------------------------------------------- | ----------- | ----------- | ----------------- | :------: |
| <a name="input_bypass_scc_relay"></a> [bypass\_scc\_relay](#input\_bypass\_scc\_relay)                         | n/a         | `bool`      | `true`          |    no    |
| <a name="input_dbfs_prefix"></a> [dbfs\_prefix](#input\_dbfs\_prefix)                                          | n/a         | `string`    | `"dbfs"`          |    no    |
| <a name="input_eventhubs"></a> [eventhubs](#input\_eventhubs)                                                  | n/a         | `list(string)` | n/a               |   yes    |
| <a name="input_firewallfqdn"></a> [firewallfqdn](#input\_firewallfqdn)                                         | n/a         | `list(string)` | n/a               |   yes    |
| <a name="input_hubcidr"></a> [hubcidr](#input\_hubcidr)                                                        | n/a         | `string`    | `"10.178.0.0/20"` |    no    |
| <a name="input_metastore"></a> [metastore](#input\_metastore)                                                  | n/a         | `list(string)`    | n/a               |   yes    |
| <a name="input_no_public_ip"></a> [no\_public\_ip](#input\_no\_public\_ip)                                     | n/a         | `bool`      | `true`            |    no    |
| <a name="input_private_subnet_endpoints"></a> [private\_subnet\_endpoints](#input\_private\_subnet\_endpoints) | n/a         | `list`      | `[]`              |    no    |
| <a name="input_rglocation"></a> [rglocation](#input\_rglocation)                                               | n/a         | `string`    | `"southeastasia"` |    no    |
| <a name="input_scc_relay"></a> [scc_relay](#input\_scc_relay)                                                  | n/a         | `list(string)`    | n/a               |   yes    |
| <a name="input_spokecidr"></a> [spokecidr](#input\_spokecidr)                                                  | n/a         | `string`    | `"10.179.0.0/20"` |    no    |
| <a name="input_tags"></a> [tags](#input\_tags)                                                                 | n/a         | `map`    | `{}`               |   no    |
| <a name="input_webappip"></a> [webappip](#input\_webappip)                                                     | n/a         | `list(string)`    | n/a               |   yes    |
| <a name="input_workspace_prefix"></a> [workspace\_prefix](#input\_workspace\_prefix)                           | n/a         | `string`    | `"adb"`           |    no    |

## Outputs

| Name                                                                                                                                                           | Description |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| <a name="output_arm_client_id"></a> [arm\_client\_id](#output\_arm\_client\_id)                                                                                | n/a         |
| <a name="output_arm_subscription_id"></a> [arm\_subscription\_id](#output\_arm\_subscription\_id)                                                              | n/a         |
| <a name="output_arm_tenant_id"></a> [arm\_tenant\_id](#output\_arm\_tenant\_id)                                                                                | n/a         |
| <a name="output_azure_region"></a> [azure\_region](#output\_azure\_region)                                                                                     | n/a         |
| <a name="output_databricks_azure_workspace_resource_id"></a> [databricks\_azure\_workspace\_resource\_id](#output\_databricks\_azure\_workspace\_resource\_id) | n/a         |
| <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group)                                                                               | n/a         |
| <a name="output_workspace_url"></a> [workspace\_url](#output\_workspace\_url)                                                                                  | n/a         |
<!-- END_TF_DOCS -->
