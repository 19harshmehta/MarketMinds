
# Market Minds - Conceptual Breakdown

This document outlines the key objects, their context, and the information associated with the **Market Minds** project.

---

## Project Summary

**Market Minds** is a user-friendly web application that allows users to create accounts, view, and manage their stock portfolios by adding stocks. It features **real-time stock data updates** achieved through **web scraping and scheduling**. Additionally, a **payment gateway** was integrated for **premium user subscriptions**.

---

## Key Concepts

### 1. Object: Equity  
**Context**: User can view live prices and complete details of equities.  
**Information**:
- `equityId`
- `equityName`
- `symbol`
- `series`
- `high52`
- `low52`
- `todayOpen`
- `todayClose`
- `todayHigh`
- `todayLow`
- `price`
- `activeInd`
- `buysellInd`
- `industryName`

---

### 2. Object: Industry  
**Context**: Represents industry to which equities belong.  
**Information**:
- `industryId`
- `industryName`

---

### 3. Object: Portfolio  
**Context**: User-created portfolio for managing selected equities.  
**Information**:
- `portfolioId`
- `userId`
- `portfolioName`
- `createdAt`

---

### 4. Object: PortfolioDetails  
**Context**: List of equities added by the user in a specific portfolio.  
**Information**:
- `portfoliodetailId`
- `qty`
- `portfolioId`
- `price`
- `equityId`
- `purchasedAt`

---

### 5. Object: Users  
**Context**: Represents a system user with optional premium access.  
**Information**:
- `userId`
- `firstName`
- `lastName`
- `email`
- `password`
- `otp`
- `otpCreated`
- `otpValidity`
- `deletedAt`
- `premiumInd`
- `statusInd`
- `premiumDate`
- `role`

---

### 6. Object: Plans  
**Context**: Subscription plans available for premium user access.  
**Information**:
- `planId`
- `duration` (in months)
- `amount`
- `tax`
- `title`
- `activeInd`

---

### 7. Object: News  
**Context**: Market-related news scraped from various sources.  
**Information**:
- `newsId`
- `source`
- `author`
- `title`
- `description`
- `url`
- `urlToImage`
- `publishedAt`
- `content`

---

## Contextual Flows

### Frontend (JSP with Template Integration)
**Context**: Provides the UI for users to interact with the system.  
**Information**:
- Home page with stock prices
- User login/signup and profile pages
- Portfolio management screens
- News and equity exploration dashboard
- Subscription plan selection and payment pages

---

### Backend (Spring Boot)
**Context**: Handles logic, scraping, persistence, and user/session management.  
**Technologies**: Spring MVC, Java, Hibernate, Web Scraping  
**Information**:
- Controllers for `/portfolio`, `/equity`, `/auth`, `/subscribe`, `/news`
- Services for price updates, user subscriptions, portfolio management
- Scheduler to scrape equity prices **every minute** for real-time updates

---

## Location
You can save this file as:
```
/docs/concepts.md
```
