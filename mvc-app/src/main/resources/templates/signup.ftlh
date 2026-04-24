<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>

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
    <div class="card shadow-lg p-4 mx-auto" style="max-width: 500px;">

        <h5 class="text-center mb-3">Welcome to Carolina Explorer!</h5>

        <form action="/signup" method="post">

            <h6>Legal Name</h6>

            <div class="mb-3">
                <input name="firstName" class="form-control" placeholder="First name" required>
            </div>

            <div class="mb-3">
                <input name="lastName" class="form-control" placeholder="Last name" required>
            </div>

            <div class="mb-3">
                <input name="dateOfBirth" type="date" class="form-control" required>
            </div>

            <h6>Contact Information</h6>

            <div class="mb-3">
                <input name="email" type="email" class="form-control" placeholder="Email" required>
            </div>

            <div class="mb-3">
                <input name="password" type="password" class="form-control" placeholder="Password" required>
            </div>

            <div class="mb-3">
                <input name="confirmPassword" type="password" class="form-control" placeholder="Confirm password" required>
            </div>

            <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" required>
                <label>I agree to Terms</label>
            </div>

            <button class="btn btn-primary w-100">Sign Up</button>

        </form>
    </div>
</div>

</body>
</html>