# Project Plan: Migration of Multi-Client WebForms Applications to React + ASP.NET Core API

## Project Overview

- **Current Setup:**  
  - Multiple ASP.NET WebForms applications (one per client, subdomain-based)  
  - Existing API (partial)  
  - Some React front-end modules  

- **Target Setup:**  
  - Single **ASP.NET Core Web API** (multi-tenant aware)  
  - Single **React Frontend** (multi-tenant aware)  
  - Each client accesses via their subdomain: `clientX.mydomain.com`  
  - Gradual migration: **one client at a time**  

---

## Phase 0: Preparation

| Task | Owner | Status | Notes |
|------|-------|--------|-------|
| Inventory WebForms modules for all clients | Team | Pending | Identify all modules, complexity, DB dependencies |
| Document database schema per client | DB Team | Pending | Determine shared vs. separate DBs |
| Analyze existing API usage | Dev Team | Pending | Identify endpoints to centralize |
| Setup Git repositories | DevOps | Pending | Repos: `api` & `react-frontend` |
| Decide tech stack & UI framework | Architect | Pending | Stack: ASP.NET Core API + React + Material UI |

---

## Phase 1: Centralize API

| Task | Owner | Status | Notes |
|------|-------|--------|-------|
| Create new ASP.NET Core Web API project | Backend Dev | Pending | Multi-tenant capable |
| Move business logic from WebForms to API | Backend Dev | Pending | One module at a time |
| Implement client detection from subdomain | Backend Dev | Pending | e.g., `client1.mydomain.com` → `ClientId=client1` |
| Multi-tenant DB connection logic | Backend Dev | Pending | Each client database mapped to ClientId |
| API testing via Postman | QA | Pending | Ensure independent API functionality |

---

## Phase 2: Build Reusable React Frontend

| Task | Owner | Status | Notes |
|------|-------|--------|-------|
| Create React project | Frontend Dev | Pending | Multi-tenant aware |
| Detect client from subdomain | Frontend Dev | Pending | `window.location.hostname` |
| Connect React to API with dynamic `ClientId` | Frontend Dev | Pending | Reusable for all clients |
| Build common modules: dashboard, reports, forms | Frontend Dev | Pending | Component-based design |
| Test frontend with API | QA | Pending | Localhost + Postman API |

---

## Phase 3: Prepare Hosting Environment

| Task | Owner | Status | Notes |
|------|-------|--------|-------|
| Configure IIS for multi-client setup | DevOps | Pending | Default Web Site hosts WebForms, React, API |
| Setup Application Pools | DevOps | Pending | Separate pools for API, React, WebForms |
| Bind client subdomains to IIS | DevOps | Pending | `client1.mydomain.com` → IIS root or React |
| Deploy initial API & React (multi-tenant ready) | DevOps | Pending | Shared for all clients |

---

## Phase 4: Client-by-Client Migration

| Task | Owner | Status | Notes |
|------|-------|--------|-------|
| Select first client (smallest) | PM | Pending | Start with low-risk client |
| Deploy React module for client | Frontend Dev | Pending | `/app` path or root later |
| Test API integration for client | QA | Pending | Ensure correct DB data is loaded |
| Update WebForms navigation to point to React | WebForms Dev | Pending | Link old module to new React module |
| Full migration for client | Dev Team | Pending | Root points to React, WebForms modules removed |
| Repeat for next client | PM & Dev Team | Pending | Follow client size order |

---

## Phase 5: Authentication & Authorization

| Task | Owner | Status | Notes |
|------|-------|--------|-------|
| Centralize authentication in API | Backend Dev | Pending | JWT or ASP.NET Core Identity |
| WebForms integration for gradual migration | Backend Dev | Pending | Legacy login until full migration |
| React login using JWT | Frontend Dev | Pending | Tokens include ClientId, UserId, roles |
| Test auth across multiple clients | QA | Pending | Ensure security & access control |

---

## Phase 6: Testing

| Task | Owner | Status | Notes |
|------|-------|--------|-------|
| Client-specific testing | QA | Pending | Each migrated client verified |
| Regression testing for WebForms | QA | Pending | Ensure old modules still work |
| Multi-tenant API stress test | QA | Pending | Concurrent client testing |

---

## Phase 7: Go Live

| Task | Owner | Status | Notes |
|------|-------|--------|-------|
| Update DNS / IIS bindings for migrated client | DevOps | Pending | Root points to React frontend |
| Monitor API logs & React usage | DevOps / QA | Pending | Errors, performance, DB connections |
| Communicate client migration | PM | Pending | Inform client users about new UI |
| Repeat per client | PM & Dev Team | Pending | Gradually migrate all 20+ clients |

---

## Phase 8: Cleanup & Maintenance

| Task | Owner | Status | Notes |
|------|-------|--------|-------|
| Remove old WebForms apps | DevOps | Pending | After full migration |
| Backup legacy databases | DB Team | Pending | Optional for auditing |
| Maintain single React + API deployment | Dev Team | Pending | Multi-tenant setup |
| Implement CI/CD for future updates | DevOps | Pending | Automate React + API deployment |

---

## Timeline (Example)

| Phase | Duration | Notes |
|-------|---------|-------|
| Preparation | 1–2 weeks | Inventory + setup |
| Centralize API | 2–3 weeks | Business logic migration |
| React Frontend | 3–4 weeks | Multi-tenant React |
| Client-by-client migration | 6–12 weeks | One client per week/month depending on size |
| Authentication | 1–2 weeks | Overlaps with client migration |
| Testing & Go Live | Ongoing | Per client |
| Cleanup | 1 week | After all clients migrated |

---

**Notes:**

- Prioritize **smaller clients first** to minimize risk.  
- Keep **API and React multi-tenant** to avoid duplicating code.  
- Use **feature flags** if some modules need gradual rollout.  
- Maintain **documentation and migration log** per client.  

---
