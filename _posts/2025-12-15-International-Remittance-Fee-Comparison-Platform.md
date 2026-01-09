---
title: International Remittance Fee Comparison Platform
author:
date: 2025-12-15 12:00:00 +0900
categories: [Projects, Next.js, React]
tags: [react, typescript, postgresql, finanace, supabase, vercel]
render_with_liquid: false
---

## 1. Executive Summary

SendFeeCompare is a remittance comparison platform designed to help users find the best rates and lowest fees when sending money between the United States and South Korea. The application automatically scrapes real-time exchange rates from multiple providers and presents a clear comparison of total costs including fees, exchange rate margins, and available promotions.

### Key Value Propositions

- **Rate Comparison**: Scraping of exchange rates from providers every hours
- **Cost Breakdown**: Shows fees, exchange rate, and total costs in a clear format
- **Promotion Tracking**: Displays current promotions and discounts
- **Bi-directional Support**: Supports both US→KR and KR→US transfer directions
- **Multi-currency Display**: Shows costs in both USD and KRW for easy understanding
- **Multi-language Support**: Full Korean and English language support
- **Mobile-responsive Design**: Optimized for both desktop and mobile users

### Vision Statement

To empower individuals to make informed decisions about international money transfers by providing rate comparisons of all available options, ultimately saving users time and money on every transfer.

---

## 2. Target Users

### Primary User: "Korean-American Remittance Sender"

**Goals:**
- Find the lowest total cost for each transfer
- Understand exactly how much recipient will receive
- Stay informed about current promotions
- Make quick decisions with confidence
- Save money on recurring transfers


---

## 3. Core Features

### 3.1 Implemented Features

| Feature | Description |
|---------|-------------|
| **Provider Comparison** | Compare 9+ remittance providers side-by-side |
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
| **exchangerate-api.com** | Mid-market exchange rates | Every hours |
| **Provider Websites** | Provider-specific rates | Every hours |

### 4.5 DevOps & Infrastructure

| Service | Purpose |
|---------|---------|
| **Vercel** | Hosting and serverless functions |
| **GitHub Actions** | CI/CD and scheduled scraping |
| **Supabase** | Database hosting |
| **Slack Webhooks** | Failure notifications |


---

**Last Updated:** 2026-01-08

---

