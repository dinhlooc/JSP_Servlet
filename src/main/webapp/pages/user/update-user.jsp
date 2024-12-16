<%@ page import="model.bean.User" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../layout/admin/header.jsp" />
<jsp:include page="../../layout/admin/sidebar.jsp" />
<link rel="stylesheet" href="../../assets/bootstrap-4-dist/css/bootstrap.min.css">
<style>
    :root {
        --main-color: #4CAF50;
        --main-hover-color: #388E3C;
        --secondary-color: #8E8E8E;
        --secondary-hover-color: #6C757D;
        --background-color: #F9FAFB;
        --input-focus-shadow: rgba(76, 175, 80, 0.3);
    }

    body {
        background-color: var(--background-color);
    }

    .content {
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        padding: 20px;
    }

    .form-control {
        border-color: var(--main-color);
    }

    .form-control:focus {
        border-color: var(--main-color);
        box-shadow: 0 0 0 0.2rem var(--input-focus-shadow);
    }

    .btn-primary {
        background-color: var(--main-color);
        border-color: var(--main-color);
    }

    .btn-primary:hover {
        background-color: var(--main-hover-color);
        border-color: var(--main-hover-color);
    }

    .btn-secondary {
        background-color: var(--secondary-color);
        border-color: var(--secondary-color);
    }

    .btn-secondary:hover {
        background-color: var(--secondary-hover-color);
        border-color: var(--secondary-hover-color);
    }

    h1 {
        color: var(--main-color);
        font-family: 'Roboto', sans-serif;
        font-weight: bold;
    }

    .form-group label {
        font-weight: bold;
        color: #333;
    }

    a.btn-secondary {
        margin-top: 20px;
        font-weight: bold;
    }

    .error-message {
        color: red;
        font-size: 14px;
        margin-top: 5px;
    }
</style>
<div class="content">
    <div class="container">
        <h1>Update User</h1>
        <%
            if(request.getAttribute("user") != null){
            User user = (User)request.getAttribute("user");
        %>
        <form action="/dashboard/user/update" method="POST">
            <input type="hidden" name="Id" value="<%=user.getId()%>">
            <div class="form-group">
                <label for="Fullname">Full Name</label>
                <input type="text" class="form-control" name="Fullname" id="Fullname" value="<%=user.getFullName()%>" required>
            </div>
            <div class="form-group">
                <label for="Email">Email</label>
                <input type="email" class="form-control" name="Email" id="Email" value="<%=user.getEmail()%>" required>
            </div>
            <div class="form-group">
                <label for="Password">Password</label>
                <input type="password" class="form-control" name="Password" id="Password" value="<%=user.getPassword()%>"
                       required>
            </div>
            <div class="form-group">
                <label for="Role">Role</label>
                <select class="form-control" name="Role" id="Role" required>
                    <option value="ADMIN" selected="<%=user.getRole().equalsIgnoreCase("ADMIN")%>">ADMIN</option>
                    <option value="USER" selected="<%=user.getRole().equalsIgnoreCase("USER")%>">USER</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Update User</button>
        </form>
        <%
            }
        %>
        <a href="/dashboard/users" class="btn btn-secondary">Back to Users List</a>
    </div>
</div>

<jsp:include page="../../layout/admin/footer.jsp" />
