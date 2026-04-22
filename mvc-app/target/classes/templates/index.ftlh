<!DOCTYPE html>
<html>
<head>
    <title>Carolina Explorer</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f5f7fa;
        }

        /* NAVBAR */
        .navbar {
            display: flex;
            justify-content: space-between;
            padding: 20px 40px;
            background: white;
            align-items: center;
        }

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
            background: url('https://images.unsplash.com/photo-1501785888041-af3ef285b470') center/cover;
            color: white;
        }

        .hero h1 {
            font-size: 48px;
            margin-bottom: 10px;
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
            background: #2a6df4;
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

        .footer {
            background: white;
            padding: 30px;
            text-align: center;
            margin-top: 50px;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="logo">Carolina Explorer</div>
    <div class="nav-links">
        <a href="/tours">Explore</a>
        <a href="#">Login</a>
        <a class="btn" href="#">Sign Up</a>
    </div>
</div>

<!-- HERO -->
<div class="hero">
    <h1>Carolina Explorer</h1>
    <p>Discover North Carolina’s best tours and experiences</p>

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
            <input type="date" name="date">

            <!-- WHO -->
            <input type="number" name="guests" placeholder="Guests" min="1">

            <button type="submit">🔍</button>
        </div>
    </form>
</div>

<!-- CITY SECTION -->
<div class="section">
    <h2>Explore by City</h2>

    <div class="cards">

        <a href="/tours?city=ASHEVILLE">
            <div class="card">
                <img src="https://images.unsplash.com/photo-1501785888041-af3ef285b470">
                <h3>Asheville</h3>
                <p>Mountains, food, and culture</p>
            </div>
        </a>

        <a href="/tours?city=CHARLOTTE">
            <div class="card">
                <img src="https://images.unsplash.com/photo-1500530855697-b586d89ba3ee">
                <h3>Charlotte</h3>
                <p>Modern city & nightlife</p>
            </div>
        </a>

        <a href="/tours?city=RALEIGH">
            <div class="card">
                <img src="https://images.unsplash.com/photo-1587502537104-aac10f4e76c3">
                <h3>Raleigh</h3>
                <p>Historic + vibrant</p>
            </div>
        </a>

        <a href="/tours?city=WILMINGTON">
            <div class="card">
                <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c">
                <h3>Wilmington</h3>
                <p>Beach & coastal vibes</p>
            </div>
        </a>

    </div>
</div>

<!-- FEATURED -->
<div class="section">
    <h2>Featured Tours</h2>

    <div class="cards">
        <#list tours as tour>
            <div class="card">
                <h3>${tour.title}</h3>
                <p>$${tour.price}</p>
                <a href="/tours/${tour.tourId}">View</a>
            </div>
        </#list>
    </div>
</div>

<!-- FOOTER -->
<div class="footer">
    <p>© 2026 Carolina Explorer</p>
</div>

</body>
</html>