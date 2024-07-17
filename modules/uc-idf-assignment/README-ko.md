# Unity Catalog 및 Identity Federation 할당

이 모듈은 선택한 작업 공간에 Unity Catalog를 할당하고 Identity Federation을 활성화하는 데 사용되는 Terraform 코드를 포함하고 있습니다.

## 모듈 내용

이 모듈을 사용하여 다음 작업을 수행할 수 있습니다:

* 지정된 작업 공간에 Unity Catalog 메타스토어 할당
* 지정된 작업 공간에 그룹 및 서비스 주체 할당

## 사용 방법

> **참고**  
> 이 모듈을 사용하는 배포 예제는 [examples/adb-lakehouse](../../examples/adb-lakehouse)에서 찾을 수 있습니다.

1. 다양한 [모듈 소스 유형](https://developer.hashicorp.com/terraform/language/modules/sources)을 사용하여 이 모듈을 참조합니다.
2. [variables.tf](variables.tf)와 동일한 내용을 포함하는 `variables.tf`를 추가합니다.
3. `terraform.tfvars` 파일을 추가하고 정의된 각 변수에 값을 제공합니다.
4. `output.tf` 파일을 추가합니다.
5. (선택 사항) [원격 백엔드](https://developer.hashicorp.com/terraform/language/settings/backends/azurerm)를 구성합니다.
6. `terraform init`을 실행하여 Terraform을 초기화하고 제공자를 준비합니다.
7. `terraform apply`를 실행하여 리소스를 생성합니다.


