# Lakehouse terraform 블루프린트

이 예제는 [adb-lakehouse 모듈](../../modules/adb-lakehouse)을 사용하여 Lakehouse 플랫폼을 프로비저닝하는 데 사용되는 Terraform 코드를 포함하고 있습니다. 또한 다음을 생성하는 Terraform 코드도 포함되어 있습니다:
* Unity Catalog 메타스토어
* Unity Catalog 리소스: Catalog, Schema, 테이블, 스토리지 자격 증명 및 외부 위치
* Databricks 계정의 새로운 주체(principals)를 생성하고 이들을 Databricks 작업 공간에 할당

## 배포된 리소스

이 예제는 다음을 배포하는 데 사용할 수 있습니다:

![Azure Lakehouse 플랫폼](https://raw.githubusercontent.com/databricks/terraform-databricks-examples/main/modules/adb-lakehouse/images/azure_lakehouse_platform_diagram.png?raw=true)

* 새로운 리소스 그룹
* 네트워킹 리소스:
  * Azure VNet
  * Azure Databricks 작업 공간에 필요한 서브넷
  * Azure 라우트 테이블(필요한 경우)
  * 네트워크 보안 그룹(NSG)
* Lakehouse 플랫폼 리소스:
  * Azure Databricks 작업 공간
  * Azure Data Factory
  * Azure Key Vault
  * Azure Storage 계정
* Unity Catalog 리소스:
  * Unity Catalog 메타스토어
  * UC 메타스토어를 Azure Databricks 작업 공간에 할당
  * Azure Databricks 계정에서 주체(그룹 및 서비스 주체) 생성
  * 주체를 Azure Databricks 작업 공간에 할당
  * Unity Catalog 리소스(catalogs, schemas, external locations, grants) 생성

## 사용 방법

1. `terraform.tfvars` 파일을 업데이트하여 정의된 각 변수에 값을 제공합니다.
2. (선택 사항) [원격 백엔드](https://developer.hashicorp.com/terraform/language/settings/backends/azurerm)를 구성합니다.
3. `terraform init`을 실행하여 Terraform을 초기화하고 제공자를 준비합니다.
4. `terraform apply`를 실행하여 리소스를 생성합니다.
