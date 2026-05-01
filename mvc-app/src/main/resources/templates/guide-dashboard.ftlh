<!DOCTYPE html>
<html>
<head>
    <title>Guide Dashboard</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #eef2f7;
            font-family: "Plus Jakarta Sans", sans-serif;
        }

        .card {
            border-radius: 20px;
            border: none;
        }

        .stat-card {
            padding: 24px;
        }

        .stat-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .stat-left {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .stat-icon {
            width: 35px;
            height: 35px;
            background: #e0e7ff;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            color: #1e3a8a;
        }

        .tour-card img {
            border-radius: 12px;
            height: 90px;
            width: 130px;
            object-fit: cover;
        }

        .badge-upcoming {
            background: #e0e7ff;
            color: #1e3a8a;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
        }

        .btn-dark-blue {
            background: #1f3c88;
            color: white;
            border-radius: 20px;
        }

        .btn-dark-blue:hover {
            background: #162d66;
        }

        .booking-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .booking-actions button {
            margin-right: 6px;
        }

        button:hover {
            opacity: 0.8;
            cursor: pointer;
        }
    </style>
</head>

<body>

<#include "navbar.ftlh">
    <#if RequestParameters.accepted??>
        <div class="alert alert-success">
            Booking accepted successfully!
        </div>
    </#if>

<div class="container py-5">

    <!-- HEADER -->
    <h3 class="mb-4">
        Welcome Back, ${guide.firstName}!
    </h3>

    <!-- TOP SECTION -->
    <div class="row g-4">

        <!-- LEFT STATS -->
        <div class="col-md-6">
            <div class="card stat-card shadow-sm">

                <h5 class="mb-4">At a Glance</h5>

                <div class="stat-item mb-3">
                    <div class="stat-left">
                        <div class="stat-icon">
                            <i class="bi bi-currency-dollar"></i>
                        </div>
                        <span>Earnings</span>
                    </div>
                    <strong>$${earnings?string["#,##0.00"]}</strong>
                </div>

                <hr>

                <div class="stat-item mb-3">
                    <div class="stat-left">
                        <div class="stat-icon">
                            <i class="bi bi-clock"></i>
                        </div>
                        <span>Upcoming Tours</span>
                    </div>
                    <strong>${(upcomingBookings![])?size}</strong>
                </div>

                <hr>

                <div class="stat-item">
                    <div class="stat-left">
                        <div class="stat-icon">
                            <i class="bi bi-star"></i>
                        </div>
                        <span>Reviews</span>
                    </div>
                    <strong>${rating?string["0.0"]}</strong>
                </div>
            </div>
        </div>

        <!-- BOOKING REQUESTS -->
        <div class="col-md-6">
            <div class="card stat-card shadow-sm">

                <h5 class="mb-4">New Booking Requests</h5>
                <#list bookings as booking>

                <div class="d-flex align-items-start mb-4">

                    <!-- PROFILE IMAGE -->
                    <img src="${booking.tourist.profileImage!'/images/default-avatar.jpg'}"
                        style="width:45px; height:45px; border-radius:50%; object-fit:cover;">

                    <!-- TEXT CONTENT -->
                    <div class="ms-3">

                        <!-- TOUR TITLE -->
                        <h6 class="mb-1">${booking.tour.title}</h6>

                        <!-- DATE + TIME -->
                        <small class="text-muted d-block">
                            ${booking.tourDate?date("yyyy-MM-dd")?string("EEE, MMM d")}

                            <#if booking.tour.startTime?has_content>
                                <#assign hour = booking.tour.startTime?substring(0,2)?number>
                                <#assign minute = booking.tour.startTime?substring(3,5)>
                                <#assign ampm = (hour >= 12)?then("pm", "am")>
                                <#assign displayHour = (hour % 12 == 0)?then(12, hour % 12)>

                                at ${displayHour}:${minute} ${ampm}
                            </#if>
                        </small>

                        <!-- GUESTS -->
                        <small class="text-muted d-block mb-2">
                            ${booking.groupSize} guests
                        </small>

                        <!-- ACTIONS -->
                        <div>

                            <!-- ACCEPT -->
                            <form action="/bookings/${booking.bookingId}/accept"
                                method="post"
                                style="display:inline;">
                                <button type="submit"
                                        style="border:none; background:none; color:#16a34a; font-weight:500;">
                                    Accept
                                </button>
                            </form>

                            <span class="mx-1 text-muted">|</span>

                            <!-- REJECT -->
                            <form action="/bookings/${booking.bookingId}/reject"
                                method="post"
                                style="display:inline;">
                                <button type="submit"
                                        style="border:none; background:none; color:#dc2626; font-weight:500;">
                                    Reject
                                </button>
                            </form>

                        </div>

                    </div>

                </div>

                <hr>

                </#list>
            </div>
        </div>

    </div>

    <!-- UPCOMING TOURS -->
    <div class="mt-5">

        <div class="d-flex justify-content-between align-items-center mb-3">
            <h4>Upcoming Tours</h4>
            <!-- <button class="btn btn-outline-dark">Edit</button> -->
        </div>

        <#if (upcomingBookings![])?size gt 0>
            <#list (upcomingBookings![]) as booking>
                <div class="card p-3 mb-3 shadow-sm tour-card">

                    <div class="d-flex justify-content-between align-items-center">

                        <div class="d-flex gap-3">

                            <img src="${(booking.tour.images[0].imageUrl)!'/images/default.jpg'}">

                            <div>
                                <!-- <span class="badge badge-upcoming mb-2">Upcoming</span> -->

                                <h6>${booking.tour.title}</h6>

                                <small class="text-muted">${booking.tour.city}</small><br>

                                <small>${booking.groupSize} guests</small>
                            </div>

                        </div>

                        <div class="text-end">
                            <h5>$${(booking.tour.price * booking.groupSize)?string["#,##0.00"]}</h5>

                            <!-- <button class="btn btn-sm btn-outline-secondary">Edit</button>
                            <button class="btn btn-sm btn-dark-blue">Manage</button> -->
                        </div>

                    </div>

                </div>
            </#list>
        <#else>
            <p>No upcoming tours yet</p>
        </#if>

    </div>

</div>

</body>
</html>