<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<jsp:include page="../../layout/admin/header.jsp" />
<jsp:include page="../../layout/admin/sidebar.jsp" />
<link rel="stylesheet" href="../../css/bootstrap-4-dist/css/bootstrap.min.css">
<link href="/BTN//css/style.css" rel="stylesheet">
<div class="content">
    <div class="container mt-5">
        <h1 class="text-center text-primary mb-4">Create Registration Profile</h1>
        <form action="/dashboard/registration/create" method="POST">
            <div class="row">

                <div class="col-md-6">
                    <label for="fullName" class="form-label">Full Name:</label>
                    <input type="text" class="form-control" id="fullName" name="fullName" required>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <label for="birthDate" class="form-label">Birth Date:</label>
                    <input type="date" class="form-control" id="birthDate" name="birthDate" required>
                </div>
                <div class="col-md-6">
				    <label for="courseId" class="form-label">Course ID:</label>
				    <select class="form-control" id="courseId" name="courseId" required>
				        <%
				            // Lấy danh sách khóa học từ request attribute
				            List<model.bean.Course> courseList = (List<model.bean.Course>) request.getAttribute("courseList");
				            if (courseList != null) {
				                for (model.bean.Course course : courseList) {
				        %>
				                    <option value="<%= course.getId() %>"><%= course.getName() %></option>
				        <%
				                }
				            } else {
				        %>
				                <option value="">No courses available</option>
				        <%
				            }
				        %>
				    </select>
				</div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="col-md-6">
                    <label for="phone" class="form-label">Phone:</label>
                    <input type="text" class="form-control" id="phone" name="phone" required>
                </div>
            </div>

            <div class="row">
                <div class="col-md-5">
                    <label for="idCard" class="form-label">ID Card:</label>
                    <input type="text" class="form-control" id="idCard" name="idCard" required>
                </div>
                <div class="col-md-2">
                    <label for="isStudent" class="form-label">Is Student:</label><br>
                    <input type="checkbox" class="form-check-input" id="isStudent" name="isStudent">
                </div>
                <div class="col-md-5">
                    <label for="goals" class="form-label">Goals:</label>
                    <input type="text" class="form-control" id="goals" name="goals" >

                </div>
            </div>



            <div class="row">
                <div class="col-md-6">
                    <label for="userId" class="form-label">User ID:</label>
                    <input type="text" class="form-control" id="userId" name="userId" required>
                </div>
                <div class="col-md-6">
                    <label for="status" class="form-label">Status:</label>
                    <input type="text" class="form-control" id="status" name="status" required>
                </div>
            </div>

            <button type="submit" class="btn btn-primary mt-4">Create</button>
        </form>
    </div>
</div>

<script src="../../css/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
<jsp:include page="../../layout/admin/footer.jsp" />