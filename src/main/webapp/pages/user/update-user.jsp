<%@ page import="model.bean.User" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../layout/admin/header.jsp" />
<jsp:include page="../../layout/admin/sidebar.jsp" /><div class="content">
    <link rel="stylesheet" href="../../css/bootstrap-4-dist/css/bootstrap.min.css">
    <div class="container">
        <h1>Update User</h1>
        <form action="/dashboard/update-user" method="POST">
            <input type="hidden" name="Id" value="${user.id}">
            <div class="form-group">
                <label for="Fullname">Full Name</label>
                <input type="text" name="Fullname" id="Fullname" value="${user.fullName}" required>
            </div>
            <div class="form-group">
                <label for="Email">Email</label>
                <input type="email" name="Email" id="Email" value="${user.email}" required>
            </div>
            <div class="form-group">
                <label for="Password">Password</label>
                <input type="password" name="Password" id="Password" value="${user.password}" required>
            </div>
            <div class="form-group">
                <label for="Role">Role</label>
                <select name="Role" id="Role" required>
                    <option value="admin" <c:if test="${user.role == 'admin'}">selected</c:if>>Admin</option>
                    <option value="user" <c:if test="${user.role == 'user'}">selected</c:if>>User</option>
                </select>
            </div>
            <button type="submit" class="btn">Update User</button>
        </form>
        <a href="/dashboard/users" class="btn btn-secondary">Back to Users List</a>
    </div>
</div>

<jsp:include page="../../layout/admin/footer.jsp" />