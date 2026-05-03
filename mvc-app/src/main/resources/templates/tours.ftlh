<!DOCTYPE html>
<html>
<head>
    <title>Tours</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: "Plus Jakarta Sans", sans-serif;
            background: #f4f6fb;
        }

        .container {
            display: flex;
            max-width: 1200px;
            margin: auto;
            padding: 50px 20px;
            gap: 40px;
            min-height: 85vh;
        }

        /* TITLE */
        .title {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 25px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        /* LEFT */
        .left {
            flex: 2;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 25px;
        }

        /* CLICKABLE CARD LINK */
        .tour-card-link {
            text-decoration: none;
            color: inherit;
        }


        /* CARD */
        .card {
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 6px 18px rgba(0,0,0,0.06);
            transition: all 0.25s ease;
            cursor: pointer;
        }


        .card:hover {
            transform: translateY(-8px) scale(1.01);
            box-shadow: 0 14px 30px rgba(0,0,0,0.12);
        }

        .image-wrapper {
            position: relative;
        }

        .card img {
            width: 100%;
            height: 160px;
            object-fit: cover;
        }

        .card-body {
            padding: 14px 16px;
        }

        .badge-overlay {
            position: absolute;
            top: 10px;
            right: 10px;
            background: white;
            color: #1f3c88;
            font-size: 11px;
            font-weight: 600;
            padding: 5px 10px;
            border-radius: 20px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.15);
        }

        .badge {
            font-size: 11px;
            background: #eef3ff;
            color: #2a6df4;
            padding: 4px 10px;
            border-radius: 999px;
            display: inline-block;
            margin-bottom: 6px;
            font-weight: 600;
        }

        .card-title {
            font-weight: 600;
            font-size: 15px;
            margin-bottom: 2px;
        }

        /* GUIDE NAME */
        .guide {
            font-size: 12px;
            color: #8a8a8a;
            margin-bottom: 6px;
        }

        /* DESCRIPTION */
        .desc {
            font-size: 13px;
            color: #666;
            line-height: 1.4;
            margin-bottom: 6px;
        }

        /* PRICE */
        .price {
            font-weight: 600;
            font-size: 14px;
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

        .link {
            display: inline-block;
            margin-top: 8px;
            color: #2a6df4;
            text-decoration: none;
            font-weight: 600;
        }

        /* RIGHT (MAP) */
        .right {
            flex: 1;
        }

        .map {
            width: 100%;
            height: 520px;
            border-radius: 18px;
            border: none;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
        }

    </style>
</head>

<body>

    <#include "navbar.ftlh">

    <div class="container">
        <!-- <#if booking??>
            <div class="alert alert-success">
                Booking successful!
            </div>
        </#if> -->

        <!-- LEFT -->
        <div class="left">

            <div class="title">

                 <#if selectedCity??>
                    <h2>
                        <i class="bi bi-house-door"></i>
                        Explore ${selectedCity?capitalize}
                    </h2>
                <#else>
                    <h2>
                        <i class="bi bi-house-door"></i>
                        Explore All Tours
                    </h2>
                </#if>
            </div>

            <div class="grid">

                <#list tours as tour>
                    <a href="/tours/${tour.tourId}" class="tour-card-link">

                    <div class="card">

                        <!-- IMAGE WRAPPER -->
                        <div class="image-wrapper">

                            <img src="${(tour.images[0].imageUrl)!'/images/placeholder.jpg'}">

                            <!-- CATEGORY BADGE (TOP RIGHT) -->
                            <div class="badge-overlay">
                                ${tour.category.displayName}
                            </div>

                        </div>

                        <div class="card-body">

                            <!-- TITLE -->
                            <div class="card-title">${tour.title}</div>

                            <!-- GUIDE -->
                            <div class="guide">
                                by ${tour.tourGuide.firstName} ${tour.tourGuide.lastName}
                            </div>

                            <!-- SHORT DESCRIPTION -->
                            <div class="desc">
                                ${tour.shortDescription!tour.description?truncate(100, "...")}
                            </div>

                            <!-- PRICE -->
                            <div class="price">$${tour.price} / person</div>

                            
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

                                    <span class="rating-value">
                                        ${rating?string("0.0")}
                                    </span>

                                    <span class="rating-count">
                                        (${tour.reviewCount})
                                    </span>

                                <#else>

                                    <span class="rating-count">
                                        No reviews yet
                                    </span>

                                </#if>

                            </div>

                        </div>

                    </div>
                    </a>
                </#list>

            </div>

        </div>

        <!-- RIGHT MAP -->
        <div class="right">

            <iframe
                class="map"
                src="https://maps.google.com/maps?q=${selectedCity}&output=embed">
            </iframe>

        </div>

    </div>
    <!-- FOOTER -->
    <#include "footer.ftlh">

</body>
</html>