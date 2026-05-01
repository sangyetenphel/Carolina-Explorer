<!DOCTYPE html>
<html>
<head>
    <title>Tour Details</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: #f5f7fb;
        }

        .container {
            max-width: 1100px;
        }

        h2 {
            font-weight: 600;
            letter-spacing: -0.5px;
            color: #1f3c88;
        }

        .tag {
            background-color: #e0e7ff;
            color: #1f3c88;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 12px;
        }

        .gallery img {
            border-radius: 15px;
            object-fit: cover;
        }

        .booking-card {
            border-radius: 15px;
            box-shadow: 0px 10px 25px rgba(0,0,0,0.1);
            padding: 20px;
        }

        /* .btn-primary {
            background-color: #1f3c88;
            border: none;
            border-radius: 20px;
        } */


    </style>
</head>

<body>

<#include "navbar.ftlh">

<div class="container mt-5">

    <!-- TITLE -->
    <h2 class="fw-bold mb-2" style="color:#1f3c88;">
        ${tour.title}
    </h2>

    <div class="d-flex align-items-center gap-2 mb-3">

        <span class="badge rounded-pill px-3 py-2" 
            style="background:#e0e7ff; color:#1f3c88;">
            ${tour.category.displayName}
        </span>

        <span style="color:#fbbf24;">★★★★★</span>

        <span class="text-muted">4.5 (215 reviews)</span>

    </div>

    <!-- IMAGE GALLERY -->
    <div class="row g-3 mb-4">

        <!-- MAIN IMAGE -->
        <div class="col-md-7">
            <img
                src="${(tour.images[0].imageUrl)!'https://via.placeholder.com/800x500'}"
                class="w-100"
                style="
                    border-radius:20px;
                    height:420px;
                    object-fit:cover;
                ">
        </div>

        <!-- SIDE IMAGES -->
        <div class="col-md-5">
            <div class="row g-3" style="height:400px;">

                <#list tour.images[1..] as img>
                    <#if img?index < 4>
                        <div class="col-6" style="height:50%;">
                            <img
                                src="${img.imageUrl!''}"
                                class="w-100 h-100"
                                style="
                                    border-radius:15px;
                                    object-fit:cover;
                                ">
                        </div>
                    </#if>
                </#list>

            </div>
        </div>

    </div>

    <!-- HOST -->
    <div class="d-flex align-items-center gap-3 mb-4">

        <img src="https://i.pravatar.cc/40" class="rounded-circle">

        <div class="fw-medium">
            Hosted by
            ${(tour.tourGuide.firstName)!'Local'} ${(tour.tourGuide.lastName)!'Guide'}
        </div>

    </div>

    <hr>

    <div class="row">

        <!-- LEFT SIDE -->
        <div class="col-md-7">

            <p>${tour.description}</p>

            <h5 class="fw-semibold mt-4">What's Included</h5>

            <ul class="mt-2">
                <#list tour.includes?split(",") as item>
                    <li>${item?trim}</li>
                </#list>
            </ul>

            <h5>Itinerary</h5>

            <ul style="list-style:none; padding-left:0;">

            <#list tour.itinerary?split("\n\n") as block>

                <li style="margin-bottom:15px; display:flex; gap:10px;">

                    <!-- PIN ICON -->
                    <span style="color:#1f3c88;">📍</span>

                    <!-- TEXT BLOCK -->
                    <div>
                        <#list block?split("\n") as line>
                            <div>${line}</div>
                        </#list>
                    </div>

                </li>

            </#list>

            </ul>

            <hr>

            <h5 class="fw-semibold mt-4">Important Tour Information</h5>

            <div class="mt-3">

                <p>📄 Free Cancellation</p>

                <p>⏱ Duration: ${tour.durationHours} hours</p>

                <p>👥 Group Size: ${tour.minGuests!''}-${tour.maxGuests!''} guests</p>

                <p>🔞 Age Requirement: ${tour.ageRequirement!21}+</p>

            </div>

        </div>

        <!-- RIGHT SIDE (BOOKING CARD) -->
        <div class="col-md-5">

            <div class="booking-card">

                <h5>${tour.title}</h5>
                <h6>$${tour.price} per person</h6>

                <#if reviewMode?? && reviewMode>

                    <!-- REVIEW FORM -->
                    <form action="/reviews" method="post">

                        <input type="hidden" name="tourId" value="${tour.tourId}">
                        <input type="hidden" name="bookingId" value="${bookingId}">

                        <div class="mb-3">
                            <label>Rating</label>
                            <select name="rating" class="form-control" required>
                                <option value="">Select</option>
                                <option value="5">⭐ 5</option>
                                <option value="4">⭐ 4</option>
                                <option value="3">⭐ 3</option>
                                <option value="2">⭐ 2</option>
                                <option value="1">⭐ 1</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label>Review</label>
                            <textarea name="comment" class="form-control" required></textarea>
                        </div>

                        <button class="btn btn-success w-100">
                            Submit Review
                        </button>

                    </form>

                <#else>

                    <!-- ORIGINAL BOOKING FORM -->
                    <form action="/bookings" method="post">

                        <input type="hidden" name="tourId" value="${tour.tourId}">

                        <div class="mb-3">
                            <label>Select Date</label>
                            <input type="date" name="tourDate" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label>Guests</label>
                            <input type="number" name="guests" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label>Tour Type</label><br>
                            <input type="radio" name="groupType" value="PUBLIC"> Public<br>
                            <input type="radio" name="groupType" value="PRIVATE"> Private
                        </div>

                        <div class="mb-3">
                            <label>Special Requests</label>
                            <textarea name="notes" class="form-control"></textarea>
                        </div>

                        <button class="btn btn-primary w-100">
                            Book Now
                        </button>

                    </form>

                </#if>

            </div>

        </div>

    </div>

</div>

</body>
</html>