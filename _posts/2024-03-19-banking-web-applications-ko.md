---
title: 뱅킹 웹 애플리케이션 프로젝트
lang: ko
ref: banking-web-applications
author: 
date: 2024-03-19 12:00:00 +0900
categories: [Projects, Next.js]
tags: [Next.js, TypeScript,TailwindCSS]
render_with_liquid: false
permalink: /ko/posts/banking-web-applications/
---

## 설명

프리랜스 프로젝트로 종합 뱅킹 웹 애플리케이션을 개발했습니다. SSR 기반의 강력한 인증, Plaid 를 활용한 다중 은행 계좌 연동, 모든 페이지에서의 실시간 업데이트 등 고급 기능을 통합했습니다. 사용자에게는 총 잔고, 최근 거래, 카테고리별 지출까지 계좌 전반을 한눈에 볼 수 있는 대시보드를 제공합니다. 연결된 모든 은행을 확인하고, 거래 내역을 필터링하며, Dwolla 를 통해 송금까지 가능합니다. 모든 디바이스에서 일관된 경험을 제공하도록 완전 반응형이며, 유지보수성을 위해 코드 아키텍처와 재사용성에 신경을 썼습니다.

## 기술 스택
Next.js, TypeScript, Appwrite, Plaid, Dwolla, React Hook Form, Zod, TailwindCSS, Chart.js, ShadCN

## 주요 기능

### 안전한 인증과 계좌 관리
적절한 검증과 인가가 적용된 SSR 기반의 강력한 인증으로 사용자 계정을 항상 보호합니다. Plaid 와 연동되어 사용자가 여러 은행 계좌를 매끄럽게 연결할 수 있고, 연결된 모든 은행의 잔고와 계좌 상세 정보를 한 화면에서 종합적으로 관리할 수 있습니다.

### 계좌 개요와 거래 관리
홈 화면은 연결된 모든 은행의 합산 잔고, 최근 거래, 카테고리별 지출 금액을 한눈에 보여줍니다. 거래 내역에는 페이지네이션과 필터 옵션이 있어 여러 은행에 걸친 거래도 효과적으로 관리할 수 있습니다. 새 은행 계좌 연결 등 변경 사항은 모든 관련 페이지에 즉시 반영됩니다.

### 송금과 반응형 디자인
Dwolla 를 통해 손쉽게 송금할 수 있으며, 필요한 정보와 수취 은행 ID 만 입력하면 다른 계좌로 자금을 보낼 수 있습니다. 데스크톱, 태블릿, 모바일 어느 환경에서도 일관되고 매끄러운 사용자 경험을 제공하도록 화면 크기에 자연스럽게 적응합니다.

## 참고 자료
- [Next.js Documentation](https://nextjs.org/docs)
- [TypeScript Documentation](https://www.typescriptlang.org/docs/)
- [Appwrite Documentation](https://appwrite.io/docs)
- [Plaid API Documentation](https://plaid.com/docs/)
- [Dwolla API Documentation](https://developers.dwolla.com/)
- [React Hook Form Documentation](https://react-hook-form.com/)
- [Zod Documentation](https://zod.dev/)
- [TailwindCSS Documentation](https://tailwindcss.com/docs)
- [Chart.js Documentation](https://www.chartjs.org/docs/latest/)
- [ShadCN Documentation](https://shadcn.dev/docs)
