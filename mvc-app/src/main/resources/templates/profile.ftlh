<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
        <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&display=swap" rel="stylesheet">
</head>
<style>

    body {
        /* margin: 0; */
        font-family: "Plus Jakarta Sans", sans-serif;
        background: #f5f7fa;
    }
    .profile-container {
        max-width: 1100px;   /* controls page width */
        margin: 0 auto;      /* centers it */
        padding: 40px 20px;
    }

    .profile-top {
        display: flex;              /* change from grid → flex */
        justify-content: center;    /* centers both cards together */
        gap: 30px;                  /* small clean gap */
        margin-bottom: 30px;
    }

    .profile-card {
        background: white;
        padding: 30px;
        border-radius: 20px;
        width: 350px;   /* back to original */
        text-align: center;
        box-shadow: 0 10px 25px rgba(0,0,0,0.08);
    }

    .profile-img-wrapper {
        position: relative;
        width: 120px;
        height: 120px;
        margin: 0 auto;
    }

    .profile-img {
        width: 100%;
        height: 100%;
        border-radius: 50%;
        object-fit: cover;
    }

    /* Pencil button */
    .edit-avatar-btn {
        position: absolute;
        bottom: 5px;
        right: 5px;
        background: #ffffff;
        border: none;
        border-radius: 50%;
        width: 32px;
        height: 32px;
        cursor: pointer;
        box-shadow: 0 2px 6px rgba(0,0,0,0.2);
    }

    .edit-avatar-btn:hover {
        background: #f7f7f7;
    }

    .stats {
        display: flex;
        justify-content: space-around;
        margin-top: 20px;
    }

    .upcoming-card {
        background: white;
        padding: 25px;
        border-radius: 20px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        width: 500px;
    }

    .upcoming-item {
        display: flex;
        align-items: center;
        gap: 15px;
        margin-bottom: 15px;
    }

    .upcoming-item img {
        width: 60px;
        height: 60px;
        object-fit: cover;
        border-radius: 10px;
    }

    .upcoming-item .info {
        flex: 1;
        margin: 0;
    }

    .upcoming-item  .title {
        margin: 0;
    }

    .info span {
        margin: 0;
        color: #717171;
        font-size: 12px;
    }

    .cancel-btn {
        background: transparent;
        color: red;
        border: none;
        cursor: pointer;
        font-weight: 500;
    }

    .section {
        margin-top: 50px;
    }

    .section-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .slider-controls button {
        border: none;
        background: #eee;
        width: 35px;
        height: 35px;
        border-radius: 50%;
        cursor: pointer;
        margin-left: 10px;
    }

    /* SLIDER */
    .trip-slider {
        display: flex;
        gap: 20px;
        overflow-x: auto;
        scroll-behavior: smooth;
        padding: 20px 0;
    }

    /* HIDE SCROLLBAR */
    .trip-slider::-webkit-scrollbar {
        display: none;
    }

    /* CARD */
    .trip-card {
        min-width: 260px;
        max-width: 300px;
        background: white;
        border-radius: 20px;
        padding: 15px;
        flex-shrink: 0;
        box-shadow: 0 10px 10px rgba(0,0,0,0.08);
        text-align: left;
        overflow: hidden;
        /* margin: 0px; */
    }

    .trip-card img {
        width: 100%;
        height: 160px;
        object-fit: cover;
        border-radius: 15px;
    }

    /* TEXT */
    .trip-card h4 {
        margin-top: 12px;
        font-weight: 600;
        margin-bottom: 0;
    }

    .trip-card p {
        font-size: 12px;
        color: #555;
        margin: 0;
        color: #717171;
    }

    .trip-card span {
        font-size: 12px;
        color: #999;
        margin: 0;
    }

    .trip-footer {
        display: flex;
        justify-content: flex-end;
        align-items: center;
        margin-top: 10px;
    }

    /* date styling */
    .trip-date {
        font-size: 14px;
        color: #717171;
    }

    /* BUTTON */
    .write-review-btn {
        background: #2f4b8f;
        color: white;
        padding: 6px 12px;
        border-radius: 8px;
        font-size: 12px;
        text-decoration: none;
        transition: 0.2s;
    }

    .write-review-btn:hover {
        background: #1e3a7a;
    }

    hr {
        border: 0;
        height: 1px;
        background: #EBEBEB;        /* very light gray */
        margin: 28px 0 24px 0;
        width: 100%;
    }

    .reviews-grid {
        display: grid;
        grid-template-columns: repeat(3, minmax(0, 1fr));
        gap: 30px;
    }

    /* Card */
    .review-card {
        min-width: 300px;
        max-width: 350px;
        background: white;
        border-radius: 20px;
        padding: 20px;
        flex-shrink: 0;
        box-shadow: 0 10px 20px rgba(0,0,0,0.08);
    }

    /* HEADER ROW */
    .review-header {
        display: flex;
        align-items: center;
        gap: 12px;
        margin-bottom: 10px;
    }

    /* Avatar */
    .review-avatar {
        width: 48px;
        height: 48px;
        border-radius: 50%;
        object-fit: cover;
    }

    /* Text block */
    .review-header-info {
        display: flex;
        flex-direction: column;
    }

    /* Tour title */
    .review-tour {
        font-size: 16px;
        font-weight: 600;
        margin: 0;
    }

    /* Location */
    .review-location {
        font-size: 14px;
        color: #717171;
        margin: 0;
    }

    /* Host */
    .review-host {
        font-size: 14px;
        color: #717171;
        margin: 0;
    }

    /* Stars */
    .review-stars {
        margin: 8px 0 4px;
        font-size: 14px;
    }

    /* Date */
    .review-date {
        font-size: 14px;
        color: #717171;
        margin-bottom: 8px;
    }

    /* Comment */
    .review-text {
        font-size: 15px;
        line-height: 1.5;
    }

    .explore-btn {
        background: #2f4b8f;
        color: white;
        padding: 10px 16px;
        border-radius: 10px;
        text-decoration: none;
        font-size: 14px;
    }

    .explore-btn:hover {
        background: #1e3a7a;
    }

    .bi {
        color:#1f3c88;
    }

    /* MODAL BACKGROUND */
    .modal {
        display: none; /* hidden by default */
        position: fixed;
        z-index: 999;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;

        background: rgba(0, 0, 0, 0.4); /* dark overlay */

        /* display: flex; */
        align-items: center;
        justify-content: center;
    }

    /* MODAL BOX */
    .modal-content {
        background: white;
        padding: 30px;
        border-radius: 16px;
        width: 400px;
        max-width: 90%;
        box-shadow: 0 20px 50px rgba(0,0,0,0.2);
    }

    /* INPUT */
    .modal-content input {
        width: 100%;
        padding: 10px;
        border-radius: 8px;
        border: 1px solid #ddd;
        margin-top: 10px;
    }

    /* BUTTONS */
    .modal-actions {
        display: flex;
        justify-content: flex-end;
        gap: 10px;
        margin-top: 20px;
    }

    .modal-actions button {
        padding: 8px 14px;
        border-radius: 8px;
        border: none;
        cursor: pointer;
    }

    .modal-actions button:first-child {
        background: #eee;
    }

    .modal-actions button:last-child {
        background: #1f3c88;
        color: white;
    }

    button.btn-light {
        border-radius: 50%;
        width: 32px;
        height: 32px;
        padding: 0;
    }

    /* RATING */
    .rating {
        font-size: 14px;
        color: #fbbf24;
    }

    .rating span {
        color: black;
    }

    .stars .bi-star-fill { color: #fbbf24; }
    .stars .bi-star-half { color: #fbbf24; }
    .stars .bi-star { color: #ddd; }

</style>
<body>
    <#include "navbar.ftlh">

    <div class="profile-container">
        <div class="profile-top">

            <!-- LEFT: Profile -->
            <div class="profile-card">
                <div class="profile-img-wrapper">
                    <img src="${tourist.profileImage!'/images/default-avatar.png'}" class="profile-img">

                    <!-- EDIT ICON -->
                    <button class="edit-avatar-btn" onclick="openAvatarModal()">
                        <i class="bi bi-pencil"></i>
                    </button>
                </div>

                <h2>${tourist.firstName} ${tourist.lastName}</h2>
                <p class="role">Tourist</p>

                <div class="stats">
                    <div>
                        <h3>${tripCount}</h3>
                        <p>Trips</p>
                    </div>

                    <div>
                        <h3>${tourist.reviewCount!0}</h3>
                        <p>Reviews</p>
                    </div>
                </div>
            </div>


            <!-- RIGHT: Upcoming Trips -->
            <div class="upcoming-card">

                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h3 id="tripTitle">Upcoming Trips (${upcomingCount!0})</h3>

                    <div>
                       <div>
                        <button onclick="prevView()" class="btn btn-light btn-sm">‹</button>
                        <button onclick="nextView()" class="btn btn-light btn-sm">›</button>
                    </div>
                    </div>
                </div>

                <div id="upcomingSection">
                    <#list upcomingBookings![] as booking>

                        <div class="upcoming-item">

                            <img src="${(booking.tour.images[0].imageUrl)!'/images/default.jpg'}">

                            <div class="info">
                                <p class="title">${booking.tour.title}</p>
                                <span>${booking.tourDate}</span>
                            </div>

                            <form action="/bookings/cancel/${booking.bookingId}" method="post">
                                <button class="cancel-btn">Cancel</button>
                            </form>

                        </div>

                    <#else>
                        <p class="empty">No upcoming trips</p>
                    </#list>
                </div>

                <div id="pendingSection" style="display:none;">

                    <#if pendingBookings?has_content>

                        <#list pendingBookings as booking>

                            <div class="upcoming-item" style="opacity:0.8;">

                                <img src="${(booking.tour.images[0].imageUrl)!'/images/default.jpg'}">

                                <div class="info">
                                    <p class="title">${booking.tour.title}</p>
                                    <span>${booking.tourDate}</span>

                                    <div style="color:#f59e0b; font-size:12px;">
                                        Waiting for approval
                                    </div>
                                </div>

                            </div>

                        </#list>

                    <#else>
                        <p class="text-muted">No pending bookings</p>
                    </#if>

                </div>

                <div id="declinedSection" style="display:none;">

                    <#if rejectedBookings?has_content>

                        <#list rejectedBookings as booking>

                            <div class="upcoming-item" style="opacity:0.6;">

                                <img src="${(booking.tour.images[0].imageUrl)!'/images/default.jpg'}">

                                <div class="info">
                                    <p class="title">${booking.tour.title}</p>
                                    <span>${booking.tourDate}</span>

                                    <div style="color:#dc2626; font-size:12px;">
                                        Declined by host
                                    </div>
                                </div>

                            </div>

                        </#list>

                    <#else>
                        <p class="text-muted">No declined bookings</p>
                    </#if>
                </div>
            </div>
        </div>

        <hr>

        <div class="section">
            <div class="section-header">
                <h2>Where I’ve been</h2>

                <div class="slider-controls">
                    <button onclick="scrollTrips(-1)">‹</button>
                    <button onclick="scrollTrips(1)">›</button>
                </div>
            </div>

            <#if pastBookings?has_content>

                <!-- slider wraps the loop -->
                <div class="trip-slider" id="tripSlider">

                    <#list pastBookings as booking>
                        <div class="trip-card">

                            <img src="${(booking.tour.images[0].imageUrl)!'/images/default.jpg'}">

                            <h4>${booking.tour.title}</h4>
                            <!-- <p>${booking.tour.city}, North Carolina</p> -->
                            <span>${booking.tourDate}</span>

                            <div class="trip-footer">
                                <#if reviewedBookingIds?seq_contains(booking.bookingId)>
                                    <span style="
                                        background: #dcfce7;
                                        color: #166534;
                                        padding:6px 12px;
                                        border-radius:8px;
                                        font-size:12px;
                                        font-weight:500;
                                    ">
                                        Reviewed
                                    </span>

                                <#else>

                                    <a href="/tours/${booking.tour.tourId}?review=true&bookingId=${booking.bookingId}"
                                    class="write-review-btn">
                                        Leave a review
                                    </a>

                                </#if>
                            </div>

                        </div>
                    </#list>

                </div>

            <#else>
                <p class="text-muted">No trips yet</p>
            </#if>
        </div>

        <hr>

        <div class="section">
            <div class="section-header">
                <h2>My Reviews</h2>

                <div class="slider-controls">
                    <button onclick="scrollReviews(-1)">‹</button>
                    <button onclick="scrollReviews(1)">›</button>
                </div>
            </div>
            <#if reviews?has_content>
                <div class="trip-slider" id="reviewSlider">

                    <#list reviews as review>
                        <div class="review-card">

                            <div class="review-header">
                                <img class="review-avatar"
                                    src="${(review.booking.tour.tourGuide.profileImageUrl)!'/images/default-avatar.png'}" />

                                <div class="review-header-info">
                                    <h4 class="review-tour">
                                        ${review.booking.tour.title}
                                    </h4>

                                    <!-- <p class="review-location">
                                        ${review.booking.tour.city}, North Carolina
                                    </p> -->

                                    <p class="review-host">
                                        Hosted by ${review.booking.tour.tourGuide.firstName}
                                        ${review.booking.tour.tourGuide.lastName}
                                    </p>
                                </div>
                            </div>

                            <!-- <div class="review-stars">
                                <#list 1..review.rating as i>⭐</#list>
                            </div> -->

                            <div class="review-stars">
                                <#assign rating = (review.rating!0)?number>
                                <#assign fullStars = rating?floor>
                                <#assign hasHalf = ((rating - fullStars) >= 0.5)>

                                <#if hasHalf>
                                    <#assign emptyStars = 5 - fullStars - 1>
                                <#else>
                                    <#assign emptyStars = 5 - fullStars>
                                </#if>

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

                            </div>

                            <p class="review-date">
                                ${review.createdAt?datetime.iso?string("MMMM yyyy")}
                            </p>

                            <p class="review-text">
                                ${review.comment}
                            </p>

                        </div>
                    </#list>

                </div>
            <#else>
                <p class="text-muted">No reviews yet</p>
            </#if>
        </div>
    </div>

    <div id="avatarModal" class="modal">
        <div class="modal-content">
            <h3>Update Profile Picture</h3>

            <form action="/profile/avatar" method="post">
                <input type="text" name="imageUrl" placeholder="Paste image URL..." required>

                <div class="modal-actions">
                    <button type="button" onclick="closeAvatarModal()">Cancel</button>
                    <button type="submit">Save</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        function scrollTrips(direction) {
            const slider = document.getElementById("tripSlider");
            slider.scrollBy({
                left: direction * 300,
                behavior: 'smooth'
            });
        }
    </script>

    <script>
        function openAvatarModal() {
            const modal = document.getElementById("avatarModal");
            modal.style.display = "flex"; 
        }

        function closeAvatarModal() {
            const modal = document.getElementById("avatarModal");
            modal.style.display = "none";
        }
    </script>


    <script>
        let currentView = 0;

        const views = [
            { id: "upcomingSection", title: "Upcoming Trips (${upcomingCount!0})" },
            { id: "pendingSection", title: "Pending Requests (${pendingCount!0})" },
            { id: "declinedSection", title: "Declined Bookings (${rejectedCount!0})" }
        ];

        function updateView() {

            // hide all sections
            views.forEach(v => {
                document.getElementById(v.id).style.display = "none";
            });

            // show current section
            const current = views[currentView];
            document.getElementById(current.id).style.display = "block";
            document.getElementById("tripTitle").innerText = current.title;
        }

        function nextView() {
            currentView = (currentView + 1) % views.length;
            updateView();
        }

        function prevView() {
            currentView = (currentView - 1 + views.length) % views.length;
            updateView();
        }

        function scrollReviews(direction) {
            const slider = document.getElementById("reviewSlider");
            slider.scrollBy({
                left: direction * 320,
                behavior: 'smooth'
            });
        }
    </script>

</body>
</html>