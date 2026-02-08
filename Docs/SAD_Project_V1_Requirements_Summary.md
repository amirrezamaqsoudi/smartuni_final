# SAD Project V1 – Consolidated Requirements Brief

Source: `SAD-Project-V1(140401).pdf`

## Project framing
- 8-week team project intended to simulate a realistic software engineering environment.
- Core emphasis is not only feature completion, but architectural reasoning, documentation quality, teamwork, and technical defense.
- Teams are expected to use AI as a technical assistant/mentor and document meaningful AI interactions.

## Mandatory architecture constraints
1. **Microservices architecture** with independently deployable, loosely coupled services.
2. **Saga pattern** must be implemented for at least one multi-step business transaction (example given: purchase flow).
3. **Circuit Breaker** must be used for at least one inter-service call to prevent cascading failures.
4. **Event-driven integration** via a Message Broker (RabbitMQ explicitly referenced).
5. **API Gateway** as the single entry point for client API traffic.

## Functional requirements (module-level)

### Auth / User Service
- **FR-01:** User registration/login for roles (student/instructor mentioned).
- **FR-02:** JWT-based authentication for API requests.

### Resource / Booking Service
- **FR-03:** View list of reservable resources (example: group study room).
- **FR-04:** Reserve a resource in a time range and prevent overbooking.

### Marketplace Service
- **FR-05:** Seller can define products/services (example: workshop ticket).
- **FR-06:** Buyer can add product to cart and complete purchase.
- Purchase completion flow must include **Saga orchestration/choreography behavior** (including payment/confirmation stages).

### E-Learning / Exam Service
- **FR-07:** Instructor can create a simple exam.
- **FR-08:** Student can participate in exam.
- A call path in this area must include a **Circuit Breaker-protected** external/service dependency (notification flow explicitly hinted).

## Non-functional and delivery expectations
- Observable adherence to architectural style and patterns.
- Executable prototype that can run primary flows via `docker-compose`.
- Clear architectural documentation (C4/team architecture wiki).
- Demonstrable technical storytelling in final presentation.
- Consistent evidence of thoughtful AI usage, not superficial prompting.

## Timeline and milestones (8 weeks total)
- **Phase 1 (Weeks 1–2):** Discovery and architectural foundation.
  - Deliverable: GitHub repo + initial architecture docs/diagrams.
- **Phase 2 (Weeks 3–4):** Build initial functional core.
  - Deliverable: short demo video of core system behavior.
- **Phase 3 (Weeks 5–6):** Integrate advanced patterns (Saga + Circuit Breaker) and reflect in learning report.
  - Deliverable: `Learning_Report.md`.
- **Phase 4 (Weeks 7–8):** Integration, final narrative, and final documentation.
  - Deliverables: final presentation + complete docs + AI usage report.

## Evaluation rubric (total appears to be 8 points)
- **Process and documentation quality** (architecture wiki, AI log quality, learning report depth).
- **Technical and architectural quality** (pattern correctness, integration quality, successful execution of main flows).
- **Presentation and defense quality** (clarity, time management, ability to answer technical questions).

## Required final repository outputs
By project end, repository should contain at least:
- Full source code for backend services + frontend.
- `docker-compose.yml` for whole-system run.
- Final presentation file (PDF/PPT).
- `AI_Log.md` (AI interaction report).
- `Learning_Report.md`.
- Updated team architecture wiki/documentation.

## My implementation alignment checklist (actionable)
- Keep all externally consumed APIs routed through gateway.
- Verify at least one concrete Saga transaction path end-to-end (with compensating behavior if needed).
- Verify at least one concrete Circuit Breaker-protected call path.
- Ensure event publishing/consumption paths are present and testable.
- Preserve/expand docs (`AI_Log.md`, `Learning_Report.md`, architecture docs) as first-class deliverables.
