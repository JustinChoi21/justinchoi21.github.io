---
title: Financial Assets Management Web Application Project
author: 
date: 2025-09-20 12:00:00 +0900
categories: [Projects, ASP.NET, React]
tags: [dotnet, aspnet-core, react, typescript, postgresql, finance, personal-finance, portfolio]
render_with_liquid: false
---

## 1. Executive Summary

**Asset-Dash** is a finance web application designed to replace a Google Spreadsheet-based financial management system. The application will provide comprehensive financial tracking, including asset management, investment portfolio monitoring, credit card tracking, cashflow management, budget/spending management, and long-term financial planning.

It requires a robust, secure, and user-friendly platform that maintains all existing functionality while providing enhanced automation, real-time data updates, and improved visualization.

**Key Value Propositions:**
- Centralized financial dashboard with real-time net worth tracking
- Automated investment portfolio updates with current market prices
- Credit card management with due date reminders and benefit tracking
- Budget tracking with category-based expense allocation
- Long-term financial planning with age-based asset allocation glide paths
- Multi-currency support (USD and KRW)
- Multi-language support (English and Korean)
- Enhanced data security over spreadsheets

### Vision Statement
To empower individuals to take complete control of their financial future through an intuitive, comprehensive, and secure personal finance platform that transforms complex financial data into actionable insights.

## 2. Technology Stack

### 2.1 Backend (.NET)

**Framework:**
- **ASP.NET Core 8.0:** Latest LTS version for web API
- **C# 12:** the version of C# that was released alongside .NET 8.

**Data Access:**
- **Entity Framework Core 8:** ORM for database operations
- **Dapper:** For complex queries requiring optimization
- **PostgreSQL:** Primary database (recommend PostgreSQL for cost)

**Authentication & Security:**
- **ASP.NET Core Identity:** User authentication and authorization
- **JWT Tokens:** For API authentication
- **IdentityServer / Auth0:** For OAuth 2.0 / OIDC (future)

**API Documentation:**
- **Swashbuckle (Swagger):** OpenAPI documentation

**Background Jobs:**
- **Hangfire:** For scheduled tasks (price updates, reminders)
- **Quartz.NET:** Alternative for complex scheduling

**Caching:**
- **Redis / In-Memory Cache:** For session management and performance

**Logging & Monitoring:**
- **Serilog:** Structured logging
- **Application Insights / Seq:** Log aggregation and monitoring

**Testing:**
- **xUnit:** Unit testing framework
- **Moq:** Mocking framework
- **FluentAssertions:** Assertion library

### 2.2 Frontend

**Framework:**
- **React 18+ with TypeScript:** Modern UI library with type safety
- **Next.js:** For SSR and better SEO if needed

**State Management:**
- **React Query / TanStack Query:** Server state management
- **Zustand / Redux Toolkit:** Client state management

**UI Components:**
- **Tailwind CSS:** Utility-first CSS framework
- **shadcn/ui or Radix UI:** Accessible component primitives
- **Chart.js / Recharts:** Data visualization
- **date-fns:** Date manipulation

**Forms:**
- **React Hook Form:** Form state management
- **Zod:** Schema validation

**HTTP Client:**
- **Axios:** HTTP requests with interceptors

**Build Tools:**
- **Vite:** Fast development server and build tool
- **pnpm / npm:** Package management

### 9.3 External APIs

**Market Data:**
- **Alpha Vantage:** Stock and crypto prices (free tier available)
- **IEX Cloud:** Real-time stock data
- **Yahoo Finance API:** Alternative for price data
- **CoinGecko:** Cryptocurrency prices

**Financial Aggregation (Future):**
- **Plaid:** Bank account aggregation
- **Yodlee:** Alternative aggregation service

**Currency Exchange:**
- **exchangerate-api.com:** USD/KRW conversion rates
- **Open Exchange Rates:** Alternative

**Real Estate Valuation:**
- **Zillow API (Zestimate):** Property valuation, rent estimates, and market data
  - Endpoint: Zillow GetSearchResults, GetZestimate, GetRentZestimate APIs
  - Rate Limits: 1,000 calls per day (free tier)
  - Data: Current home value (Zestimate), rent value (Rent Zestimate), property details, market trends
  - Update Frequency: Daily for property values
- **Redfin:** Alternative real estate data and property valuations
  - Public data scraping or potential partnership for API access
  - Data: Current market value, estimated rent, days on market, property characteristics
  - Note: Redfin does not offer a public API; may require web scraping or third-party aggregators
- **Attom Data Solutions:** Comprehensive property data API (commercial alternative)
  - Property valuations, rental estimates, tax assessments, foreclosure data
  - Rate Limits: Based on subscription tier

**Notifications:**
- **SendGrid / Amazon SES:** Email delivery
- **Twilio:** SMS notifications (future)

### 2.4 DevOps & Infrastructure

**Version Control:**
- **Git / GitHub:** Source control and collaboration

**CI/CD:**
- **GitHub Actions:** Automated build and deployment
- **Azure DevOps:** Alternative

**Hosting:**
- **Azure App Service:** Managed web hosting
- **AWS Elastic Beanstalk:** Alternative
- **Docker:** Containerization

**Database Hosting:**
- **Azure SQL Database / PostgreSQL on Azure**
- **AWS RDS:** Alternative
- **Supabase:** PostgreSQL with built-in features

**Storage:**
- **Azure Blob Storage:** For file storage and backups
- **AWS S3:** Alternative

**Monitoring:**
- **Application Insights:** Performance monitoring
- **Sentry:** Error tracking

---

