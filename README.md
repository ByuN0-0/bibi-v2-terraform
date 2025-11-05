# Bibi Bot v2

Discord bot을 Go로 다시 구현한 프로젝트입니다. (v1은 Java)

## 개요

Bibi Bot v2는 Terraform을 이용한 인프라 관리와 GCP 기반 CI/CD 파이프라인을 통해 자동으로 배포됩니다.

## 스택

- **Language**: Go
- **Infrastructure**: Terraform
- **Cloud**: Google Cloud Platform (GCP)
- **Compute**: Compute Engine (e2-micro, us-west1)
- **Registry**: Google Container Registry (GCR)
- **Storage**: Google Cloud Storage (COS)

## 인프라 구성

### Compute Instance

- **Machine Type**: e2-micro
- **Region**: us-west1
- **Image**: Container-Optimized OS (COS)

## CI/CD 파이프라인

1. **Build**: Go 애플리케이션 빌드
2. **Push**: Docker 이미지를 Google Container Registry에 푸시
3. **Deploy**: SSH를 통해 인스턴스 접속
4. **Stop**: 기존 컨테이너 중지
5. **Run**: 새 이미지로 컨테이너 실행

## 디렉토리 구조

```
.
├── terraform/          # Terraform 설정
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── app/               # Go 애플리케이션
│   ├── main.go
│   └── ...
├── docker/            # Docker 이미지 정의
│   └── Dockerfile
├── scripts/           # 배포 스크립트
│   └── deploy.sh
└── README.md
```

## 시작하기

### 요구사항

- Terraform
- Docker
- GCP 계정 및 설정된 인증
