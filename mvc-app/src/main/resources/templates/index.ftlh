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
            transition: box-shadow 0.2s ease; /* smooth shadow transition */
        }

        .search-box select,
        .search-box input {
            border: none;
            padding: 10px;
            outline: none;
            font-size: 1rem;
            background: transparent;
        }

        /* SEARCH BUTTON  */
        .search-box button {
            background: #ffca00;
            color: white;
            border: none;
            padding: 10px 16px;
            border-radius: 50%;
            cursor: pointer;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        .search-box button:hover {
            background: #e5b500;      /* slightly richer yellow on hover */
            transform: scale(1.02);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        .search-box button:active {
            transform: scale(0.98);
        }

        /* Search box container hover */
        .search-box:hover {
            box-shadow: 2px 12px 20px rgba(0,0,0,0.12);
        }

        /*  FILTER BUTTON  */
        .filter-btn {
            background: white;
            color: #1a2b49;
            border: 1px solid #e2e8f0;   /* always visible subtle border */
            padding: 8px 20px;            /* better vertical padding */
            border-radius: 40px;          /* fully rounded pill */
            margin-left: 20px;
            font-weight: 500;
            font-size: 0.9rem;
            cursor: pointer;
            transition: all 0.2s ease;
            box-shadow: 0 1px 2px rgba(0,0,0,0.02);
        }

        .filter-btn:hover {
            background: #f8fafc;          /* very light grey */
            border-color: #cbd5e1;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            transform: translateY(-1px);
        }

        .filter-btn:active {
            transform: translateY(1px);
        }


        .search-box button:focus-visible,
        .filter-btn:focus-visible {
            outline: 2px solid #ffca00;
            outline-offset: 2px;
        }

        .bi-sliders {
            margin-right: 2px;
        }

        .custom-footer {
            display: flex;
            justify-content: flex-end; /* pushes everything right */
            gap: 6px;
            border-top: none; /* removes bootstrap line */
            margin: 0;
            padding: 0;
        }

        /* CLEAR BUTTON (light grey) */
        .btn-clear {
            background: #e5e7eb;
            border: none;
            padding: 8px 18px;
            border-radius: 20px;
            color: #374151;
            font-weight: 500;
        }

        /* SEARCH BUTTON */
        .btn-search {
            background: #1f3c88;
            border: none;
            padding: 8px 18px;
            border-radius: 20px;
            color: white;
            font-weight: 500;
        }

        /* hover effects */
        .btn-search:hover {
            background: #162d66;
        }

        .btn-clear:hover {
            background: #d1d5db;
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
            /* margin-top: 30px; */
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
            /* margin: 0;
            padding: 0; */
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

        .stars .bi-star-fill { color: #fbbf24; }
        .stars .bi-star-half { color: #fbbf24; }
        .stars .bi-star { color: #ddd; }

        /* FORCE override bootstrap */
        .modal-content {
            border-radius: 18px !important;
            border: none !important;
            box-shadow: 0 20px 40px rgba(0,0,0,0.15) !important;
            padding: 20px !important;
            text-align: left !important;
        }

        /* TITLE */
        .modal-content h5 {
            text-align: center !important;
            font-weight: 600 !important;
            margin-bottom: 25px !important;
            font-size: 20px;
        }

        /* LABELS */
        .modal-content label {
            font-weight: 600 !important;
            font-size: 14px !important;
            margin-bottom: 6px !important;
            display: block !important;
            color: #1f3c88 !important;
        }

        /* INPUTS (IMPORTANT FIX) */
        .modal-content .form-control {
            border-radius: 10px !important;
            padding: 12px !important;
            border: 1px solid #d1d5db !important;
            font-size: 14px !important;
        }

        /* SPACING */
        .modal-content .mb-3 {
            margin-bottom: 20px !important;
        }

        /* CATEGORY */
        .modal-content .category-group div {
            margin-bottom: 6px;
            font-size: 14px;
        }

        /* GUIDE CTA SECTION */
        .guide-cta {
            background: #e9eff7; /* soft blue like figma */
            padding: 80px 20px;
        }

        /* CENTER CONTENT BUT KEEP TEXT LEFT */
        .guide-content {
            max-width: 900px;
            margin: auto;
            text-align: left; /* IMPORTANT (not center) */
        }

        /* TITLE */
        .guide-content h2 {
            font-size: 32px;
            font-weight: 700;
            color: #1f3c88;
            margin-bottom: 10px;
        }

        /* SUBTEXT */
        .guide-content p {
            color: #555;
            margin-bottom: 25px;
            font-size: 16px;
        }

        /* BUTTON */
        .guide-btn {
            background: #ffca00;
            color: white;
            padding: 8px 18px;
            border-radius: 20px;
            text-decoration: none;
            font-weight: 600;
            font-size: 14px;
            display: inline-block;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        /* HOVER */
        .guide-btn:hover {
            background: #e6b800;
        }
    </style>
</head>

<body>

    <!-- NAVBAR -->
    <#include "navbar.ftlh">

    <!-- HERO -->
    <div class="hero">
        <h1>Carolina Explorer</h1>
        <div class="subtext">
            <p>Welcome to North Carolina, a state filled with charming cities, relaxing beaches, and breathtaking peaks.</p>
            <p>It’s time to escape to your next adventure.</p>
        </div>

        <!-- SEARCH FORM -->
         <form action="/tours" method="get">
            <div class="search-container">
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
                    <input type="date" name="date">

                    <!-- WHO -->
                    <input type="number" name="guests" placeholder="Guests" min="1">

                    <!-- SEARCH BUTTON -->
                    <button type="submit">
                        <i class="bi bi-search"></i>
                    </button>
                </div>

                <!-- FILTER BUTTON (NOW ON RIGHT) -->
                <button type="button"
                        class="filter-btn"
                        data-bs-toggle="modal"
                        data-bs-target="#filterModal">
                    <i class="bi bi-sliders"></i> Filters
                </button>
            </div>

            <div class="modal fade" id="filterModal" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">

                        <h5>Filters</h5>

                        <!-- MIN PRICE -->
                        <div class="mb-3">
                            <label>Minimum Price ($)</label>
                            <input type="number" name="minPrice" class="form-control" placeholder="Type here...">
                        </div>

                        <!-- MAX PRICE -->
                        <div class="mb-3">
                            <label>Maximum Price ($)</label>
                            <input type="number" name="maxPrice" class="form-control" placeholder="Type here...">
                        </div>

                        <!-- CATEGORY -->
                        <div class="mb-3">
                            <label>Category</label>

                            <div class="category-group">
                                <div><input type="checkbox" name="category" value="FOOD"> Food & Drinks</div>
                                <div><input type="checkbox" name="category" value="HISTORY"> History & Culture</div>
                                <div><input type="checkbox" name="category" value="NATURE"> Nature & Outdoors</div>
                            </div>
                        </div>

                        <!-- BUTTONS -->
                        <div class="custom-footer">
                            <button type="reset" class="btn-clear">Clear all</button>
                            <button type="submit" class="btn-search">Search tours</button>
                        </div>

                    </div>
                </div>
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


    <!-- TOUR TYPE SECTION -->
    <div class="section feature-section">

    <div class="section-header">
        <h2><i class="bi bi-suitcase2"></i> Browse by Tour Type</h2>
        <p>Discover tours curated around what you love most.</p>
    </div>

    <div class="featured-grid">

        <a href="/tours?category=FOOD" class="featured-card">
            <div class="featured-img">
                <img src="/images/food.jpg">
            </div>

            <div class="featured-body">
                <h4>Food & Drinks</h4>
                <p class="desc">Savor local cuisine and authentic culinary experiences.</p>
            </div>
        </a>

         <a href="/tours?category=HISTORY" class="featured-card">
            <div class="featured-img">
                <img src="/images/history.jpg">
            </div>

            <div class="featured-body">
                <h4>History & Culture</h4>
                <p class="desc">Discover people, places, and moments that define local culture.</p>
            </div>
        </a>

        <a href="/tours?category=NATURE" class="featured-card">
            <div class="featured-img">
                <img src="/images/nature.jpg">
            </div>

            <div class="featured-body">
                <h4>Nature & Outdoors</h4>
                <p class="desc">Experience mountains, rivers, and coastlines up close.</p>
            </div>
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

            <#list featuredTours as tour>
            <a href="/tours/${tour.tourId}" class="featured-card">

                <!-- IMAGE -->
                <div class="featured-img">
                    <img src="${(tour.images[0].imageUrl)!'/images/default.jpg'}">

                    <!-- CATEGORY TAG -->
                    <span class="tag">${tour.category.displayName}</span>
                </div>

                <!-- CONTENT -->
                <div class="featured-body">

                    <h4>${tour.title}</h4>

                    <p class="desc">
                        <#if tour.shortDescription?has_content>
                            ${tour.shortDescription}
                        <#else>
                            ${tour.description?truncate(100, "...")}
                        </#if>
                    </p>

                    <p class="price">$${tour.price} <span>/ person</span></p>

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

                            <!-- STARS -->
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

                            <!-- NUMBER -->
                            <span class="rating-value">
                                ${rating?string("0.0")}
                            </span>

                            <span class="rating-count">
                                (${tour.reviewCount})
                            </span>

                        <#else>
                            <p class="text-muted">No reviews yet</p> 
                        </#if>

                    </div>

                </div>

            </a>
            </#list>

        </div>

    </div>

    <!-- BECOME A GUIDE SECTION -->
    <div class="guide-cta">

        <div class="guide-content">
            <h2>Share Your Local Expertise. Become a Guide.</h2>
            <p>Create and manage full-day experiences across North Carolina.</p>

            <a href="/guides/signup" class="guide-btn">Become a guide</a>
        </div>

    </div>

    <!-- FOOTER -->
    <#include "footer.ftlh">

    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</html>