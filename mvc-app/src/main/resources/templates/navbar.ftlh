<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gasoek+One&family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <style>
        .logo-text {
            font-size: 24px;
            font-weight: 400;
            font-style: normal;
            letter-spacing: 1px;

            color: #002868;

            text-decoration: none;

            font-family: "Gasoek One", sans-serif;

            transition: 0.2s ease;
        }

        .logo-text:hover {
            color: #162d66;
        }

        .btn {
            background: #002868;
            color: white;
            padding: 8px 14px;
            border-radius: 6px;
            transition: background 0.2s ease;
        }

        .btn:hover {
            background-color: #1e3a8a;
            color: white;
        }

    </style>
</head>
<body>


    <nav class="d-flex justify-content-between align-items-center px-5 py-3 bg-white shadow-sm">
        <!-- <a href="/">
            <img src="/images/logo.png"
                alt="Carolina Explorer"
                style="height:40px;">
        </a> -->
        <a href="/" class="logo-text">
            Carolina Explorer
        </a>
        <div>
        <#if loggedInUser??>

            <#-- TOUR GUIDE NAVBAR -->
            <#if loggedInUser.role?string == "TOUR_GUIDE">

                <a href="/guides/dashboard" class="me-3 text-dark text-decoration-none">
                    Dashboard
                </a>

                <a href="/tours/create" class="me-3 text-dark text-decoration-none">
                    Create Tour
                </a>

                <a href="/logout" class="btn px-3">
                    Logout
                </a>

            <#-- TOURIST NAVBAR -->
            <#else>

                <a href="/profile" class="me-3 text-dark text-decoration-none">
                    View Profile
                </a>

                <a href="/logout" class="btn px-3">
                    Logout
                </a>

            </#if>

        <#else>

            <!-- Logged OUT Navbar -->
            <a href="/guides/signup" class="me-3 text-dark text-decoration-none">
                Become a tour guide
            </a>

            <a href="/login" class="me-3 text-dark text-decoration-none">
                Log in
            </a>

            <a href="/signup" class="btn px-3">
                Sign Up
            </a>

        </#if>
        </div>
    </nav>

    </body>
</html>