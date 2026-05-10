---
title: 금융 자산 관리 웹 애플리케이션 프로젝트
lang: ko
ref: financial-assets-management-web-application-project
author: 
date: 2025-09-20 12:00:00 +0900
categories: [Projects, ASP.NET, React]
tags: [dotnet, aspnet-core, react, typescript, postgresql, finance, personal-finance, portfolio]
render_with_liquid: false
permalink: /ko/posts/financial-assets-management-web-application-project/
---

## 1. 요약

**Asset-Dash** 는 구글 스프레드시트 기반의 자산 관리 시스템을 대체하기 위해 만든 개인 재무 웹 애플리케이션입니다. 자산 관리, 투자 포트폴리오 모니터링, 신용카드 트래킹, 현금흐름 관리, 예산·지출 관리, 장기 재무 계획까지 종합적인 재무 트래킹 기능을 제공합니다.

기존 기능을 모두 유지하면서도 자동화 강화, 실시간 데이터 갱신, 시각화 개선까지 갖춘 견고하고 안전하며 사용자 친화적인 플랫폼이 필요했습니다.

**핵심 가치 제안:**
- 실시간 순자산 추적이 가능한 통합 재무 대시보드
- 현재 시장 가격을 반영한 투자 포트폴리오 자동 업데이트
- 결제일 알림과 혜택 트래킹이 적용된 신용카드 관리
- 카테고리별 지출 배분 기반의 예산 트래킹
- 연령 기반 자산 배분 글라이드 패스가 적용된 장기 재무 계획
- 다중 통화 지원 (USD, KRW)
- 다국어 지원 (영어, 한국어)
- 스프레드시트보다 강화된 데이터 보안

### 비전

직관적이고 종합적이며 안전한 개인 재무 플랫폼을 통해 복잡한 금융 데이터를 실행 가능한 인사이트로 바꿔, 개인이 자신의 재무 미래를 완전히 통제할 수 있도록 돕습니다.

## 2. 기술 스택

### 2.1 백엔드 (.NET)

**프레임워크:**
- **ASP.NET Core 8.0:** 웹 API 를 위한 최신 LTS 버전
- **C# 12:** .NET 8 과 함께 출시된 C# 버전

**데이터 액세스:**
- **Entity Framework Core 8:** 데이터베이스 작업을 위한 ORM
- **Dapper:** 최적화가 필요한 복잡 쿼리에 사용
- **PostgreSQL:** 주 데이터베이스 (비용 측면에서 추천)

**인증과 보안:**
- **ASP.NET Core Identity:** 사용자 인증과 인가
- **JWT 토큰:** API 인증
- **IdentityServer / Auth0:** OAuth 2.0 / OIDC (향후)

**API 문서화:**
- **Swashbuckle (Swagger):** OpenAPI 문서

**백그라운드 작업:**
- **Hangfire:** 스케줄 작업 (가격 업데이트, 알림)
- **Quartz.NET:** 복잡한 스케줄링을 위한 대안

**캐싱:**
- **Redis / 인메모리 캐시:** 세션 관리와 성능 향상

**로깅과 모니터링:**
- **Serilog:** 구조화 로깅
- **Application Insights / Seq:** 로그 집계와 모니터링

**테스트:**
- **xUnit:** 단위 테스트 프레임워크
- **Moq:** 모킹 프레임워크
- **FluentAssertions:** 단언 라이브러리

### 2.2 프론트엔드

**프레임워크:**
- **React 18+ with TypeScript:** 타입 안전성을 갖춘 모던 UI 라이브러리
- **Next.js:** SSR 과 SEO 가 필요할 때

**상태 관리:**
- **React Query / TanStack Query:** 서버 상태 관리
- **Zustand / Redux Toolkit:** 클라이언트 상태 관리

**UI 컴포넌트:**
- **Tailwind CSS:** 유틸리티 우선 CSS 프레임워크
- **shadcn/ui or Radix UI:** 접근성 좋은 컴포넌트 프리미티브
- **Chart.js / Recharts:** 데이터 시각화
- **date-fns:** 날짜 처리

**폼:**
- **React Hook Form:** 폼 상태 관리
- **Zod:** 스키마 검증

**HTTP 클라이언트:**
- **Axios:** 인터셉터를 갖춘 HTTP 요청

**빌드 도구:**
- **Vite:** 빠른 개발 서버와 빌드 도구
- **pnpm / npm:** 패키지 관리

### 9.3 외부 API

**시장 데이터:**
- **Alpha Vantage:** 주식과 암호화폐 가격 (무료 티어 제공)
- **IEX Cloud:** 실시간 주식 데이터
- **Yahoo Finance API:** 가격 데이터 대안
- **CoinGecko:** 암호화폐 가격

**금융 정보 통합 (향후):**
- **Plaid:** 은행 계좌 통합
- **Yodlee:** 통합 서비스 대안

**환율:**
- **exchangerate-api.com:** USD/KRW 환율 변환
- **Open Exchange Rates:** 대안

**부동산 평가:**
- **Zillow API (Zestimate):** 매물 평가, 임대료 추정, 시장 데이터
  - 엔드포인트: Zillow GetSearchResults, GetZestimate, GetRentZestimate API
  - 호출 제한: 무료 티어 1일 1,000회
  - 데이터: 현재 주택 가치(Zestimate), 임대 가치(Rent Zestimate), 매물 상세, 시장 동향
  - 갱신 주기: 매물 가치는 매일
- **Redfin:** 부동산 데이터와 매물 평가의 대안
  - 공개 데이터 스크래핑이나 API 접근을 위한 파트너십
  - 데이터: 현재 시장 가치, 추정 임대료, 시장 노출 일수, 매물 특성
  - 참고: Redfin 은 공개 API 를 제공하지 않으므로 웹 스크래핑이나 서드파티 통합이 필요할 수 있음
- **Attom Data Solutions:** 종합 부동산 데이터 API (상용 대안)
  - 매물 평가, 임대 추정, 세금 평가, 압류 데이터
  - 호출 제한: 구독 티어에 따라 다름

**알림:**
- **SendGrid / Amazon SES:** 이메일 발송
- **Twilio:** SMS 알림 (향후)

### 2.4 DevOps & 인프라

**버전 관리:**
- **Git / GitHub:** 소스 관리와 협업

**CI/CD:**
- **GitHub Actions:** 자동 빌드와 배포
- **Azure DevOps:** 대안

**호스팅:**
- **Azure App Service:** 매니지드 웹 호스팅
- **AWS Elastic Beanstalk:** 대안
- **Docker:** 컨테이너화

**데이터베이스 호스팅:**
- **Azure SQL Database / PostgreSQL on Azure**
- **AWS RDS:** 대안
- **Supabase:** 빌트인 기능을 갖춘 PostgreSQL

**스토리지:**
- **Azure Blob Storage:** 파일 저장과 백업
- **AWS S3:** 대안

**모니터링:**
- **Application Insights:** 성능 모니터링
- **Sentry:** 오류 추적

---
