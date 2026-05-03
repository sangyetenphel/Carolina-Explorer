<!DOCTYPE html>
<html>
<head>
    <title>Create Tour</title>

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

        h4, h5 {
            color: #1f3c88;
            font-weight: 600;
        }

        h5 {
            margin-top: 30px;
            margin-bottom: 15px;
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

        .input-group button {
            transition: 0.2s;
        }

        .input-group button:hover {
            background-color: #dc3545;
            color: white;
        }

        textarea::placeholder {
        white-space: pre-line;
        color: #9ca3af;
    }

    </style>
</head>

<body>

<#include "navbar.ftlh">

<div class="container py-5">

    <div class="card shadow-lg p-4 mx-auto" style="max-width: 700px;">
        <h6 class="text-center mb-2 heading">
            Create Your First Tour
        </h6>

        <hr class="mb-0">

        <form action="/tours/create" method="post">
            <input type="hidden" name="tourGuide.tourGuideId" value="1">

            <!-- TOUR OVERVIEW -->
            <h5>Tour Overview</h5>

            <div class="mb-3">
                <label class="form-label">Tour Title</label>
                <input name="title" class="form-control" placeholder="Type here...">
            </div>

            <div class="mb-3">
                <label class="form-label">City</label>
                <select name="city" class="form-select">
                    <option value="ASHEVILLE">Asheville</option>
                    <option value="CHARLOTTE">Charlotte</option>
                    <option value="RALEIGH">Raleigh</option>
                    <option value="WILMINGTON">Wilmington</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Tour Category</label>
                <select name="category" class="form-select">
                    <option value="FOOD">Food & Drinks</option>
                    <option value="HISTORY">History & Culture</option>
                    <option value="NATURE">Nature & Outdoors</option>
                    <option value="ADVENTURE">Adventure</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Duration (hours)</label>
                <input name="durationHours" class="form-control" placeholder="e.g. 2">
            </div>

            <!-- PRICING -->
            <h5>Pricing & Capacity</h5>

            <div class="mb-3">
                <label class="form-label">Price ($)</label>
                <input name="price" class="form-control">
            </div>

            <div class="mb-3">
                <label class="form-label">Group Size</label>
                <div class="row">
                    <div class="col">
                        <input 
                            name="minGuests" 
                            class="form-control" 
                            placeholder="Min (e.g. 2)">
                    </div>
                    <div class="col">
                        <input 
                            name="maxGuests" 
                            class="form-control" 
                            placeholder="Max (e.g. 8)">
                    </div>
                </div>
            </div>

            <!-- ITINERARY -->
            <h5>Tour Itinerary</h5>

            <div class="mb-3">
                <label>Short Description</label>
                <textarea name="shortDescription" class="form-control" maxlength="200"
                    placeholder="Quick summary for homepage..."></textarea>
            </div>

            <div class="mb-3">
                <label class="form-label">Full Description</label>
                <textarea name="description" class="form-control"></textarea>
            </div>

            <div class="mb-3">
                <label>Full Itinerary</label>

                <textarea 
                    name="itinerary" 
                    class="form-control" 
                    rows="6"
                    placeholder="Example:

                    11:00 AM - Meet at Pack Square
                    Brief welcome and overview of Asheville’s craft beer history.

                    11:30 AM - Green Man Brewery
                    Guided tasting featuring flagship ales.

                    1:00 PM - Lunch Break
                    Free time to explore local food vendors."
                ></textarea>

                <small class="text-muted">
                    Tip: Enter each stop on a new line
                </small>
            </div>

            <div class="mb-3">
                <label class="form-label">What's Included (comma seperated)</label>
                <textarea name="includes" class="form-control"></textarea>
            </div>

            <div class="mb-3">
                <label class="form-label">Age Requirement</label>
                <input name="ageRequirement" class="form-control" placeholder="e.g. 21">
            </div>

            <!-- AVAILABILITY -->
            <h5>Availability</h5>

            <div class="mb-3">
                <label class="form-label">Available Date</label>
                <input type="date" name="availableDate" class="form-control">
            </div>

            <div class="mb-3">
                <label>Start Time</label>
                <input type="time" name="startTime" class="form-control" required>
            </div>

            <!-- IMAGES -->
            <div class="mb-4">
                <label class="form-label">Tour Images</label>

                <div id="image-container">
                    <div class="input-group mb-2">
                        <input 
                            type="text" 
                            name="imageUrls" 
                            class="form-control"
                            placeholder="Paste image URL"
                        >
                        <button type="button" class="btn btn-outline-danger remove-btn">✕</button>
                    </div>
                </div>

                <button type="button" class="btn btn-outline-primary" onclick="addImageField()">
                    + Add another image
                </button>
            </div>

            <div class="d-flex justify-content-end">
                <button type="submit" class="btn btn-primary px-4">
                    Create Tour
                </button>
            </div>
            
        </form>

    </div>

</div>

<script>
    function addImageField() {
        const container = document.getElementById("image-container");

        const newField = document.createElement("div");
        newField.classList.add("input-group", "mb-2");

        newField.innerHTML = `
            <input type="text" name="imageUrls" class="form-control" placeholder="Paste image URL">
            <button type="button" class="btn btn-outline-danger remove-btn">✕</button>
        `;

        container.appendChild(newField);
    }

    // REMOVE button
    document.addEventListener("click", function(e) {
        if (e.target.classList.contains("remove-btn")) {
            e.target.parentElement.remove();
        }
    });
</script>

</body>
</html>