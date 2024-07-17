# Lakehouse terraform 블루프린트

이 모듈에는 Lakehouse 플랫폼을 프로비저닝하는 데 사용되는 Terraform 코드가 포함되어 있습니다.

## 모듈 내용

이 모듈을 사용하여 다음을 배포할 수 있습니다:

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

## 사용 방법

> **참고**  
> 이 모듈은 Azure 리소스를 추가, 삭제 또는 업데이트하여 요구 사항에 맞게 사용자 정의할 수 있습니다.
> 이 모듈을 사용하는 배포 예제는 [examples/adb-lakehouse](../../examples/adb-lakehouse)에서 찾을 수 있습니다.

1. 다양한 [모듈 소스 유형](https://developer.hashicorp.com/terraform/language/modules/sources)을 사용하여 이 모듈을 참조합니다.
2. [variables.tf](variables.tf)와 동일한 내용을 포함하는 `variables.tf`를 추가합니다.
3. `terraform.tfvars` 파일을 추가하고 정의된 각 변수에 값을 제공합니다.
4. `output.tf` 파일을 추가합니다.
5. (선택 사항) [원격 백엔드](https://developer.hashicorp.com/terraform/language/settings/backends/azurerm)를 구성합니다.
6. `terraform init`을 실행하여 Terraform을 초기화하고 제공자를 준비합니다.
7. `terraform apply`를 실행하여 리소스를 생성합니다.
```