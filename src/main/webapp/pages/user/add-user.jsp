<%@ page import="model.bean.User" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../layout/admin/header.jsp" />
<jsp:include page="../../layout/admin/sidebar.jsp" />

<!-- Include Bootstrap CSS -->
<link rel="stylesheet" href="../../css/bootstrap-4-dist/css/bootstrap.min.css">

<style>
    :root {
        --main-color: #4CAF50; /* A clean green shade */
        --main-hover-color: #388E3C; /* Darker green for hover */
        --secondary-color: #8E8E8E; /* A neutral gray for secondary elements */
        --secondary-hover-color: #6C757D; /* Darker neutral gray for hover */
        --background-color: #F9FAFB; /* Light background for the page */
        --input-focus-shadow: rgba(76, 175, 80, 0.3); /* Subtle green shadow for input focus */
    }

    body {
        background-color: var(--background-color); /* General page background */
    }

    .content {
        background-color: white; /* White background for content */
        border-radius: 10px; /* Rounded corners for a softer look */
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
        padding: 20px;
    }

    .form-control {
        border-color: var(--main-color); /* Main color for input border */
    }

    .form-control:focus {
        border-color: var(--main-color);
        box-shadow: 0 0 0 0.2rem var(--input-focus-shadow); /* Subtle focus shadow */
    }

    .btn-primary {
        background-color: var(--main-color);
        border-color: var(--main-color);
    }

    .btn-primary:hover {
        background-color: var(--main-hover-color); /* Darker green on hover */
        border-color: var(--main-hover-color);
    }

    .btn-secondary {
        background-color: var(--secondary-color); /* Neutral gray for secondary buttons */
        border-color: var(--secondary-color);
    }

    .btn-secondary:hover {
        background-color: var(--secondary-hover-color); /* Darker gray on hover */
        border-color: var(--secondary-hover-color);
    }

    h1 {
        color: var(--main-color); /* Main color for headings */
        font-family: 'Roboto', sans-serif; /* Modern font style */
        font-weight: bold;
    }

    .form-group label {
        font-weight: bold;
        color: #333; /* Dark text for labels */
    }

    a.btn-secondary {
        margin-top: 20px;
        font-weight: bold; /* Highlight the back button */
    }
    .error-message {
        color: red;
        font-size: 14px;
        margin-top: 5px;
    }
</style>


<div class="content p-4">
    <div class="container">
        <h1 class="mb-4">Create New User</h1>
        <form action="/dashboard/user/create" method="POST">
            <div class="form-group">
                <label for="Fullname">Full Name</label>
                <input type="text" name="Fullname" id="Fullname" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="Email">Email</label>
                <input type="email" id="email" name="Email" placeholder="Nhập email của bạn" class="form-control"  required
                       onblur="checkEmailAvailability()">
                <div id="emailError" class="error-message"></div>
            </div>
            <div class="form-group">
                <label for="Password">Password</label>
                <input type="password" name="Password" id="Password" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="Role">Role</label>
                <select name="Role" id="Role" class="form-control" required>
                    <option value="ADMIN">Admin</option>
                    <option value="USER">User </option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Create User</button>
        </form>
        <a href="/dashboard/users" class="btn btn-secondary mt-3">Back to Users List</a>
    </div>
</div>

<jsp:include page="../../layout/admin/footer.jsp" />
<script>
    function checkEmailAvailability() {
        var email = document.getElementById("email").value;
        var emailError = document.getElementById("emailError");

        var xhr = new XMLHttpRequest();
        xhr.open("GET", "/check-email?email=" + email, true);
        xhr.onload = function() {
            if (xhr.status === 200) {
                var response = xhr.responseText.trim();
                if (response === "exists") {
                    emailError.innerHTML = "Email đã tồn tại!";
                } else {
                    emailError.innerHTML = "";
                }
            }
        };
        xhr.send();
    }
</script>
<!-- Include Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
