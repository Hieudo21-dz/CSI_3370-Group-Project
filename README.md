# Campus Equipment Reservation and Checkout System – CSI 3370

A team project for **CSI 3370 – Software Engineering and Practice**. The system lets students and faculty search for campus equipment, check availability, and make or cancel reservations. Staff manage equipment and process checkouts and returns.

Built with **Java / Spring Boot**, using a layered architecture, a REST API, and JUnit + Mockito unit tests.

---

## Users

- **Student**: search equipment, view availability, reserve and cancel, view own reservations and checkouts
- **Faculty**: same as students, possibly with different limits
- **Staff / Administrator**: add and update equipment, process checkouts and returns

## Main Features

- Search and filter equipment by type
- View equipment availability (AVAILABLE, RESERVED, CHECKED_OUT, MAINTENANCE)
- Create and cancel reservations, with per-role limits
- Check out and return equipment, with checkout and due dates
- Notifications when a reservation or checkout succeeds
- REST API with JSON requests and responses

---

## Architecture

```
Client / UI
    ↓  HTTP (REST API)
Controller Layer
    ↓
Service Layer          ← business rules live here
    ↓
Repository Interfaces  (IEquipmentRepository, IReservationRepository, ...)
    ↓
Repository Implementations
    ↓
Database
```

---

## Project Structure

```
Campus-Equipment-Reservation_CSI_3370/
├── docs/
│   ├── requirements/   # Requirements, user stories, backlog
│   ├── bdd/            # Given/When/Then scenarios
│   ├── uml/            # Use case, class, sequence, activity diagrams
│   ├── architecture/   # Architecture diagram and explanation
│   ├── api/            # REST endpoint definitions and examples
│   ├── report/         # Final report
│   └── coverage/       # JaCoCo coverage report
├── src/
│   ├── main/java/edu/oakland/csi3370/equipment/
│   │   ├── controller/     # REST controllers
│   │   ├── service/        # Business logic
│   │   ├── repository/     # Repository interfaces + implementations
│   │   ├── domain/         # User, Equipment, Reservation, Checkout
│   │   └── notification/   # Notification service
│   ├── main/resources/     # application.properties
│   └── test/java/.../service/  # JUnit + Mockito tests
├── .gitignore
└── README.md
```

---

## Milestones

| Milestone | Work | Status |
|-----------|------|--------|
| 1 | Requirements, backlog, user stories, acceptance criteria, BDD | ⬜ |
| 2 | Use case, class, sequence, and activity diagrams | ⬜ |
| 3 | Architecture, interfaces, REST API design, implementation skeleton | ⬜ |
| 4 | Core implementation and service-layer unit tests | ⬜ |
| Final | Completed system, updated diagrams, tests, report, demo | ⬜ |

---

## Getting Started

<!-- fill in once the Spring Boot project is set up -->
```bash
git clone https://github.com/<your-username>/Campus-Equipment-Reservation_CSI_3370.git
cd Campus-Equipment-Reservation_CSI_3370
./mvnw spring-boot:run
```

Run tests and generate the coverage report:
```bash
./mvnw test
# report: target/site/jacoco/index.html
```

---

## Team

<!-- add names and roles -->
| Member | Role |
|--------|------|
| Name | |
| Name | |
| Name | |

## Course Info

CSI 3370 – Software Engineering and Practice
Semester Year · Instructor: Professor Name
