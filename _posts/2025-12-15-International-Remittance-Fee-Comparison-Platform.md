---
title: International Remittance Fee Comparison Platform
author: Justin Choi
date: 2025-12-15 12:00:00 +0900
categories: [Projects, Next.js, React]
tags: [react, typescript, postgresql, finanace, supabase, vercel]
render_with_liquid: false
---

## 1. Executive Summary

SendFeeCompare is a remittance comparison platform designed to help users find the best rates and lowest fees when sending money between the United States and South Korea. The application automatically scrapes real-time exchange rates from multiple providers and presents a clear comparison of total costs including fees, exchange rate margins, and available promotions.

### Key Value Propositions

- **Real-time Rate Comparison**: Automated scraping of exchange rates from 9+ providers every 3 hours
- **Transparent Cost Breakdown**: Shows fees, exchange rate margins, and total costs in a clear format
- **Promotion Tracking**: Displays current promotions and discounts with date-based filtering
- **Bi-directional Support**: Supports both US→KR and KR→US transfer directions
- **Multi-currency Display**: Shows costs in both USD and KRW for easy understanding
- **Multi-language Support**: Full Korean and English language support
- **Mobile-responsive Design**: Optimized for both desktop and mobile users

### Vision Statement

To empower individuals to make informed decisions about international money transfers by providing transparent, real-time comparisons of all available options, ultimately saving users time and money on every transfer.

---

## 2. Target Users

### Primary User Persona: "Korean-American Remittance Sender"

**Demographics:**
- Age: 25-60 years old
- Occupation: Professionals, business owners, students
- Location: United States (with family/financial ties to Korea)
- Transfer Frequency: Monthly or occasional transfers

**Characteristics:**
- Regularly sends money to family in Korea
- Compares multiple providers before each transfer
- Values transparency in fees and exchange rates
- Uses both English and Korean interfaces
- Mobile-first browsing behavior
- Price-sensitive but also values convenience

**Pain Points:**
- Exchange rates and fees vary significantly between providers
- Hidden fees not apparent until checkout
- Time-consuming to manually compare multiple websites
- Difficulty understanding true cost of transfer
- Promotions expire without notice
- Language barriers with some services

**Goals:**
- Find the lowest total cost for each transfer
- Understand exactly how much recipient will receive
- Stay informed about current promotions
- Make quick decisions with confidence
- Save money on recurring transfers

### Secondary User Persona: "Korean Expat/International Student"

**Demographics:**
- Age: 20-35 years old
- Location: Korea (sending money to US) or US (receiving money from Korea)
- Income: Variable (students, early career)

**Characteristics:**
- Needs to send/receive money for tuition, rent, or living expenses
- Very price-sensitive
- Tech-savvy, expects modern web experience
- Prefers Korean language interface

---

## 3. Core Features

### 3.1 Implemented Features

| Feature | Description |
|---------|-------------|
| **Provider Comparison** | Compare 9+ remittance providers side-by-side |
| **Real-time Rates** | Automated scraping every 3 hours via GitHub Actions |
| **Amount-based Rates** | Different rates for different transfer amounts (6 tiers) |
| **Fee Breakdown Modal** | Detailed breakdown of all costs |
| **Promotion Display** | Current promotions with date-based filtering |
| **Bi-directional Support** | US→KR and KR→US transfers |
| **Language Toggle** | Korean/English interface |
| **Responsive Design** | Mobile and desktop optimized |
| **Provider Links** | Direct links to provider websites |
| **Failure Alerts** | Slack notifications on scraping failures |

### 3.2 Supported Providers

| Provider | Scraping Method | Notes |
|----------|-----------------|-------|
| Wise | API | Direct API integration |
| Remitly | Puppeteer | Browser automation |
| Xoom | Puppeteer | PayPal service |
| WireBarley | Puppeteer | Korean-focused service |
| Sentbe | Puppeteer | Korean service |
| Utransfer | Puppeteer | Korean service |
| Instarem | Puppeteer | Singapore-based |
| OFX | Puppeteer | Business-focused |
| Bank of America | Puppeteer | Traditional bank |

### 3.3 Amount Tiers

**US → KR (USD):**
- $100, $500, $1,000, $2,000, $5,000, $10,000

**KR → US (KRW):**
- ₩100,000, ₩500,000, ₩1,000,000, ₩5,000,000

---

## 4. Technology Stack

### 4.1 Frontend

| Technology | Version | Purpose |
|------------|---------|---------|
| **Next.js** | 16.x | Full-stack React framework (App Router) |
| **React** | 19.x | UI library |
| **TypeScript** | 5.9.x | Type safety |
| **Tailwind CSS** | 4.x | Utility-first CSS framework |
| **Radix UI** | Latest | Accessible UI primitives (Dialog, Select) |
| **Lucide React** | Latest | Icon library |
| **Zod** | 4.x | Schema validation |

**Framework Version Rationale:**

