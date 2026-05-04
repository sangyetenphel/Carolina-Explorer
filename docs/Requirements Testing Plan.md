# Carolina Explorer Test Scenarios

**Project Name:** Carolina Explorer  
**Version:** 1.0  
**Date:** 2026-05-04  
**Purpose:** This document outlines comprehensive test scenarios for each functional requirement (user story) in the Carolina Explorer system.


# Actors
- Provider P: Tour Guide  
- Customer C: Tourist  
- Service S: Tour  

---

# Use Cases

## 1. Provider: US-PROV-00A — Register & manage profile, US-PROV-001 — Create and manage tours

1. Tour Guide P1 logs in for the first time and creates a provider account.

3. G1 exits.

## 2. Tourist — Register & Browse Tours  
(US-TOURIST-001, US-TOURIST-003)

1. Tourist T1 logs in and creates profile  
2. T1 browses all tours  
3. T1 filters by:
   - city  
   - price  
   - group size  

**Expected Outcome:**
- Filtered results display correctly  
- Tours show rating + review count dynamically  

---

## 3. Tourist — Book Tour (Pending State)  
(US-TOURIST-005)

1. Tourist T2 logs in  
2. T2 selects tour S1  
3. T2 submits booking B1  

**Expected Outcome:**
- Booking status = `PENDING`  
- Booking appears:
  - Tourist → Pending Requests  
  - Guide → New Booking Requests  

---

## 4. Guide — Accept / Reject Booking  
(US-GUIDE-003)

1. Guide G1 logs in  
2. G1 views pending bookings  
3. G1:
   - accepts B1  
   - rejects B2  

**Expected Outcome:**
- Accepted → moves to Upcoming Tours  
- Rejected → appears in Tourist → Declined section  

---

## 5. Tourist — View Trip Sections (Arrow Navigation UI)  
(US-TOURIST-004)

1. Tourist logs in  
2. Uses arrow navigation to cycle:
   - Upcoming (ACCEPTED)  
   - Pending  
   - Declined  

**Expected Outcome:**
- Only one section visible at a time  
- Correct data shown based on booking status  
- Title updates dynamically  

---

## 6. Tourist — Cancel Booking  
(US-TOURIST-006)

1. Tourist clicks “Cancel” on an upcoming booking  
2. System updates booking  

**Expected Outcome:**
- Booking status = `CANCELLED`  
- Removed from:
  - Tourist upcoming list  
  - Guide upcoming tours  
- Appears in Guide → Cancelled bookings  

---

## 7. Guide — View Dashboard  
(US-GUIDE-004)

1. Guide logs in  
2. Views:
   - Earnings  
   - Upcoming tours  
   - Booking requests  
   - Cancelled bookings  

**Expected Outcome:**
- Earnings calculated from ACCEPTED bookings  
- Past tours NOT shown in upcoming  
- Dashboard sections toggle correctly  

---

## 8. Tourist — Write Review  
(US-TOURIST-007)

1. Tourist completes a tour  
2. Clicks “Leave a review”  
3. Submits rating + comment  

**Expected Outcome:**
- Review saved  
- Review appears in:
  - Tour details page  
  - Tourist profile  

---

## 9. Prevent Duplicate Reviews  
(US-TOURIST-007-VALIDATION)

1. Tourist submits a review  
2. Attempts to submit again  

**Expected Outcome:**
- System blocks duplicate  
- UI shows:
  - ✓ Reviewed badge  
  - No review button  

---

## 10. Guide — View Completed Tours  
(US-GUIDE-005)

1. Guide logs in  
2. System separates bookings:
   - Upcoming → future dates  
   - Completed → past dates  

**Expected Outcome:**
- Past tours NOT shown in upcoming  
- Completed section displays correctly  

---

## 11. Ratings & Reviews Display  
(US-TOURIST-008)

1. Tourist views a tour  
2. System calculates:
   - average rating  
   - review count  

**Expected Outcome:**
- Ratings displayed with stars  
- Calculated dynamically (not stored in database)  

---

# Cross-Cutting Test Scenarios

## Performance Requirements

### Scenario P1: Browse tours response time < 1.5 seconds
- Setup: Server under typical load  
- Steps:
  1. Load tours page with 50+ tours  
  2. Repeat 10 times  

**Expected Outcome:**  
95% of requests ≤ 1.5 seconds  

---

### Scenario P2: Tour detail page load < 1.0 second
- Setup: Server under typical load  
- Steps:
  1. Open tour detail page  
  2. Repeat 10 times  

**Expected Outcome:**  
99% of requests ≤ 1.0 second  

---

## Security & Access Control

### Scenario S1: Tourist cannot access guide dashboard
- Steps:
  1. Tourist logs in  
  2. Navigates to `/guides/dashboard`  

**Expected Outcome:**
- Access denied or redirected  
- No guide data exposed  

---

### Scenario S2: Review integrity
- Steps:
  1. Guide views a review  
  2. Attempts to edit/delete  

**Expected Outcome:**
- Action is blocked  
- Only review owner can modify  

---

## Data Integrity

### Scenario D1: Booking status validation
- Steps:
  1. Attempt invalid status update  

**Expected Outcome:**
- Database rejects invalid values  
- System remains consistent  

---

### Scenario D2: Prevent duplicate reviews
- Steps:
  1. Submit review twice  

**Expected Outcome:**
- Second attempt blocked  
- Error handled gracefully  

---

## Usability Requirements

### Scenario U1: Booking flow ≤ 3 minutes
- Steps:
  1. User browses tours  
  2. Books a tour  

**Expected Outcome:**  
≤ 3 minutes  

---

### Scenario U2: Guide creates tour ≤ 5 minutes
- Steps:
  1. Guide logs in  
  2. Creates a tour  

**Expected Outcome:**  
≤ 5 minutes  

---

### Scenario U3: Dashboard navigation clarity
- Steps:
  1. User switches sections with arrows  

**Expected Outcome:**
- Smooth transitions  
- No confusion between sections  

---

# Key System Features Implemented

- Full booking lifecycle (pending → accepted → cancelled → completed)  
- Dynamic rating system (not stored in DB)  
- Duplicate review prevention  
- Role-based dashboards  
- Arrow-based UI navigation for sections  
- Clean database design (removed unused fields)  

---
