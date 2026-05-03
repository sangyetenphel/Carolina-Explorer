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
        display: grid;
        grid-template-columns: 1fr 1fr; /* ONLY 2 columns */
        gap: 30px;
        align-items: start;
        margin-bottom: 50px;
    }

    .profile-card {
        background: white;
        padding: 30px;
        border-radius: 20px;
        width: 350px;
        text-align: center;
        box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        margin-bottom: 40px;
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
        width: 100%;
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
        max-width: 260px;
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
        grid-template-columns: repeat(3, 1fr);
        gap: 40px;
    }

    /* Card */
    .review-card {
        padding: 10px 0;
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

                <h3>Upcoming Trips (${upcomingCount!0})</h3>

                <#list upcomingBookings![] as booking>

                    <div class="upcoming-item">

                        <img src="${(booking.tour.images[0].imageUrl)!'/images/default.jpg'}">

                        <div class="info">
                            <p class="title">${booking.tour.title}</p>
                            <span>${booking.tourDate}</span>
                        </div>

                        <form action="/booking/cancel/${booking.bookingId}" method="post">
                            <button class="cancel-btn">Cancel</button>
                        </form>

                    </div>

                <#else>
                    <p class="empty">No upcoming trips</p>
                </#list>

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
                <div class="trip-slider" id="tripSlider"></div>
                    <#list pastBookings as booking>
                        <div class="trip-card">

                            <img src="${(booking.tour.images[0].imageUrl)!'/images/default.jpg'}">

                            <h4>${booking.tour.city}</h4>
                            <p>${booking.tour.city}, North Carolina</p>
                            <span>${booking.tourDate}</span>

                            <div class="trip-footer">
                                <a href="/tours/${booking.tour.tourId}?review=true&bookingId=${booking.bookingId}"
                                class="write-review-btn">
                                    Leave a review
                                </a>
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
            <h2>My Reviews</h2>

            <#if reviews?has_content>
                <div class="reviews-grid">
                    <#list reviews as review>
                        <div class="review-card">

                            <!-- TOP ROW -->
                            <div class="review-header">

                                <!-- LEFT: HOST IMAGE -->
                                <img class="review-avatar"
                                    src="${(review.booking.tour.tourGuide.profileImageUrl)!'/images/default-avatar.png'}" />

                                <!-- RIGHT: TEXT -->
                                <div class="review-header-info">
                                    <h4 class="review-tour">
                                        ${review.booking.tour.title}
                                    </h4>

                                    <p class="review-location">
                                        ${review.booking.tour.city}, North Carolina
                                    </p>

                                    <p class="review-host">
                                        Hosted by ${review.booking.tour.tourGuide.firstName} ${review.booking.tour.tourGuide.lastName}
                                    </p>
                                </div>

                            </div>

                            <!-- STARS -->
                            <div class="review-stars">
                                <#list 1..review.rating as i>⭐</#list>
                            </div>

                            <!-- DATE -->
                            <p class="review-date">
                                ${review.createdAt?datetime.iso?string("MMMM yyyy")}
                            </p>

                            <!-- COMMENT -->
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
            document.getElementById("avatarModal").style.display = "block";
        }

        function closeAvatarModal() {
            document.getElementById("avatarModal").style.display = "none";
        }
    </script>
</body>
</html>