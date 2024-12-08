<%@ page import="model.bean.User" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../layout/admin/header.jsp" />
<jsp:include page="../../layout/admin/sidebar.jsp" />

<link rel="stylesheet" href="../../css/bootstrap-4-dist/css/bootstrap.min.css">

<!-- Custom Styles -->
<style>
    :root {
        --main-color: hsl(170, 75%, 41%); /* Màu chủ đạo */
    }

    .content {
        background-color: #f4f7fc; /* Nền sáng cho content */
    }

    .form-group label {
        font-weight: bold;
        color: var(--main-color); /* Màu chữ cho label */
    }

    .form-control {
        border: 1px solid #ddd;
        border-radius: 4px;
        padding: 10px;
    }

    .form-control:focus {
        border-color: var(--main-color);
        box-shadow: 0 0 0 0.2rem rgba(38, 198, 218, 0.5);
    }

    .btn-primary {
        background-color: var(--main-color);
        border-color: var(--main-color);
        color: white;
        font-weight: bold;
    }

    .btn-primary:hover {
        background-color: hsl(170, 75%, 31%);
        border-color: hsl(170, 75%, 31%);
    }

    .btn-secondary {
        background-color: #6c757d;
        border-color: #6c757d;
        color: white;
    }

    .btn-secondary:hover {
        background-color: #5a6368;
        border-color: #5a6368;
    }

    .container {
        max-width: 600px;
        margin-top: 20px;
    }

    h1 {
        color: var(--main-color);
    }

    .form-group input, .form-group select {
        width: 100%;
    }

    .form-group {
        margin-bottom: 15px;
    }

    .btn {
        width: 100%;
        margin-top: 20px;
    }

    .btn-secondary {
        margin-top: 10px;
    }

</style>

<div class="content p-4">
    <div class="container">
        <h1 class="mb-4">Update User</h1>
        <form action="/dashboard/user/update" method="POST">
            <input type="hidden" name="Id" value="${user.id}">

            <div class="form-group">
                <label for="Fullname">Full Name</label>
                <input type="text" name="Fullname" id="Fullname" value="${user.fullName}" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="Email">Email</label>
                <input type="email" name="Email" id="Email" value="${user.email}" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="Password">Password</label>
                <input type="password" name="Password" id="Password" value="${user.password}" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="Role">Role</label>
                <select name="Role" id="Role" class="form-control" required>
                    <option value="ADMIN" ${user.role == 'ADMIN' ? 'selected' : ''}>ADMIN</option>
                    <option value="USER" ${user.role == 'USER' ? 'selected' : ''}>USER</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Update User</button>
        </form>

        <a href="/dashboard/users" class="btn btn-secondary">Back to Users List</a>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<jsp:include page="../../layout/admin/footer.jsp" />
