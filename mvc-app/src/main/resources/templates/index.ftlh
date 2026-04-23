<!DOCTYPE html>
<html>
<head>
    <title>Carolina Explorer</title>
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
            background: #f5f7fa;
        }

        /* NAVBAR */

        .logo {
            font-weight: bold;
            font-size: 22px;
            color: #1a2b49;
        }

        .nav-links a {
            margin-left: 20px;
            text-decoration: none;
            color: #1a2b49;
        }

        .btn {
            background: #2a6df4;
            color: white;
            padding: 8px 14px;
            border-radius: 6px;
        }

        /* HERO */
        .hero {
            text-align: center;
            padding: 80px 20px 40px;
            /* background: url('https://images.unsplash.com/photo-1501785888041-af3ef285b470') center/cover; */
            background: url('/images/hero-image.jpg') 50% 25% / cover no-repeat;
            /* color: white; */
        }

        .hero h1 {
            font-size: 36px;
            font-weight: 400;
            font-style: normal;
            letter-spacing: 1px;

            color: #002868;

            text-decoration: none;

            font-family: "Gasoek One", sans-serif;

            transition: 0.2s ease;
        }

        .subtext, .subtext p {
            margin: 0;
            padding: 0;
            color: black;
            font-weight: 500;
        }

        /* SEARCH (FIGMA STYLE) */
        .search-container {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }

        .search-box {
            display: flex;
            background: white;
            border-radius: 50px;
            padding: 10px;
            gap: 10px;
            align-items: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        .search-box select,
        .search-box input {
            border: none;
            padding: 10px;
            outline: none;
        }

        .search-box button {
            background: #ffca00;
            color: white;
            border: none;
            padding: 10px 16px;
            border-radius: 50%;
            cursor: pointer;
        }


        /* SECTION */
        .section {
            padding: 60px 40px;
            text-align: center;
        }

        .bi-geo-alt {
            margin-right: 10px;
        }

        .cards {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
            flex-wrap: wrap;
        }

        .card {
            background: white;
            border-radius: 12px;
            padding: 15px;
            width: 260px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
            transition: 0.2s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card img {
            width: 100%;
            border-radius: 10px;
            height: 150px;
            object-fit: cover;
        }

        .card h3 {
            margin: 10px 0;
        }

        .section {
            padding: 60px 20px;
            background: #f8fafc;
            text-align: center;
            margin-top: 30px;
        }

        .section-header h2 {
            font-size: 28px;
            font-weight: 700;
            color: #1f3c88;
        }

        .section-header p {
            color: #555;
            margin-bottom: 40px;
        }

        /* GRID 2x2 */
        .city-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 25px;
            max-width: 700px;
            margin: auto;
        }

        /* CARD */
        .city-card {
            background: white;
            border-radius: 20px;
            padding: 15px;
            text-decoration: none; /* removes underline */
            color: inherit;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
        }

        .city-card:hover {
            transform: translateY(-5px);
        }

        /* IMAGE */
        .city-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 15px;
            margin-bottom: 10px;
        }

        /* TEXT */
        .city-card h3 {
            margin: 10px 0 5px;
            font-weight: 600;
        }

        .city-card p {
            font-size: 14px;
            color: #555;
        }

        /* GRID */
        .featured-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
            max-width: 1100px;
            margin: auto;
        }

        /* CARD */
        .featured-card {
            background: white;
            border-radius: 18px;
            overflow: hidden;
            text-decoration: none;
            color: inherit;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            transition: 0.3s;
        }

        .featured-card:hover {
            transform: translateY(-6px);
        }

        /* IMAGE */
        .featured-img {
            position: relative;
        }

        .featured-img img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        /* CATEGORY TAG */
        .tag {
            position: absolute;
            top: 10px;
            right: 10px;
            background: white;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        /* BODY */
        /* .bi-backpack {
            font-size: 40px;
        } */

        .feature-section {
            background-color: white;
        }

        .featured-body {
            padding: 15px;
            text-align: left;
        }

        .featured-body h4 {
            font-weight: 600;
            margin-bottom: 5px;
        }

        .desc {
            font-size: 14px;
            color: #555;
            margin-bottom: 10px;
        }

        /* PRICE */
        .price {
            font-weight: 600;
            color: #1f3c88;
        }

        .price span {
            font-weight: 400;
            color: #777;
        }

        /* RATING */
        .rating {
            font-size: 14px;
            color: #fbbf24;
        }

        .rating span {
            color: black;
        }

        .footer {
            background: white;
            padding: 30px;
            text-align: center;
            /* margin-top: 50px; */
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
 <#include "navbar.ftlh">
<!-- <div class="navbar">
    <div class="logo">Carolina Explorer</div>
    <div class="nav-links">
        <a href="/guides/signup">Become a tour guide</a>
        <a href="#">Login</a>
        <a class="btn" href="#">Sign Up</a>
    </div>
</div> -->

<!-- HERO -->
<div class="hero">
    <h1>Carolina Explorer</h1>
    <div class="subtext">
        <p>Welcome to North Carolina, a state filled with charming cities, relaxing beaches, and breathtaking peaks.</p>
        <p>It’s time to escape to your next adventure.</p>
    </div>

    <!-- SEARCH FORM -->
    <form action="/tours" method="get" class="search-container">
        <div class="search-box">

            <!-- WHERE -->
            <select name="city">
                <option value="">Where</option>
                <option value="ASHEVILLE">Asheville</option>
                <option value="CHARLOTTE">Charlotte</option>
                <option value="RALEIGH">Raleigh</option>
                <option value="WILMINGTON">Wilmington</option>
            </select>

            <!-- WHEN -->
            <input type="date" name="date" placeholder="When">

            <!-- WHO -->
            <input type="number" name="guests" placeholder="Guests" min="1">

            <button type="submit"><i class="bi bi-search"></i></button>
        </div>
    </form>
</div>

<!-- CITY SECTION -->
<div class="section">

    <!-- TITLE -->
    <div class="section-header">
        
        <h2><i class="bi bi-geo-alt"></i>Explore by City</h2>
        <p>Find unforgettable experiences in North Carolina’s most vibrant cities.</p>
    </div>

    <!-- GRID -->
    <div class="city-grid">

        <a href="/tours?city=ASHEVILLE" class="city-card">
            <img src="/images/asheville.jpg">
            <h3>Asheville</h3>
            <p>Mountain views, craft culture, and unforgettable food scenes.</p>
        </a>

        <a href="/tours?city=CHARLOTTE" class="city-card">
            <img src="/images/charlotte.jpg">
            <h3>Charlotte</h3>
            <p>Modern skyline meets Southern charm and vibrant nightlife.</p>
        </a>

        <a href="/tours?city=RALEIGH" class="city-card">
            <img src="/images/raleigh.jpg">
            <h3>Raleigh</h3>
            <p>Historic streets, creative energy, and hidden local gems.</p>
        </a>

        <a href="/tours?city=WILMINGTON" class="city-card">
            <img src="/images/wilmington.jpg">
            <h3>Wilmington</h3>
            <p>Coastal breezes, riverfront walks, and beachside adventures.</p>
        </a>

    </div>

</div>

<!-- FEATURED -->
<div class="section feature-section">

    <div class="section-header">
        <h2><i class="bi bi-backpack"></i> Featured Experiences</h2>
        <p>Handpicked tours across North Carolina.</p>
    </div>

    <div class="featured-grid">

        <#list tours as tour>
        <a href="/tours/${tour.tourId}" class="featured-card">

            <!-- IMAGE -->
            <div class="featured-img">
                <img src="${(tour.images[0].imageUrl)!'/images/default.jpg'}">

                <!-- CATEGORY TAG -->
                <span class="tag">${tour.category}</span>
            </div>

            <!-- CONTENT -->
            <div class="featured-body">

                <h4>${tour.title}</h4>

                <p class="desc">
                    ${tour.description?substring(0, 80)!''}...
                </p>

                <p class="price">$${tour.price} <span>/ person</span></p>

                <!-- RATING -->
                <div class="rating">
                    ⭐⭐⭐⭐⭐
                    <span> ${tour.rating!4.5} <span class="text-muted">(${tour.reviewCount!120})</span></span>
                </div>

            </div>

        </a>
        </#list>

    </div>

</div>

<!-- FOOTER -->
<div class="footer">
    <p>© 2026 Carolina Explorer</p>
</div>

</body>
</html>