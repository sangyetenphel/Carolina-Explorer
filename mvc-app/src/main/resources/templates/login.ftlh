<!DOCTYPE html>
<html>
<head>
    <title>Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: "Plus Jakarta Sans", sans-serif;
            background: linear-gradient(to right, #7f9cc9, #cbd5e1);
        }

        .card {
            border-radius: 20px;
        }

        .btn-primary {
            background-color: #1f3c88;
            border-radius: 25px;
        }
    </style>
</head>

<body>

<#include "navbar.ftlh">

<div class="container py-5">
    <div class="card shadow-lg p-4 mx-auto" style="max-width: 450px;">

        <h5 class="text-center mb-3">Welcome back!</h5>
        <#if RequestParameters.error??>
            <p class="text-danger text-center">Invalid email or password</p>
        </#if>

        <form action="/login" method="post">

            <div class="mb-3">
                <input name="email" type="email" class="form-control" placeholder="Email" required>
            </div>

            <div class="mb-3">
                <input name="password" type="password" class="form-control" placeholder="Password" required>
            </div>

            <button class="btn btn-primary w-100">Log In</button>

        </form>

        <p class="text-center mt-3">
            Don’t have an account? <a href="/signup">Sign up</a>
        </p>

    </div>
</div>

</body>
</html>