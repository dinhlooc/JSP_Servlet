<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.bean.Course" %>
<%@ page import="model.bean.RegistrationProfile" %>
<jsp:include page="../../layout/admin/header.jsp" />
<jsp:include page="../../layout/admin/sidebar.jsp" />
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Details</title>
    <link rel="stylesheet" href="../../css/bootstrap-4-dist/css/bootstrap.min.css">
    <style>
        <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 30px;
        }
        .course-details-card {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .course-details-card h2 {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .course-details-card p {
            font-size: 1.1rem;
            margin-bottom: 10px;
        }
        .course-details-card .btn {
            background-color: #007bff;
            color: white;
        }
        .course-details-card .btn:hover {
            background-color: #0056b3;
        }
        .course-details-card .details-heading {
            font-weight: bold;
        }
    </style>
    </style>
</head>
<body>

<div class="container">
    <div class="course-details">
        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
        <div class="error-message text-center">
            <%= errorMessage %>
        </div>
        <%
            }
        %>

        <%-- Display course details if the course object exists --%>
        <%
            Course course = (Course) request.getAttribute("course");
            if (course != null) {
        %>
        <div class="mt-4">
            <h2><%= course.getName() %></h2>
            <div class="row">
                <div class="col-md-4">
                    <p class="details-heading">Giá: <%= course.getPrice() %>đ</p>
                </div>
                <div class="col-md-4">
                    <p class="details-heading">Thời gian bắt đầu: <%= new java.text.SimpleDateFormat("dd/MM/yyyy").format(course.getStartDate()) %></p>
                </div>
                <div class="col-md-4">
                    <p class="details-heading">Thời gian kết thúc(dự kiến): <%= new java.text.SimpleDateFormat("dd/MM/yyyy").format(course.getEndDate()) %></p>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <p class="details-heading">Mô tả:</p>
                    <p><%= course.getDescription() %></p>
                </div>
            </div>
        </div>
        <%
            }
        %>

        <%
            List<RegistrationProfile> profiles = (List<RegistrationProfile>) request.getAttribute("profiles");
            if (profiles != null && !profiles.isEmpty()) {
        %>
        <h3 class="mt-4">Danh sách hồ sơ đăng ký</h3>
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Họ Tên</th>
                    <th>Email</th>
                    <th>Số điện thoại</th>
                    <th>Trạng thái</th>
                    <th>CCCD</th>
                    <th>Học sinh/Sinh viên</th>
                </tr>
                </thead>
                <tbody>
                <% for (RegistrationProfile profile : profiles) { %>
                <tr>
                    <td><%= profile.getId() %></td>
                    <td><%= profile.getFullName() %></td>
                    <td><%= profile.getEmail() %></td>
                    <td><%= profile.getPhone() %></td>
                    <td><%= profile.getStatus() %></td>
                    <td><%= profile.getIdCard() %></td>
                    <td>
                        <input type="checkbox" disabled <%= profile.isStudent() ? "checked" : "" %> />
                    </td>

                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
        <%
        } else {
        %>
        <p class="text-center mt-3">Hiện chưa có hồ sơ đăng ký.</p>
        <%
            }
        %>

        <div class="mt-4 text-center">
            <a href="/courses" class="btn btn-primary">Trở lại</a>
        </div>
    </div>
</div>

<script src="../../css/bootstrap-4-dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>