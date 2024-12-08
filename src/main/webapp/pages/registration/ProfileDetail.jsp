<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.bean.RegistrationProfile" %>
<%@ page import="model.bean.Course" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>

<jsp:include page="../../layout/admin/header.jsp" />
<jsp:include page="../../layout/admin/sidebar.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap-4-dist/css/bootstrap.min.css">
<link href="/BTN//css/style.css" rel="stylesheet">
<div class="content">
    <div class="container mt-5">
        <div class="profile-detail">
            <h1 class="text-center text-primary mb-4">Chi tiết Hồ sơ Đăng ký</h1>

            <%
                RegistrationProfile profile = (RegistrationProfile) request.getAttribute("profile");

                if (profile != null) {
            %>

            <div class="row">
                <div class="col-md-6">
                    <label class="form-label">ID</label>
                    <p><%= profile.getId() %></p>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Họ tên</label>
                    <p><%= profile.getFullName() %></p>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <label class="form-label">Ngày sinh</label>
                    <p><%= profile.getBirthDate() != null ? new SimpleDateFormat("dd/MM/yyyy").format(profile.getBirthDate()) : "Không có thông tin" %></p>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Khóa học</label>
                    <%
                    Course c=(Course) request.getAttribute("courseName");
                    %>
                    <p><%=c.getName() %></p>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <label class="form-label">Email</label>
                    <p><%= profile.getEmail() %></p>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Số điện thoại</label>
                    <p><%= profile.getPhone() %></p>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <label class="form-label">Căn cước</label>
                    <p><%= profile.getIdCard() %></p>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Học sinh</label>
                    <p><%= profile.isStudent() ? "Có" : "Không" %></p>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <label class="form-label">Mục tiêu</label>
                    <p><%= profile.getGoals() %></p>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Trạng thái</label>
                    <p><%= profile.getStatus() %></p>
                </div>
            </div>

            <!-- Nút Update và Delete -->
            <div class="btn-container mt-4">
                <!-- Nút Cập nhật mở modal -->
                <button type="button" class="btn btn-warning btn-lg" data-bs-toggle="modal" data-bs-target="#editModal"
    			 onclick="populateEditModal(
        		'<%= profile.getId() %>',
        		'<%= profile.getFullName() %>',
        		'<%= profile.getEmail() %>',
        		'<%= profile.getPhone() %>',
        		'<%= profile.getCourseId() %>',
        		'<%= profile.getIdCard() %>',
        		'<%= profile.getGoals() %>',
        		'<%= profile.getStatus() %>'
   					 )">
    				Cập nhật
				</button>
				<a href="/dashboard/registrations"" class="btn btn-secondary mt-3">Quay lại</a>

                <!-- Nút Xóa mở modal xác nhận -->

            </div>

            <!-- Modal Chỉnh sửa -->
            <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editModalLabel">Cập nhật Hồ sơ</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
							    <form action="/dashboard/registration/update" method="post">
								    <!-- Trường ID không chỉnh sửa -->
								    <input type="hidden" id="profileId" name="id">

								    <!-- Các trường khác -->
								    <div class="row">
								        <div class="col-md-6">
								            <label for="fullName" class="form-label">Họ tên:</label>
								            <input type="text" class="form-control" id="fullName" name="fullName" required>
								        </div>
								        <div class="col-md-6">
								            <label for="email" class="form-label">Email:</label>
								            <input type="email" class="form-control" id="email" name="email" required>
								        </div>
								    </div>
								    <div class="row">
								        <div class="col-md-6">
								            <label for="phone" class="form-label">Số điện thoại:</label>
								            <input type="text" class="form-control" id="phone" name="phone" required>
								        </div>
								        <div class="col-md-6">
										    <label for="courseId" class="form-label">Khóa học:</label>
										    <select class="form-select" id="courseId" name="courseId" required>
										        <%
										            List<model.bean.Course> courseList = (List<model.bean.Course>) request.getAttribute("courseList");
										            if (courseList != null) {
										                for (model.bean.Course course : courseList) {
										        %>
										        <option value="<%= course.getId() %>"><%= course.getName() %></option>
										        <%
										                }
										            }
										        %>
										    </select>
										</div>

								    </div>
								    <div class="row">
								        <div class="col-md-6">
								            <label for="idCard" class="form-label">Căn cước:</label>
								            <input type="text" class="form-control" id="idCard" name="idCard" required>
								        </div>
								        <div class="col-md-6">
								            <label for="goals" class="form-label">Mục tiêu:</label>
								            <input type="text" class="form-control" id="goals" name="goals">
								        </div>
								    </div>
								    <div class="row">
								        <div class="col-md-6">
								            <label for="status" class="form-label">Trạng thái:</label>
								            <input type="text" class="form-control" id="status" name="status" required>
								        </div>
								    </div>
								    <button type="submit" class="btn btn-primary mt-3">Cập nhật</button>

								</form>

							</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Xóa -->


            <%
                } else {
            %>
            <p>Không tìm thấy hồ sơ.</p>
            <%
                }
            %>
        </div>
    </div>
</div>

<script src="../../css/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
    <script>
    function populateEditModal(id, fullName, email, phone, courseId, idCard, goals, status) {
        document.getElementById('profileId').value = id;
        document.getElementById('fullName').value = fullName;
        document.getElementById('email').value = email;
        document.getElementById('phone').value = phone;
        document.getElementById('courseId').value = courseId;
        document.getElementById('idCard').value = idCard;
        document.getElementById('goals').value = goals;
        document.getElementById('status').value = status;
    }

    </script>
<jsp:include page="../../layout/admin/footer.jsp" />