- **Next.js 16 with App Router**: Latest stable version with improved performance, server components, and better caching
- **React 19**: Latest features including improved server components support
- **Tailwind CSS v4**: Significant performance improvements and new features

### 4.2 Backend

| Technology | Purpose |
|------------|---------|
| **Next.js API Routes** | Serverless API endpoints |
| **Supabase** | PostgreSQL database with real-time capabilities |
| **Supabase Auth** | Authentication (future) |

### 4.3 Data Collection

| Technology | Purpose |
|------------|---------|
| **Puppeteer** | Browser automation for dynamic sites |
| **@sparticuz/chromium** | Serverless-compatible Chromium |
| **Cheerio** | HTML parsing for static content |

### 4.4 External APIs

| Service | Purpose | Update Frequency |
|---------|---------|------------------|
| **exchangerate-api.com** | Mid-market exchange rates | Every 3 hours |
| **Provider Websites** | Provider-specific rates | Every 3 hours |

### 4.5 DevOps & Infrastructure

| Service | Purpose |
|---------|---------|
| **Vercel** | Hosting and serverless functions |
| **GitHub Actions** | CI/CD and scheduled scraping |
| **Supabase** | Database hosting |
| **Slack Webhooks** | Failure notifications |

---

## 5. Architecture

### 5.1 High-Level Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                         User Browser                             │
│                    (React 19 + Next.js 16)                       │
└─────────────────────────────────────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│                      Vercel Edge Network                         │
│                    (CDN + Serverless Functions)                  │
└─────────────────────────────────────────────────────────────────┘
                                │
                ┌───────────────┼───────────────┐
                ▼               ▼               ▼
        ┌─────────────┐ ┌─────────────┐ ┌─────────────┐
        │  API Routes │ │ Static Pages│ │ Server      │
        │ /api/v1/*   │ │ /privacy    │ │ Components  │
        │ /api/cron/* │ │ /disclaimer │ │             │
        └─────────────┘ └─────────────┘ └─────────────┘
                │
                ▼
┌─────────────────────────────────────────────────────────────────┐
│                         Supabase                                 │
│          (PostgreSQL + Real-time + Storage)                      │
├─────────────────────────────────────────────────────────────────┤
│ Tables:                                                          │
│ - providers            - provider_promotions                     │
│ - provider_fees        - provider_rate_latest                    │
│ - provider_rate_scrapes - mid_market_rates                       │
│ - scrape_configs       - notification_logs                       │
└─────────────────────────────────────────────────────────────────┘
```

### 5.2 Data Flow

```
┌──────────────────────────────────────────────────────────────────┐
│                    Scheduled Data Collection                      │
│                    (GitHub Actions - Every 3h)                    │
└──────────────────────────────────────────────────────────────────┘
                                │
        ┌───────────────────────┼───────────────────────┐
        ▼                       ▼                       ▼
┌───────────────┐      ┌───────────────┐      ┌───────────────┐
│ Mid-Market    │      │ Provider      │      │ Provider      │
│ Rate API      │      │ Scrapers      │      │ Scrapers      │
│ (exchangerate)│      │ (Puppeteer)   │      │ (API)         │
└───────────────┘      └───────────────┘      └───────────────┘
        │                       │                       │
        └───────────────────────┼───────────────────────┘
                                ▼
                    ┌───────────────────┐
                    │     Supabase      │
                    │   (PostgreSQL)    │
                    └───────────────────┘
                                │
                                ▼
┌──────────────────────────────────────────────────────────────────┐
│                    User Request Flow                              │
│                                                                   │
│  User Input → API Route → ComparisonService → Database Query     │
│            → Calculate Costs → Return Results → Display UI       │
└──────────────────────────────────────────────────────────────────┘
```

### 5.3 Project Structure

```
sendfeecompare-next/
├── app/                          # Next.js App Router
│   ├── api/                      # API Routes
│   │   ├── cron/                 # Scheduled tasks
│   │   │   ├── scrape-rates/     # Provider scraping
│   │   │   └── update-rates/     # Mid-market rates
│   │   ├── health/               # Health check
│   │   └── v1/                   # Versioned API
│   │       ├── admin/            # Admin endpoints
│   │       ├── compare/          # Comparison API
│   │       ├── providers/        # Provider list
│   │       └── rates/            # Rate queries
│   ├── disclaimer/               # Disclaimer page
│   ├── privacy/                  # Privacy policy
│   ├── transfer-info/            # Transfer info page
│   ├── layout.tsx                # Root layout
│   └── page.tsx                  # Home page
├── components/                   # React components
│   ├── ComparisonApp.tsx         # Main client component
│   ├── ComparisonResults.tsx     # Results display
│   ├── FeeBreakdownModal.tsx     # Detail modal
│   ├── Header.tsx                # Navigation header
│   ├── HeroSection.tsx           # Input section
│   └── ...
├── lib/                          # Business logic
│   ├── i18n/                     # Internationalization
│   ├── scrapers/                 # Rate scrapers
│   │   ├── providers/            # Provider-specific scrapers
│   │   ├── base-scraper.ts       # Abstract base class
│   │   └── browser.ts            # Puppeteer utilities
│   ├── services/                 # Business services
│   │   ├── comparison-service.ts # Cost calculation
│   │   ├── scrape-service.ts     # Scraping orchestration
│   │   └── rate-service.ts       # Rate caching
│   ├── supabase/                 # Database clients
│   ├── types/                    # TypeScript types
│   └── validations/              # Zod schemas
├── public/                       # Static assets
│   └── logos/                    # Provider logos
├── supabase/                     # Database
│   ├── migrations/               # Schema migrations
│   └── seed.sql                  # Initial data
├── docs/                         # Documentation
└── .github/workflows/            # CI/CD pipelines
```

---

## 6. Database Schema

### 6.1 Core Tables

| Table | Description |
|-------|-------------|
| `providers` | Provider information (name, logo, URLs) |
| `provider_fees` | Manual fee configurations |
| `provider_promotions` | Promotions with date filtering |
| `provider_rate_latest` | Current rates (UPSERT-based) |
| `provider_rate_scrapes` | Historical rate data |
| `mid_market_rates` | Reference exchange rates |
| `scrape_configs` | Scraper configurations |
| `scrape_jobs` | Scraping job history |
| `notification_logs` | Alert history |

### 6.2 Key Relationships

```
providers (1) ─────┬───── (N) provider_fees
                   ├───── (N) provider_promotions
                   ├───── (N) provider_rate_latest
                   └───── (N) scrape_configs
```

---

## 7. API Endpoints

### 7.1 Public APIs

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/v1/compare` | POST | Calculate comparison results |
| `/api/v1/providers` | GET | List active providers |
| `/api/v1/rates` | GET | Get current rates |
| `/api/health` | GET | Health check |

### 7.2 Admin APIs

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/v1/admin/scrape` | POST | Trigger manual scrape |
| `/api/v1/admin/monitoring` | GET/POST | Monitoring status |

### 7.3 Cron APIs

| Endpoint | Schedule | Description |
|----------|----------|-------------|
| `/api/cron/scrape-rates` | Every 3h | Scrape provider rates |
| `/api/cron/update-rates` | Every 3h | Update mid-market rates |

---

## 8. Cost Calculation Logic

```
1. Mid-Market Amount = Send Amount × Mid-Market Rate
2. Provider Amount = Send Amount × Provider Rate
3. Exchange Cost = Mid-Market Amount - Provider Amount
4. Total Fee = Scraped Fee + Manual Fees
5. Total Discount = Sum of applicable promotions
6. Total Cost = Exchange Cost + Total Fee - Total Discount
7. Received Amount = Provider Amount - Total Fee (in target currency)
```

---

## 9. Deployment & Operations

### 9.1 Deployment Pipeline

```
GitHub Push → GitHub Actions → Build Check → Vercel Deploy
                    │
                    └─→ Scheduled Jobs (scrape-rates, update-rates)
```

### 9.2 Environment Variables

```env
# Supabase
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=

# External APIs
EXCHANGE_API_KEY=

# Security
CRON_SECRET=

# Notifications
SLACK_WEBHOOK_URL=
```

### 9.3 Monitoring

- **Scraping Failures**: Slack alerts on failure
- **Health Checks**: `/api/health` endpoint
- **Logging**: Structured logs in Vercel

---

## 10. Documentation Index

| Document | Description |
|----------|-------------|
| [PROJECT_OVERVIEW.md](./PROJECT_OVERVIEW.md) | This document |
| [DATA_COLLECTION.md](./DATA_COLLECTION.md) | Scraping system details |
| [PROMOTIONS.md](./PROMOTIONS.md) | Promotion system with date filtering |
| [FEE_HANDLING.md](./FEE_HANDLING.md) | Fee calculation logic |
| [ADDING_NEW_PROVIDER.md](./ADDING_NEW_PROVIDER.md) | Guide to add new providers |
| [supabase-schema.md](./supabase-schema.md) | Database schema reference |
| [MONITORING_SYSTEM.md](./MONITORING_SYSTEM.md) | Alerting and monitoring |

---

## 11. Future Roadmap

### Phase 1: Core Features (Completed)
- [x] Provider comparison with real-time rates
- [x] Automated scraping via GitHub Actions
- [x] Promotion tracking with date filtering
- [x] Multi-language support (KO/EN)
- [x] Slack failure notifications

### Phase 2: Enhanced Features (Planned)
- [ ] User accounts and saved preferences
- [ ] Email alerts for rate changes
- [ ] Historical rate charts
- [ ] Provider reviews and ratings
- [ ] Mobile app (React Native)

### Phase 3: Expansion (Future)
- [ ] Additional corridors (e.g., US-Japan, US-China)
- [ ] Business/corporate accounts
- [ ] API for third-party integration
- [ ] Affiliate partnerships

---

**Last Updated:** 2026-01-08
**Maintainer:** Project Owner
**Current Status:** Production (MVP)

---

