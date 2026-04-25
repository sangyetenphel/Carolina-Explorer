<!DOCTYPE html>
<html>
<head>
    <title>Tours</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #f4f6fb;
        }

        .container {
            display: flex;
            max-width: 1200px;
            margin: auto;
            padding: 50px 20px;
            gap: 40px;
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

        /* CARD */
        .card {
            background: white;
            border-radius: 18px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0,0,0,0.06);
            transition: 0.25s ease;
        }

        .card:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 25px rgba(0,0,0,0.1);
        }

        .card img {
            width: 100%;
            height: 170px;
            object-fit: cover;
        }

        .card-body {
            padding: 16px;
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
            font-size: 16px;
        }

        .desc {
            font-size: 13px;
            color: #666;
            margin: 6px 0;
        }

        .price {
            font-weight: 600;
            margin-top: 6px;
        }

        .rating {
            font-size: 13px;
            color: #f5a623;
            margin-top: 3px;
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

        <!-- LEFT -->
        <div class="left">

            <div class="title">
                <!-- 🧭 Explore ${selectedCity?capitalize! ""} -->
                 <#if selectedCity??>
                    <h2>${selectedCity?capitalize} Tours</h2>
                <#else>
                    <h2>All Tours</h2>
                </#if>
            </div>

            <div class="grid">

                <#list tours as tour>
                    <div class="card">

                        <!-- FIXED IMAGE -->
                        <img src="${(tour.images[0].imageUrl)!'/images/placeholder.jpg'}">

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

        <!-- RIGHT MAP -->
        <div class="right">

            <iframe
                class="map"
                src="https://maps.google.com/maps?q=${selectedCity}&output=embed">
            </iframe>

        </div>

    </div>

</body>
</html>