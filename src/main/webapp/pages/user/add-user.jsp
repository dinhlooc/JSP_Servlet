<%@ page import="model.bean.User" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../layout/admin/header.jsp" />
<jsp:include page="../../layout/admin/sidebar.jsp" />

<!-- Include Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<div class="content p-4">
    <div class="container">
        <h1 class="mb-4">Create New User</h1>
        <form action="/dashboard/create-user" method="POST">
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