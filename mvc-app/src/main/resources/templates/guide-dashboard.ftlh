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
            padding: 20px;
        }

        .tour-card img {
            border-radius: 12px;
            height: 100px;
            width: 140px;
            object-fit: cover;
        }

        .badge-upcoming {
            background: #e0e7ff;
            color: #1e3a8a;
            padding: 5px 10px;
            border-radius: 20px;
        }

        .btn-dark-blue {
            background: #1f3c88;
            color: white;
            border-radius: 20px;
        }

        .btn-dark-blue:hover {
            background: #162d66;
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

                <div class="d-flex justify-content-between mb-3">
                    <span>Earnings</span>
                    <strong>$${earnings?string["#,##0.00"]}</strong>
                </div>

                <hr>

                <div class="d-flex justify-content-between mb-3">
                    <span>Upcoming Tours</span>
                    <strong>${(upcomingBookings![])?size}</strong>
                </div>

                <hr>

                <div class="d-flex justify-content-between">
                    <span>Reviews</span>
                    <strong>${rating?string["0.0"]} ⭐</strong>
                </div>

            </div>
        </div>

        <!-- BOOKING REQUESTS -->
        <div class="col-md-6">
            <div class="card stat-card shadow-sm">

                <h5 class="mb-4">New Booking Requests</h5>

                <#list bookings as booking>
                    <div class="mb-3">

                        <p class="mb-1 fw-bold">${booking.tour.title}</p>

                        <small class="text-muted">
                            ${booking.tourDate} • ${booking.groupSize} guests
                        </small><br>

                        <!-- ACCEPT -->
                        <form action="/bookings/${booking.bookingId}/accept" method="post" style="display:inline;">
                            <button class="btn btn-sm btn-success">Accept</button>
                        </form>

                        <!-- REJECT -->
                        <form action="/bookings/${booking.bookingId}/reject" method="post" style="display:inline;">
                            <button class="btn btn-sm btn-danger">Reject</button>
                        </form>

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

                        <img src="${booking.tour.imageUrl!'/images/default.jpg'}">
                        <div>
                            <span class="badge badge-upcoming mb-2">Upcoming</span>

                            <h6>${booking.tour.title}</h6>
                            <small class="text-muted">${booking.tour.city}</small><br>
                            <!-- <small>${booking.tour.minGuests} - ${booking.tour.maxGuests} guests</small> -->
                            <small>${booking.groupSize} guests</small>
                        </div>

                    </div>

                    <div class="text-end">
                        <!-- <h5>$${booking.tour.price}</h5> -->
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