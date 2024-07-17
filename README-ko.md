# terraform-databricks-examples

이 리포지토리에는 다음과 같은 내용이 포함되어 있습니다:

- [Databricks Terraform provider](https://registry.terraform.io/providers/databricks/databricks/latest/docs)를 사용하여 Azure, AWS 및 GCP에서 Databricks 작업 공간 및 리소스를 배포하는 여러 예제.
- Azure DevOps 또는 GitHub Actions를 사용하여 Terraform 배포를 자동화하는 CI/CD 파이프라인 구현 예제.

* [리포지토리 사용](#using-the-repository)
* [리포지토리 구조](#repository-structure)
* [리포지토리 내용](#repository-content)
   * [예제](#examples)
   * [모듈](#modules)
   * [CI/CD 파이프라인](#cicd-pipelines)
* [기여](#contributing)

## 리포지토리 사용

이 리포지토리를 사용하는 두 가지 방법이 있습니다:

1. 자신의 Terraform 코드에 대한 참조로 예제를 사용: 개별 예제는 `examples` 폴더를 참조하세요.
2. 이 리포지토리에서 모듈 재사용: `modules` 폴더를 참조하세요.

## 리포지토리 구조

리포지토리의 코드는 다음 폴더로 구성되어 있습니다:

- `modules` - 특정 Terraform 모듈의 구현.
- `examples` - Terraform 모듈을 사용하는 특정 인스턴스.
- `cicd-pipelines` - Azure DevOps 또는 GitHub Actions를 사용하여 Terraform 배포를 자동화하는 CI/CD 파이프라인의 상세 예제.

## 리포지토리 내용

> **참고**  
> 예제, 모듈 또는 CI/CD 파이프라인에 대한 자세한 내용은 해당 폴더 내의 `README.md` 파일을 참조하여 CI/CD 파이프라인 설정에 대한 자세한 가이드를 확인하세요.

### 예제

`examples` 폴더에는 다음과 같은 Terraform 구현 예제가 포함되어 있습니다:

| 클라우드 | 예제                                                                            | 설명                                                                                                                                                   |
| ----- | ---------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Azure | [adb-lakehouse](examples/adb-lakehouse/)         | Lakehouse Terraform 블루프린트|
| Azure | [adb-with-private-link-standard](examples/adb-with-private-link-standard/)         | Private Link을 사용하여 Azure에 Databricks를 프로비저닝 - [표준 배포](https://learn.microsoft.com/en-us/azure/databricks/administration-guide/cloud-configurations/azure/private-link-standard) |
| Azure | [adb-vnet-injection](examples/adb-vnet-injection/)                                 | VNet 주입된 Azure Databricks 작업 공간의 기본 예제                                                                                                                                          |
| Azure | [adb-exfiltration-protection](examples/adb-exfiltration-protection/)               | [데이터 유출 방지](https://www.databricks.com/blog/2020/03/27/data-exfiltration-protection-with-azure-databricks.html)의 샘플 구현                                        |
| Azure | [adb-external-hive-metastore](examples/adb-external-hive-metastore/)               | [외부 하이브 메타스토어](https://learn.microsoft.com/en-us/azure/databricks/data/metastores/external-hive-metastore)를 구현하는 예제 템플릿                                                  |
| Azure | [adb-kafka](examples/adb-kafka/)                                                   | ADB - 단일 노드 카프카 템플릿                                                                                                                                                                     |
| Azure | [adb-private-links](examples/adb-private-links/)                                   | Azure Databricks Private Links                                                                                                                                                                       |
| Azure | [adb-splunk](examples/adb-splunk/)                                                 | 단일 VM Splunk 통합이 있는 ADB 작업 공간                                                                                                                                                      |
| Azure | [adb-squid-proxy](examples/adb-squid-proxy/)                                       | HTTP 프록시가 있는 ADB 클러스터                                                                                                                                                                         |
| Azure | [adb-teradata](examples/adb-teradata/)                                             | 단일 VM Teradata 통합이 있는 ADB                                                                                                                                                              |
| Azure | [adb-uc](examples/adb-uc/)                                                         | ADB Unity Catalog 프로세스                                                                                                                                                                            |
| Azure | [adb-unity-catalog-basic-demo](examples/adb-unity-catalog-basic-demo/)             | UC 메타스토어 설정, AAD에서 Databricks 계정으로 사용자/그룹 동기화, UC 카탈로그, 외부 위치, 스키마 및 액세스 권한 부여를 포함한 ADB Unity Catalog 엔드 투 엔드 데모                           |
| Azure | [adb-overwatch](examples/adb-overwatch/)             | Azure에서 Overwatch 다중 작업 공간 배포                          |
| AWS   | [aws-workspace-basic](examples/aws-workspace-basic/)                               | AWS Databricks E2 프로비저닝                                                                                                                                                                       |
| AWS   | [aws-workspace-with-firewall](examples/aws-workspace-with-firewall/)               | AWS 방화벽이 있는 AWS Databricks E2 프로비저닝                                                                                                                                                  |
| AWS   | [aws-exfiltration-protection](examples/aws-exfiltration-protection/)               | [AWS에서 데이터 유출 방지](https://www.databricks.com/blog/2021/02/02/data-exfiltration-protection-with-databricks-on-aws.html)의 구현                                      |
| AWS   | aws-workspace-with-private-link                                                    | 곧 제공 예정                                                                                                                                                                                          |
| AWS   | [aws-databricks-flat](examples/aws-databricks-flat/)                               | AWS Databricks 간단한 예제                                                                                                                                                                        |
| AWS   | [aws-databricks-modular-privatelink](examples/aws-databricks-modular-privatelink/) | 여러 AWS Databricks 작업 공간 배포                                                                                                                                                            |
| AWS   | [aws-workspace-uc-simple](examples/aws-workspace-uc-simple/)                       | 단일 적용으로 Unity Catalog가 있는 AWS Databricks E2 프로비저닝                                                                                                                                                                                               |
| AWS   | [aws-databricks-uc](examples/aws-databricks-uc/)                                   | AWS UC                                                                                                                                                                                               |
| AWS   | [aws-databricks-uc-bootstrap](examples/aws-databricks-uc-bootstrap/)               | AWS UC                                                                                                                                                                                               |
| AWS   | [aws-remote-backend-infra](examples/aws-remote-backend-infra/)                     | 원격 백엔드에 대한 간단한 예제                                                                                                                                                                     |
| AWS   | [aws-workspace-config](examples/aws-workspace-config/)                             | 작업 공간 객체 구성                                                                                 |
| GCP   | [gcp-sa-provisionning](examples/gcp-sa-provisionning/)                                                                         | GCP에 배포하기 위해 필요한 권한을 가진 ID 프로비저닝.                                                                                                                                 |
| GCP   | [gcp-basic](examples/gcp-basic/)                                                                         | 관리형 VPC로 작업 공간 배포                                                                                                                               |
| GCP   | [gcp-byovpc](examples/gcp-byovpc/)                                                                         | 고객이 관리하는 VPC로 작업 공간 배포                                                                                                                              |

### 모듈

`modules` 폴더에는 다음과 같은 Terraform 모듈이 포함되어 있습니다:

| 클라우드 | 모듈                                                                                                    | 설명                                                                                                                                                                               |
| ----- |-----------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| All   | [databricks-department-clusters](modules/databricks-department-clusters/)                                 | 팀을 위한 Databricks 리소스를 생성하는 Terraform 모듈                                                                                                                             |
| Azure | [adb-lakehouse](modules/adb-lakehouse/)                                                                   | Lakehouse Terraform 블루프린트                                                                                                                                                            |
| Azure | [adb-lakehouse-uc](modules/adb-lakehouse-uc/)                                                             | Unity Catalog 리소스 및 계정 주체 프로비저닝                                                                                                                              |
| Azure | [adb-with-private-link-standard](modules/adb-with-private-link-standard/)                                 | Private Link을 사용하여 Azure에 Databricks를 프로비저닝 - 표준 배포                                                                                                                  |
| Azure | [adb-exfiltration-protection](modules/adb-exfiltration-protection/)                                       | [데이터 유출 방지](https://www.databricks.com/blog/2020/03/27/data-exfiltration-protection-with-azure-databricks.html)의 샘플 구현                             |
| Azure | [adb-with-private-links-exfiltration-protection](modules/adb-with-private-links-exfiltration-protection/) | Private Link 및 [데이터 유출 방지](https://www.databricks.com/blog/2020/03/27/data-exfiltration-protection-with-azure-databricks.html)를 사용하여 Azure에 Databricks 프로비저닝 |
| Azure | [adb-overwatch-regional-config](modules/adb-overwatch-regional-config/)                                   | Azure에서 Overwatch 지역 구성                                                                                                                                                 |
| Azure | [adb-overwatch-mws-config](modules/adb-overwatch-mws-config/)                                             | Azure에서 Overwatch 다중 작업 공간 배포                                                                                                                                             |
| Azure | [adb-overwatch-main-ws](modules/adb-overwatch-main-ws/)                                                   | 주요 Overwatch 작업 공간 배포                                                                                                                                                       |
| Azure | [adb-overwatch-ws-to-monitor](modules/adb-overwatch-ws-to-monitor/)                                       | 모니터링할 Azure 작업 공간에서 Overwatch 배포                                                                                                                                    |
| Azure | [adb-overwatch-analysis](modules/adb-overwatch-analysis/)                                                 | Azure에서 Overwatch analysis notebooks 배포 |



### CI/CD 파이프라인

`cicd-pipelines` 폴더에는 다음과 같은 파이프라인 구현 예제가 포함되어 있습니다:

| 도구           | CI/CD 파이프라인                                                                           |
| -------------- | ---------------------------------------------------------------------------------------- |
| GitHub Actions | [manual-approve-with-github-actions](cicd-pipelines/manual-approve-with-github-actions/) |
| Azure DevOps   | [manual-approve-with-azure-devops](cicd-pipelines/manual-approve-with-azure-devops/)     |

## 기여

새 코드를 기여할 때는 다음 구조를 따라 주세요:

* 재사용 가능한 코드는 `modules` 디렉토리에 넣어 Terraform registry에 게시될 때 쉽게 포함될 수 있도록 합니다. 모든 기능을 구현하는 큰 모듈보다는 특정 기능을 구현하는 여러 작은 모듈로 구성된 모듈형 설계를 선호합니다. 예를 들어, Unity Catalog 객체에 대한 별도의 모듈은 모든 클라우드에서 사용할 수 있으므로 클라우드별 모듈에서 동일한 기능을 재구현할 필요가 없습니다.
* 모듈 사용 예제를 `examples` 디렉토리에 제공하여 주어진 모듈을 사용하는 방법을 보여줍니다.