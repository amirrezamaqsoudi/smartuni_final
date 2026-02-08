---
marp: true
theme: default
paginate: true
size: 16:9
---

# Smart University Platform
## Final Presentation

### Software Analysis & Design (SAD)
### Team Project – Microservices Architecture

- Instructor: Dr. Feizi
- Duration: 8 weeks (4 phases)

---

# 1) Executive Summary

- Built a production-style **Smart University** platform with **8 microservices + API Gateway + Frontend**.
- Implemented required architecture patterns:
  - **Saga** (distributed transaction)
  - **Circuit Breaker** (fault tolerance)
  - **Event-Driven Messaging** (RabbitMQ)
- Delivered functional modules:
  - Auth, Booking, Marketplace, Exam, Notification, Dashboard.

---

# 2) Problem Statement

Universities need a unified yet scalable platform for:

- Authentication and role-based access
- Resource booking with conflict prevention
- Marketplace and ticket purchasing workflows
- Exam lifecycle and submission handling
- Real-time operational dashboard and notifications

---

# 3) High-Level Architecture

- **Frontend (React SPA)** → **API Gateway** → Domain Services
- Domain services:
  - Auth, Booking, Marketplace, Payment, Exam, Notification, Dashboard
- Infrastructure:
  - PostgreSQL per service, RabbitMQ, Redis

**Architecture goals:** loose coupling, independent deployability, resiliency, observability.

---

# 4) Core Technology Stack

- Backend: Java 17+, Spring Boot, Spring Data JPA, Spring Security
- Gateway: Spring Cloud Gateway (JWT validation + route protection)
- Frontend: React + TypeScript
- Data: PostgreSQL (database-per-service)
- Messaging: RabbitMQ
- Caching: Redis
- Resilience: Resilience4j
- Deployment/Run: Docker Compose

---

# 5) Requirement Traceability (SAD)

✅ Microservices architecture  
✅ API Gateway as single entry point  
✅ Saga pattern for multi-step transaction  
✅ Circuit Breaker for inter-service fault tolerance  
✅ Event-driven communication using Message Broker  
✅ Functional modules: Auth, Booking, Marketplace, Exam

---

# 6) Auth Service (FR-01, FR-02)

- User registration and login
- JWT token generation (role + tenant claims)
- Password hashing + security validation
- Account lockout/rate-limiting protection through gateway

**Outcome:** secure access control for all downstream services.

---

# 7) Booking Service (FR-03, FR-04)

- Resource catalog (rooms/labs)
- Reservation creation with time-range validation
- **Overbooking prevention** using locking + overlap checks
- Reservation lifecycle operations (create/cancel/list)

**Outcome:** deterministic booking behavior under concurrent requests.

---

# 8) Marketplace + Payment (FR-05, FR-06)

- Product management for privileged roles
- Checkout workflow for students/users
- Integration with payment service for authorization/cancel
- Order tracking and history

**Outcome:** complete purchase journey with failure-safe flow.

---

# 9) Saga Pattern (Checkout Orchestration)

**Forward flow:**
1. Create pending order
2. Authorize payment
3. Decrement stock
4. Confirm order

**Compensation flow (on failure):**
- Cancel payment
- Mark order canceled

**Benefit:** consistency in distributed transaction without 2PC.

---

# 10) Exam Service (FR-07, FR-08)

- Teacher/Admin can create and start exams
- Student can submit answers (with duplicate prevention)
- Exam lifecycle state transitions (Draft → Scheduled → Live → Closed)
- Tenant-aware and role-aware access checks

**Outcome:** secure and controlled exam lifecycle.

---

# 11) Circuit Breaker Pattern (Exam → Notification)

- Notification call wrapped by Resilience4j Circuit Breaker
- Fallback method prevents system-wide cascading failure
- Exam start can proceed even when notification is degraded

**Benefit:** graceful degradation and improved reliability.

---

# 12) Event-Driven Integration (RabbitMQ)

Published domain events:
- `market.order.confirmed`
- `exam.exam.started`

Notification service subscribes and handles both event types.

**Benefit:** asynchronous decoupling and better scalability.

---

# 13) Multi-Tenancy & Security

- `tenant_id` isolation across service data boundaries
- Gateway injects trusted identity headers from JWT
- Role-based access enforcement (Student / Teacher / Admin)
- Reduced attack surface with centralized gateway checks

---

# 14) Frontend Experience

- Unified SPA with protected routes
- Modules covered: Dashboard, Booking, Market, Exams, Admin, Profile
- API calls routed through Gateway
- Improved usability: service status, toasts, role-aware navigation

---

# 15) Testing & Validation Snapshot

- Frontend test suites pass in local environment
- Service-level tests exist per module
- API and health-check scripts are available in `scripts/`
- Docker compose included for full-system integration run

---

# 16) Deliverables (مستندات)

The repository includes:

- `README.md` (architecture + runbook)
- `Docs/AI_Log.md` (AI interaction report)
- `Docs/Learning_Report.md` (learning reflections)
- `Docs/adrs/*` (architecture decisions)
- `docker-compose.yml` (full platform orchestration)
- `Docs/Final_Presentation_Smart_University.pptx` (final slides)

---

# 17) Team Structure (اعضای تیم)

## Team Alpha – Gateway & Auth
- @Navidtor
- @amirrezamaqsoudi

## Team Beta – Booking & Resources
- @GhazaleESK
- @tinabaouj

## Team Gamma – Marketplace & Payments
- @xxheka
- @sophiedlk

## Team Delta – Exams & Notifications
- @Mariahdlk1989
- @xanahid

---

# 18) Participation by Phase (%)

## Phase 1 – Discovery & Foundation
- Navidtor 14% | amirrezamaqsoudi 14%
- GhazaleESK 12% | tinabaouj 12%
- xxheka 12% | sophiedlk 12%
- Mariahdlk1989 12% | xanahid 12%

## Phase 2 – Core Build
- Navidtor 13% | amirrezamaqsoudi 13%
- GhazaleESK 14% | tinabaouj 14%
- xxheka 12% | sophiedlk 12%
- Mariahdlk1989 11% | xanahid 11%

---

# 19) Participation by Phase (%)

## Phase 3 – Advanced Patterns Integration
- Navidtor 10% | amirrezamaqsoudi 10%
- GhazaleESK 11% | tinabaouj 11%
- xxheka 16% | sophiedlk 16%
- Mariahdlk1989 13% | xanahid 13%

## Phase 4 – Integration, Storytelling, Delivery
- Navidtor 12% | amirrezamaqsoudi 11%
- GhazaleESK 12% | tinabaouj 12%
- xxheka 13% | sophiedlk 13%
- Mariahdlk1989 13% | xanahid 14%

> Note: Each phase totals 100% and reflects effective contribution split per milestone.

---

# 20) Risks, Lessons Learned, Next Steps

## Key lessons
- Distributed consistency needs explicit compensation logic
- Fault tolerance must be built early, not added last
- Documentation quality significantly improves team alignment

## Next steps
- Add observability stack (Prometheus/Grafana)
- Introduce chaos/resilience tests
- Expand CI/CD and contract tests

---

# Thank You

## Q & A

Smart University Platform – Final Defense
