<!DOCTYPE html>
<html>
<head>
    <title>Tours</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f5f7fa;
        }

        .container {
            display: flex;
            max-width: 1200px;
            margin: auto;
            padding: 40px;
            gap: 30px;
        }

        /* LEFT SIDE (TOURS) */
        .left {
            flex: 2;
        }

        .title {
            font-size: 26px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
            transition: 0.2s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card img {
            width: 100%;
            height: 140px;
            object-fit: cover;
        }

        .card-body {
            padding: 12px;
        }

        .badge {
            font-size: 11px;
            background: #eef3ff;
            color: #2a6df4;
            padding: 3px 8px;
            border-radius: 6px;
            display: inline-block;
            margin-bottom: 5px;
        }

        .card-title {
            font-weight: bold;
            font-size: 16px;
        }

        .desc {
            font-size: 13px;
            color: #666;
            margin: 5px 0;
        }

        .price {
            font-weight: bold;
            margin-top: 5px;
        }

        .rating {
            font-size: 12px;
            color: #ffaa00;
        }

        .link {
            display: inline-block;
            margin-top: 8px;
            color: #2a6df4;
            text-decoration: none;
            font-weight: bold;
        }

        /* RIGHT SIDE (MAP) */
        .right {
            flex: 1;
        }

        .map {
            width: 100%;
            height: 500px;
            border-radius: 12px;
            border: none;
        }

    </style>
</head>

<body>

<div class="container">

    <!-- LEFT SIDE -->
    <div class="left">

        <div class="title">
            Explore ${selectedCity?capitalize}
        </div>

        <div class="grid">

            <#list tours as tour>
                <div class="card">

                    <img src="https://images.unsplash.com/photo-1501785888041-af3ef285b470">

                    <div class="card-body">

                        <div class="badge">${tour.category}</div>

                        <div class="card-title">${tour.title}</div>

                        <div class="desc">${tour.description}</div>

                        <div class="price">$${tour.price} / person</div>

                        <div class="rating">⭐ 4.5 (120)</div>

                        <a class="link" href="/tours/${tour.tourId}">
                            View →
                        </a>

                    </div>

                </div>
            </#list>

        </div>

    </div>

    <!-- RIGHT SIDE (MAP) -->
    <div class="right">

        <iframe
            class="map"
            src="https://maps.google.com/maps?q=${selectedCity}&output=embed">
        </iframe>

    </div>

</div>

</body>
</html>