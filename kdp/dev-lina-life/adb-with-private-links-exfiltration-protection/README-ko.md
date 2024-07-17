```markdown
# Private Links를 포함한 Azure Databricks (웹 인증 PE 포함) 및 허브-스포크 방화벽 구조 (데이터 유출 방지)

이 예제는 [adb-with-private-links-exfiltration-protection](../../modules/adb-with-private-links-exfiltration-protection) 모듈을 사용합니다.

포함 사항:
1. 모든 아웃바운드 트래픽을 제어하기 위한 egress 방화벽을 갖춘 허브-스포크 네트워킹 예: pypi.org로의 트래픽.
2. 데이터 플레인에서 제어 플레인으로의 백엔드 트래픽을 위한 프라이빗 링크 연결.
3. 사용자 클라이언트에서 웹앱 서비스로의 프라이빗 링크 연결.
4. 데이터 플레인에서 dbfs 스토리지로의 프라이빗 링크 연결.
5. 웹 인증 트래픽을 위한 프라이빗 엔드포인트.

전체 아키텍처:
![alt text](https://raw.githubusercontent.com/databricks/terraform-databricks-examples/main/modules/adb-with-private-links-exfiltration-protection/images/adb-private-links-general.png?raw=true)

이 배포를 통해 사용자 클라이언트에서 웹앱(노트북 UI)으로의 트래픽과 데이터 플레인에서 제어 플레인으로의 백엔드 트래픽이 프라이빗 엔드포인트를 통해 이루어집니다. 이 Terraform 샘플은 다음을 생성합니다:
* 랜덤 접두어가 있는 리소스 그룹
* `az account show --query user`에서 가져온 `Owner`를 포함한 태그
* 퍼블릭 및 프라이빗 서브넷과 프라이빗 엔드포인트를 호스팅할 서브넷을 포함한 VNet
* 제어 플레인, 사용자와 웹앱, 그리고 dbfs에 대한 프라이빗 링크가 포함된 Databricks 작업 공간

## 사용 방법

1. `terraform.tfvars` 파일을 업데이트하고 각 정의된 변수에 값을 제공합니다.
2. (선택 사항) [원격 백엔드](https://developer.hashicorp.com/terraform/language/settings/backends/azurerm)를 구성합니다.
3. `terraform init`을 실행하여 Terraform을 초기화하고 제공자를 준비합니다.
4. `terraform apply`를 실행하여 리소스를 생성합니다.
```