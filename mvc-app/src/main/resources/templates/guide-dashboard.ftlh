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

        button.btn-light {
            border-radius: 50%;
            width: 32px;
            height: 32px;
            padding: 0;
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

                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h5 id="bookingTitle">New Booking Requests</h5>

                        <div>
                            <button onclick="showRequests()" class="btn btn-light btn-sm">‹</button>
                            <button onclick="showCancelled()" class="btn btn-light btn-sm">›</button>
                        </div>
                    </div>

                    <div id="requestsSection">
                        <#if bookings?has_content>

                            <#list bookings as booking>

                                <div class="d-flex align-items-start mb-4">

                                    <!-- PROFILE IMAGE -->
                                    <img src="${booking.tourist.profileImage!'/images/default-avatar.jpg'}"
                                        style="width:45px; height:45px; border-radius:50%; object-fit:cover;">

                                    <div class="ms-3">

                                        <h6 class="mb-1">${booking.tour.title}</h6>

                                        <small class="text-muted d-block">
                                            ${booking.tourDate?date("yyyy-MM-dd")?string("EEE, MMM d")}
                                        </small>

                                        <small class="text-muted d-block mb-2">
                                            ${booking.groupSize} guests
                                        </small>

                                        <div>
                                            <form action="/bookings/${booking.bookingId}/accept"
                                                method="post" style="display:inline;">
                                                <button type="submit"
                                                        style="border:none; background:none; color:#16a34a;">
                                                    Accept
                                                </button>
                                            </form>

                                            <span class="mx-1 text-muted">|</span>

                                            <form action="/bookings/${booking.bookingId}/reject"
                                                method="post" style="display:inline;">
                                                <button type="submit"
                                                        style="border:none; background:none; color:#dc2626;">
                                                    Reject
                                                </button>
                                            </form>
                                        </div>

                                    </div>
                                </div>

                                <hr>

                            </#list>

                        <#else>

                            <!-- EMPTY STATE -->
                            <div class="text-center text-muted py-4">
                                <i class="bi bi-inbox" style="font-size: 30px;"></i>
                                <p class="mt-2 mb-0">No new booking requests</p>
                                <small>You're all caught up!</small>
                            </div>

                        </#if>
                    </div>

                    <div id="cancelledSection" style="display:none;">

                        <#if cancelledBookings?has_content>

                            <#list cancelledBookings as booking>

                                <div class="d-flex align-items-start mb-4" style="opacity:0.6;">

                                    <img src="${booking.tourist.profileImage!'/images/default-avatar.jpg'}"
                                        style="width:45px; height:45px; border-radius:50%; object-fit:cover;">

                                    <div class="ms-3">

                                        <h6 class="mb-1">${booking.tour.title}</h6>

                                        <small class="text-muted d-block">
                                            ${booking.tourDate?date("yyyy-MM-dd")?string("EEE, MMM d")}
                                        </small>

                                        <small class="text-muted d-block mb-2">
                                            ${booking.groupSize} guests
                                        </small>

                                        <div style="color:#dc2626; font-size:12px;">
                                            Cancelled by tourist
                                        </div>

                                    </div>

                                </div>

                                <hr>

                            </#list>

                        <#else>

                            <div class="text-center text-muted py-4">
                                <i class="bi bi-x-circle" style="font-size: 30px;"></i>
                                <p class="mt-2 mb-0">No cancelled bookings</p>
                            </div>

                        </#if>

                    </div>
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

        <div class="mt-5">

            <div class="d-flex justify-content-between align-items-center mb-3">
                <h4>Completed Tours</h4>
            </div>

            <#if (completedBookings![])?size gt 0>
                <#list (completedBookings![]) as booking>

                    <div class="card p-3 mb-3 shadow-sm tour-card" style="opacity:0.6;">

                        <div class="d-flex justify-content-between align-items-center">

                            <div class="d-flex gap-3">

                                <img src="${(booking.tour.images[0].imageUrl)!'/images/default.jpg'}">

                                <div>
                                    <h6>${booking.tour.title}</h6>
                                    <small class="text-muted">${booking.tour.city}</small><br>
                                    <small>${booking.groupSize} guests</small>
                                </div>

                            </div>

                            <div class="text-end">
                                <h5>$${(booking.tour.price * booking.groupSize)?string["#,##0.00"]}</h5>

                                <div style="font-size:12px; color:#717171;">
                                    Completed
                                </div>
                            </div>

                        </div>

                    </div>

                </#list>
            <#else>
                <p>No completed tours yet</p>
            </#if>

        </div>

    </div>

    <script>
    function showRequests() {
        document.getElementById("requestsSection").style.display = "block";
        document.getElementById("cancelledSection").style.display = "none";
        document.getElementById("bookingTitle").innerText = "New Booking Requests";
    }

    function showCancelled() {
        document.getElementById("requestsSection").style.display = "none";
        document.getElementById("cancelledSection").style.display = "block";
        document.getElementById("bookingTitle").innerText = "Cancelled Bookings";
    }
    </script>

</body>
</html>