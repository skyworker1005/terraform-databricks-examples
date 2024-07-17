# Azure Databricks 작업 공간을 위한 허브 앤 스포크 방화벽 구성으로 데이터 유출 방지

이 예제는 [adb-exfiltration-protection](../../modules/adb-exfiltration-protection) 모듈을 사용합니다.

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

1. `terraform.tfvars` 파일을 업데이트하고 각 정의된 변수에 값을 제공합니다.
2. (선택 사항) [원격 백엔드](https://developer.hashicorp.com/terraform/language/settings/backends/azurerm)를 구성합니다.
3. `terraform init`을 실행하여 Terraform을 초기화하고 제공자를 준비합니다.
4. `terraform apply`를 실행하여 리소스를 생성합니다.

## 변수 값 채우는 방법

대부분의 값은 다음 링크에서 찾을 수 있습니다: https://docs.microsoft.com/en-us/azure/databricks/administration-guide/cloud-configurations/azure/udr

`variables.tfvars` 파일에서 다음 변수를 설정하십시오:

metastoreip = "40.78.233.2" # 메타스토어 서비스 IP를 찾으십시오.

sccip = "52.230.27.216" # 도메인 이름에서 nslookup을 사용하여 IP를 찾으십시오.

webappip = "52.187.145.107/32" # UDR 페이지에서 제공됩니다.

firewallfqdn = ["dbartifactsprodseap.blob.core.windows.net","dbartifactsprodeap.blob.core.windows.net","dblogprodseasia.blob.core.windows.net","prod-southeastasia-observabilityeventhubs.servicebus.windows.net","cdnjs.com"] # 해당 지역에 대한 값을 찾고, Databricks 블로그 튜토리얼을 따르십시오.

<!-- BEGIN_TF_DOCS -->
## 요구 사항

| 이름                                                                         | 버전 |
| ---------------------------------------------------------------------------- | ----- |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm)          | =2.83.0 |
| <a name="requirement_databricks"></a> [databricks](#requirement\_databricks) | 0.3.10 |

## 제공자

| 이름                                                             | 버전 |
| ---------------------------------------------------------------- | ----- |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm)    | 2.83.0 |
| <a name="provider_external"></a> [external](#provider\_external) | 2.2.0 |
| <a name="provider_random"></a> [random](#provider\_random)       | 3.1.0 |

## 모듈

모듈 없음.

## 리소스

| 이름                                                                                                                                                                                   | 유형        |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [azurerm_databricks_workspace.this](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/databricks_workspace)                                              | 리소스    |
| [azurerm_firewall.hubfw](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/firewall)                                                                     | 리소스    |
| [azurerm_firewall_application_rule_collection.adbfqdn](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/firewall_application_rule_collection)           | 리소스    |
| [azurerm_firewall_network_rule_collection.adbfnetwork](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/firewall_network_rule_collection)               | 리소스    |
| [azurerm_network_security_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/network_security_group)                                          | 리소스    |
| [azurerm_public_ip.fwpublicip](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/public_ip)                                                              | 리소스    |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/resource_group)                                                          | 리소스    |
| [azurerm_route_table.adbroute](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/route_table)                                                            | 리소스    |
| [azurerm_storage_account.allowedstorage](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/storage_account)                                              | 리소스    |
| [azurerm_storage_account.deniedstorage](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/storage_account)                                               | 리소스    |
| [azurerm_subnet.hubfw](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/subnet)                                                                         | 리소스    |
| [azurerm_subnet.private](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/subnet)                                                                       | 리소스    |
| [azurerm_subnet.public](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/subnet)                                                                        | 리소스    |
| [azurerm_subnet_network_security_group_association.private](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/subnet_network_security_group_association) | 리소스    |
| [azurerm_subnet_network_security_group_association.public](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/subnet_network_security_group_association)  | 리소스    |
| [azurerm_subnet_route_table_association.privateudr](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/subnet_route_table_association)                    | 리소스    |
| [azurerm_subnet_route_table_association.publicudr](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/subnet_route_table_association)                     | 리소스    |
| [azurerm_virtual_network.hubvnet](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/virtual_network)                                                     | 리소스    |
| [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/virtual_network)                                                        | 리소스    |
| [azurerm_virtual_network_peering.hubvnet](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/virtual_network_peering)                                     | 리소스    |
| [azurerm_virtual_network_peering.spokevnet](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/resources/virtual_network_peering)                                   | 리소스    |
| [random_string.naming](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string)                                                                          | 리소스    |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/2.83.0/docs/data-sources/client_config)                                                      | 데이터 소스 |
| [external_external.me](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external)                                                                   | 데이터 소스 |

## 입력 값

| 이름                                                                                                           | 설명 | 유형        | 기본값           | 필수 여부 |
| -------------------------------------------------------------------------------------------------------------- | --- | ----------- | ----------------- | :------: |
| <a name="input_dbfs_prefix"></a> [dbfs\_prefix](

#input\_dbfs\_prefix)                                          | 없음 | `string`    | `"dbfs"`          |    아니오    |
| <a name="input_firewallfqdn"></a> [firewallfqdn](#input\_firewallfqdn)                                         | 없음 | `list(any)` | 없음               |   예    |
| <a name="input_hubcidr"></a> [hubcidr](#input\_hubcidr)                                                        | 없음 | `string`    | `"10.178.0.0/20"` |    아니오    |
| <a name="input_metastoreip"></a> [metastoreip](#input\_metastoreip)                                            | 없음 | `string`    | 없음               |   예    |
| <a name="input_no_public_ip"></a> [no\_public\_ip](#input\_no\_public\_ip)                                     | 없음 | `bool`      | `true`            |    아니오    |
| <a name="input_private_subnet_endpoints"></a> [private\_subnet\_endpoints](#input\_private\_subnet\_endpoints) | 없음 | `list`      | `[]`              |    아니오    |
| <a name="input_rglocation"></a> [rglocation](#input\_rglocation)                                               | 없음 | `string`    | `"southeastasia"` |    아니오    |
| <a name="input_sccip"></a> [sccip](#input\_sccip)                                                              | 없음 | `string`    | 없음               |   예    |
| <a name="input_spokecidr"></a> [spokecidr](#input\_spokecidr)                                                  | 없음 | `string`    | `"10.179.0.0/20"` |    아니오    |
| <a name="input_webappip"></a> [webappip](#input\_webappip)                                                     | 없음 | `string`    | 없음               |   예    |
| <a name="input_workspace_prefix"></a> [workspace\_prefix](#input\_workspace\_prefix)                           | 없음 | `string`    | `"adb"`           |    아니오    |

## 출력 값

| 이름                                                                                                                                                           | 설명 |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------- | --- |
| <a name="output_arm_client_id"></a> [arm\_client\_id](#output\_arm\_client\_id)                                                                                | 없음         |
| <a name="output_arm_subscription_id"></a> [arm\_subscription\_id](#output\_arm\_subscription\_id)                                                              | 없음         |
| <a name="output_arm_tenant_id"></a> [arm\_tenant\_id](#output\_arm\_tenant\_id)                                                                                | 없음         |
| <a name="output_azure_region"></a> [azure\_region](#output\_azure\_region)                                                                                     | 없음         |
| <a name="output_databricks_azure_workspace_resource_id"></a> [databricks\_azure\_workspace\_resource\_id](#output\_databricks\_azure\_workspace\_resource\_id) | 없음         |
| <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group)                                                                               | 없음         |
| <a name="output_workspace_url"></a> [workspace\_url](#output\_workspace\_url)                                                                                  | 없음         |
