# Carolina Explorer Test Scenarios

**Project Name:** Carolina Explorer  
**Version:** 1.0  
**Date:** 2026-05-04  
**Purpose:** This document outlines comprehensive test scenarios for each functional requirement (user story) in the Carolina Explorer system.


# Actors
- Provider P: Tour Guide  
- Customer C: Tourist  
- Service S: Tour  



# Use Cases

#### 1. Provider: US-PROV-00A, US-PROV-001 — Register & Create Tours
1. Tour Guide P1 registers a provider account.
2. P1 creates tours S1 (Asheville Brewery Tour) and S2 (Historic Uptown Charlotte Tour) with searchable criteria:
      - C1 = City
      - C2 = Date
      - C3 = Number of Guests
      - C4 = Price
      - C5 = Tour Category
4. PI exits the app.
   

#### 2. Customer: US-CUST-00A — Register Profile  
1. Tourist C1 registers a customer account and creates a profile.
2. C1 exits the app.


#### 3. Customer: US-CUST-001, US-CUST-002, US-CUST-003 — Browse, Filter, View Itinerary

1. Tourist C2 logs in.
2. C2 browses available tours.
3. C2 applies filters (price, group size, type).
4. C2 selects S1 and views itinerary details.
5. C2 exits the app.


#### 4. Customer: US-CUST-004 — Request Booking

1. Tourist C2 logs back in.
2. C2 requests booking for S1 and S2.
3. C2 exits the app.
 

#### 5. Provider: US-PROV-002 — Accept/Decline Booking

1. Tour Guide P1 logs in.  
2. P1 views booking requests.  
3. P1:
   - accepts the booking request for S1/S2 made by C2  
   - rejects the booking request for S1/S2 made by C2
4. P1 exits the app.


#### 6. Customer: US-CUST-006 - View & Manage Bookings  

1. Tourist C2 logs in.
2. C2 views booking status:
      - Pending
      - Accepted
      - Declined
5. C2 exits the app.


#### 7. Customer: US-CUST-006 — Cancel Booking  

1. Tourist C2 logs in.
2. C2 clicks “Cancel” on an accepted booking.
3. C2 exits the app.


#### 8. Customer: US-CUST-005 — Write Review  

1. Tourist C2 logs in.
2. C2 completes tour S1.
3. C2 submits a rating and written review.
4. C2 exits the app.


#### 9. Provider: US-PROV-003 — View Dashboard  

1. Tour Guide P1 logs in.
2. P1 views dashboard including:
      - Booking requests
      - Upcoming tours
      - Cancelled bookings
      - Earnings
      - Reviews
3. P1 exits the app.


#### 10. Customer: US-CUST-003 — View Reviews  

1. Tourist C1 logs in.
2. C1 browses tours.
3. C1 selects S1.
4. C1 views:
      - Average rating
      - Reviews
5. C1 exits the app.


---

## Cross-Cutting Test Scenarios

### Performance Requirements

**Scenario P1: Browse tours response time < 3 seconds**
- Setup: Server under typical load  
- Steps:
   1. Load “Browse Tours” page
   2. Display tours across multiple cities (5+ tours)
   3. Apply filters (price, group size, category)
   4. Repeat 10 times

**Expected Outcome:**  
95% of requests ≤ 3 seconds


**Scenario P2: Tour details page load < 2 seconds**
- Setup: Server under typical load  
- Steps:
  1. Select a tour (S1)
  2. Open tour details page (itinerary + reviews)
  3. Repeat 10 times 

**Expected Outcome:**  
95% of requests ≤ 2 seconds



### Security & Access Control

**Scenario S1: Role-based access control**
- Setup: Tourist attempts to access Tour Guide dashboard
- Steps:
  1. Tourist logs in  
  2. Attempts to navigates to `/guides/dashboard`  

**Expected Outcome:**
Access denied or redirected  
No guide data exposed


**Scenario S2: Review integrity**
- Setup: Tour Guide logs in, Tourist has submitted a review
- Steps:
  1. Tour Guide views reviews on dashboard  
  2. Attempts to edit/delete  

**Expected Outcome:**
Edit/delete options are not available
Review remains unchanged



### Usability Requirements

**Scenario U1: Tourist completes booking in ≤ 5 steps**
- Setup: New Tourist account
- Steps:
  1. Tourist logs in
  2. Browses tours
  3. Selects a tour
  4. Views itinerary
  5. Submits booking request

**Expected Outcome:**  
Booking completed in ≤ 5 steps
Process is clear and intuitive


---
