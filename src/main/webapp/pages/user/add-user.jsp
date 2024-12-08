<%@ page import="model.bean.User" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../layout/admin/header.jsp" />
<jsp:include page="../../layout/admin/sidebar.jsp" />

<!-- Include Bootstrap CSS -->
<link rel="stylesheet" href="../../css/bootstrap-4-dist/css/bootstrap.min.css">

<!-- Custom CSS for form styling -->
<style>
    /* Màu chủ đạo */
    :root {
        --main-color: hsl(170, 75%, 41%);
    }

    /* Tùy chỉnh form */
    .content {
        background-color: #f4f7fc; /* Nền sáng cho content */
    }

    .form-control {
        border-color: var(--main-color); /* Màu viền cho input */
    }

    .form-control:focus {
        border-color: var(--main-color); /* Màu viền khi input focus */
        box-shadow: 0 0 0 0.2rem rgba(38, 198, 218, 0.5); /* Màu viền focus */
    }

    .btn-primary {
        background-color: var(--main-color); /* Màu nền cho button */
        border-color: var(--main-color); /* Màu viền cho button */
    }

    .btn-primary:hover {
        background-color: hsl(170, 75%, 31%); /* Màu nền khi hover */
        border-color: hsl(170, 75%, 31%); /* Màu viền khi hover */
    }

    .btn-secondary {
        background-color: #6c757d; /* Màu nền cho button phụ */
        border-color: #6c757d; /* Màu viền cho button phụ */
    }

    .btn-secondary:hover {
        background-color: #5a6368; /* Màu nền khi hover cho button phụ */
        border-color: #5a6368; /* Màu viền khi hover cho button phụ */
    }

    /* Thêm khoảng cách cho button phụ */
    .btn-secondary.mt-3 {
        margin-top: 20px;
    }

    .container {
        max-width: 600px; /* Đặt chiều rộng container */
    }

    .form-group label {
        font-weight: bold; /* Làm đậm các label */
    }

    h1 {
        color: var(--main-color); /* Màu tiêu đề */
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
                <input type="email" name="Email" id="Email" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="Password">Password</label>
                <input type="password" name="Password" id="Password" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="Role">Role</label>
                <select name="Role" id="Role" class="form-control" required>
                    <option value="admin">Admin</option>
                    <option value="user">User </option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Create User</button>
        </form>
        <a href="/dashboard/users" class="btn btn-secondary mt-3">Back to Users List</a>
    </div>
</div>

<jsp:include page="../../layout/admin/footer.jsp" />

<!-- Include Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
