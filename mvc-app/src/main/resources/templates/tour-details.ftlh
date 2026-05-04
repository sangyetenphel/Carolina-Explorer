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

        /* RATING */
        .rating {
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .stars .bi-star-fill {
            color: #f5a623;
        }

        .stars .bi-star-half {
            color: #f5a623;
        }

        .stars .bi-star {
            color: #ddd;   /* EMPTY stars = gray */
        }

        .rating-value {
            font-size: 13px;
            font-weight: 500;
            color: #222;
        }

        .rating-count {
            font-size: 12px;
            color: #8a8a8a;
        }


        .success-banner {
            background: #e6f4ea;
            color: #1e7e34;
            padding: 12px 16px;
            border-radius: 10px;
            margin-bottom: 15px;
            font-weight: 500;
        }

        .bi {
            color:#1f3c88;
        }

        .row-space{
            --bs-gutter-x: 5rem;
        }
    </style>
</head>

<body>

    <#include "navbar.ftlh">

    <div class="container mt-5 pb-5">

        <!-- TITLE -->
        <h2 class="fw-bold mb-2" style="color:#1f3c88;">
            ${tour.title}
        </h2>

        <div class="d-flex align-items-center gap-2 mb-3">

            <span class="badge rounded-pill px-3 py-2"
                style="background:#e0e7ff; color:#1f3c88;">
                ${tour.category.displayName}
            </span>
            <!-- RATING -->
            <#assign rating = (tour.rating!0)?number>
            <#assign fullStars = rating?floor>
            <#assign hasHalf = ((rating - fullStars) >= 0.5)>

            <#if hasHalf>
                <#assign emptyStars = 5 - fullStars - 1>
            <#else>
                <#assign emptyStars = 5 - fullStars>
            </#if>

            <div class="rating">

                <#if tour.reviewCount?has_content && (tour.reviewCount > 0)>

                    <span class="stars">

                        <#if fullStars gt 0>
                            <#list 1..fullStars as i>
                                <i class="bi bi-star-fill"></i>
                            </#list>
                        </#if>

                        <#if hasHalf>
                            <i class="bi bi-star-half"></i>
                        </#if>

                        <#if emptyStars gt 0>
                            <#list 1..emptyStars as i>
                                <i class="bi bi-star"></i>
                            </#list>
                        </#if>

                    </span>

                    ${rating?string("0.0")}
                    <span class="text-muted">
                        (${tour.reviewCount}
                        <#if tour.reviewCount == 1>review<#else>reviews</#if>)
                    </span>

                <#else>

                    <span class="text-muted">
                        No reviews yet
                    </span>

                </#if>

            </div>
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

            <img
                src="${tour.tourGuide.profileImageUrl!'/images/default-avatar.png'}"
                class="rounded-circle"
                style="width:40px; height:40px; object-fit:cover;">

            <div class="fw-medium">
                Hosted by
                ${(tour.tourGuide.firstName)!'Local'} ${(tour.tourGuide.lastName)!'Guide'}
            </div>

        </div>

        <hr>
        <#if successMessage??>
            <div class="success-banner">
                ${successMessage}
            </div>
        </#if>

        <div class="row row-space">

            <!-- LEFT SIDE -->
            <div class="col-md-7">

                <p>${tour.description}</p>

                <h5 class="fw-semibold mt-4">What's Included</h5>

                <ul class="mt-2">
                    <#list tour.includes?split(",") as item>
                        <li>${item?trim}</li>
                    </#list>
                </ul>

                <h5 class="fw-semibold mt-4">Itinerary</h5>

                <ul style="list-style:none; padding-left:0;">

                <#list tour.itinerary?split("\n\n") as block>

                    <li style="margin-bottom:15px; display:flex; gap:10px;">

                        <!-- PIN ICON -->
                        <span>
                            <i class="bi bi-geo-alt"></i>
                        </span>

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

                    <p><i class="bi bi-calendar-event"></i> Free Cancellation</p>

                    <p><i class="bi bi-clock"></i> Duration: ${tour.durationHours} hours</p>

                    <p><i class="bi bi-people"></i> Group Size: ${tour.minGuests!''}-${tour.maxGuests!''} guests</p>

                    <p><i class="bi bi-person-vcard"></i> Age Requirement: ${tour.ageRequirement!21}+</p>

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

        <hr>

        <h4 class="fw-semibold mt-5 mb-3">Customer Reviews</h4>

        <!-- SUMMARY -->
        <#if reviews?size gt 0>

            <div class="mb-3">
                <span style="color:#f5a623;">
                    <#list 1..(tour.rating?floor) as i>★</#list>
                </span>
                ${tour.rating?string("0.0")}
                <span class="text-muted">
                    (${reviews?size} <#if reviews?size == 1>review<#else>reviews</#if>)
                </span>
            </div>

        <#else>
            <p class="text-muted">No reviews yet</p>
        </#if>

        <!-- REVIEW LIST -->
        <div class="d-flex flex-column gap-4">

        <#list reviews as r>

            <div style="
                background:#eef2f7;
                border-radius:16px;
                padding:18px;
            ">

                <!-- USER -->
                <div class="d-flex align-items-center gap-3 mb-2">
                   <img
                        src="${r.booking.tourist.profileImage!'/images/default-avatar.png'}"
                        class="rounded-circle"
                        style="
                            width:40px;
                            height:40px;
                            object-fit:cover;
                            aspect-ratio:1/1;
                        ">

                    <div>
                        <div class="fw-semibold">
                            ${r.booking.tourist.firstName!''} ${r.booking.tourist.lastName!''}
                        </div>

                        <div class="text-muted" style="font-size:12px;">
                            <#assign createdDate = r.createdAt?datetime("yyyy-MM-dd'T'HH:mm:ss.SSSSSS")>

                            ${createdDate?string("MMM dd, yyyy")}
                        </div>
                    </div>
                </div>

                <!-- STARS -->
                <div style="color:#f5a623; margin-bottom:5px;">
                    <#list 1..r.rating as i>★</#list>
                </div>

                <!-- COMMENT -->
                <div style="font-size:14px; color:#333;">
                    ${r.comment}
                </div>

            </div>

        </#list>

        </div>
    </div>

    <!-- FOOTER -->
    <#include "footer.ftlh">
</body>
</html>