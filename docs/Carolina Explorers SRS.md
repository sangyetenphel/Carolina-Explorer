
# Requirements – Starter Template

**Project Name:** Carolina Explorer \
**Team:** Ayusha Thapa (Provider) | Sangye Tengkhar (Customer) \
**Course:** CSC 340-01\
**Version:** 1.0\
**Date:** 2026-02-13

---

## 1. Overview
**Vision.** Carolina Explorer is a web-based tour discovery platform designed for tourists and new residents exploring North Carolina. The system helps users easily discover, filter, and request bookings for guided tours based on city, price, and preferences.

**Glossary**
- **Tourist (Customer):** A registered user who searches and books tours.
- **Tour Guide (Provider):** A registered user who creates and manages tours.
- **Booking Request:** A request submitted by a tourist for a specific date and time.
- **Itinerary:** A structured list of activities and details included in a tour.

**Primary Users / Roles.**
- **Customer (Tourist)** — Find and book tours that match location, schedule, and group size.
- **Provider (Tour Guide)** — Create tours and manage booking requests.

**Scope**
- Account creation and login
- Browse tours by city
- Filter tours by price, group size, and type
- View tour itinerary
- Submit booking requests
- Accept/decline booking requests
- Review system

**Out of scope**
- Payment processing
- Messaging system
- Provider analytics dashboard
- Business sponsorships

> This document is **requirements‑level** and solution‑neutral; design decisions (UI layouts, API endpoints, schemas) are documented separately.

---

## 2. Functional Requirements (User Stories)

### 2.1 Customer Stories
- **US‑CUST‑001 — Browse Tours by City**

  _Story:_ **As a `tourist`, I want `to browse tour guides by city`, so that `I can find experiences in my destination.`**

  _Acceptance:_
  ```gherkin
  Scenario: Browse tours by city
    Given I am a customer
    When  I select a city filter
    Then  only tours from that city should be displayed
  ```

- **US‑CUST‑002 — Filter Tours**

  _Story:_ **As a `tourist`, I want `to filter tours by price, group size, and tour type`, so that `I can choose a tour that fits my budget and preferences.`**

  _Acceptance:_
  ```gherkin
  Scenario: Apply filters
    Given I am viewing available tours
    When  I apply filters for price, group size, and type
    Then  only tours matching the selected criteria should appear
  ```
  - **US‑CUST‑003 — View Itinerary**

  _Story:_ **As a `tourist`, I want `to view the itinerary`, so that `I know exactly what the tour includes.`**

  _Acceptance:_
  ```gherkin
  Scenario: View itinerary
    Given I select a specific tour
    When  I open the tour details
    Then  I should see the itinerary including activities and schedule
  ```

- **US‑CUST‑004 — Request Booking**

  _Story:_ **As a `tourist`, I want `to request or book a tour date and time`, so that `that I can secure my spot.`**

  _Acceptance:_
  ```gherkin
  Scenario: Submit booking request
    Given I am viewing a tour
    When  I select a date and time and submit a request
    Then  the provider should receive the booking request
  ```

- **US‑PROV‑005 — Leave Review**

  _Story:_ As a tourist, I want to leave a review after a tour so that other users can make informed decisions.
  
  _Acceptance:_
  ```gherkin
  Scenario: Submit review
    Given a tour has been completed
    When I submit a rating and written review
    Then the review should be visible to other users
  ```

### 2.2 Provider Stories
- **US‑PROV‑001 — Create and Manage Tours**

  _Story:_ As a tour guide, I want to create and manage tours so that I can showcase my local expertise.

  _Acceptance:_
  ```gherkin
  Scenario: Create a tour
    Given I am logged in as a provider
    When  I enter tour details and submit
    Then  the tour should appear in the public listing
  ```

- **US‑PROV‑002 — Accept or Decline Booking**

  _Story:_ As a tour guide, I want to accept or decline booking requests so that I can control my availability and schedule.

  _Acceptance:_
  ```gherkin
  Scenario: Accept booking
    Given I have received a booking request
    When  I choose accept
    Then  the booking status should update to confirmed
  ```

  ```gherkin
  Scenario: Decline booking
    Given I have received a booking request
    When  I choose decline
    Then  the booking status should update to declined
  ```
  
---

## 3. Non‑Functional Requirements
- **Performance:** Tour search results must load within 3 seconds under normal usage.
- **Availability/Reliability:** The system must maintain at least 95% uptime during the semester.
- **Security/Privacy:** User passwords must be encrypted and user data must not be publicly exposed.
- **Usability:** A tourist must be able to complete a booking request in 5 steps or fewer.

---

## 4. Assumptions, Constraints, and Policies
- The application will be web-based.
- Only registered users can book or create tours.
- Payment processing is not included in this version.
- Tour availability is managed manually by providers.
- The system will be developed using tools and technologies approved in CSC 340.
---

## 5. Milestones (course‑aligned)
- **M2 Requirements** — this file + stories opened as issues.
- **M3 High‑fidelity prototype** — core customer/provider flows fully interactive.
- **M4 Design** — architecture, schema, API outline.
- **M5 Backend API** — key endpoints + tests.
- **M6 Increment** — ≥2 use cases end‑to‑end.
- **M7 Final** — complete system & documentation.

---

## 6. Change Management
- Stories are living artifacts; changes are tracked via repository issues and linked pull requests.
- Major changes should update this SRS.
