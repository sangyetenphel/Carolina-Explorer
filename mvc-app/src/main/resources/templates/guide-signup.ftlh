<!DOCTYPE html>
<html>
<head>
    <title>Become a Guide</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: "Plus Jakarta Sans", sans-serif;
            background: linear-gradient(to right, #7f9cc9, #cbd5e1);
        }

        .card {
            border-radius: 20px;
        }

        h4 {
            color: #1f3c88;
            font-weight: 600;
        }

        h5 {
            color: #1f3c88;
            font-weight: 600;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        h6{
            color: #1f3c88;
            font-weight: 600;
            margin-top: 20px;
        }

        .form-control, .form-select {
            border-radius: 10px;
            padding: 10px;
            border: 1px solid #e5e7eb;
        }

        .btn-primary {
            background-color: #1f3c88;
            border: none;
            border-radius: 25px;
            padding: 10px;
        }

        .btn-primary:hover {
            background-color: #162f6b;
        }

        .heading {
            font-size: 20px;
            text-align: center;
            color: black;
            font-weight: 300;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<#include "navbar.ftlh">

<div class="container py-5">

    <div class="card shadow-lg p-4 mx-auto" style="max-width: 600px;">

        <h6 class="text-center mb-2 heading">
            Apply to Become a Carolina Explorer Guide
        </h6>

        <hr>

        <form action="/guides/signup" method="post">

            <!-- PERSONAL INFO -->
            <h5>Personal Information</h5>

            <div class="mb-3">
                <label class="form-label">First Name on ID *</label>
                <input name="firstName" class="form-control" placeholder="Type here..." required>
            </div>

            <div class="mb-3">
                <label class="form-label">Last Name on ID *</label>
                <input name="lastName" class="form-control" placeholder="Type here..." required>
            </div>

            <div class="mb-3">
                <label class="form-label">Email *</label>
                <input name="email" type="email" class="form-control" placeholder="Type here..." required>
            </div>

            <div class="mb-3">
                <label class="form-label">Phone Number *</label>
                <input name="phone" class="form-control" placeholder="Type here..." required>
            </div>

            <div class="mb-3">
                <label class="form-label">Create Password *</label>
                <input name="passwordHash" type="password" class="form-control" placeholder="Type here..." required>
            </div>

            <div class="mb-4">
                <label class="form-label">Confirm Password *</label>
                <input type="password" class="form-control" placeholder="Type here..." required>
            </div>

            <!-- GUIDE DETAILS -->
            <h5>Guide Details</h5>

            <div class="mb-3">
                <label class="form-label">Profile Image URL</label>
                <input 
                    name="profileImageUrl" 
                    class="form-control" 
                    placeholder="Paste image link (e.g. https://...)">
            </div>

            <div class="mb-3">
                <label class="form-label">City You Operate In *</label>
                <select name="city" class="form-select" required>
                    <option value="">Select an option</option>
                    <option value="ASHEVILLE">Asheville</option>
                    <option value="CHARLOTTE">Charlotte</option>
                    <option value="RALEIGH">Raleigh</option>
                    <option value="WILMINGTON">Wilmington</option>
                </select>
            </div>

            <!-- <div class="mb-3">
                <label class="form-label">Years of Experience *</label>
                <input name="yearsOfExperience" type="number" class="form-control" placeholder="Select an option">
            </div>

            <div class="mb-3">
                <label class="form-label">Short Bio *</label>
                <textarea name="bio" class="form-control" placeholder="Tell travelers about your background and expertise..."></textarea>
            </div> -->

            <!-- AGREEMENTS -->
            <h5>Agreements</h5>

            <div class="form-check mb-2">
                <input type="checkbox" class="form-check-input" required>
                <label class="form-check-label">
                    I agree to the Terms of Service *
                </label>
            </div>

            <div class="form-check mb-4">
                <input type="checkbox" class="form-check-input" required>
                <label class="form-check-label">
                    I confirm I am legally allowed to operate tours *
                </label>
            </div>

            <div class="d-flex justify-content-end">
                <button type="submit" class="btn btn-primary px-4">
                    Sign Up
                </button>
            </div>

            <p class="text-center mt-4">
                Already have an account?
                <a href="/login">Log in</a>
            </p>

        </form>

    </div>

</div>

</body>
</html>