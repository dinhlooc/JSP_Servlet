<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.bean.RegistrationProfile" %>
<jsp:include page="../../layout/admin/header.jsp" />
<jsp:include page="../../layout/admin/sidebar.jsp" />
<link rel="stylesheet" href="../../css/bootstrap-4-dist/css/bootstrap.min.css">
<div class="content">

    <h1>Registration Management</h1>

    <div class="container mt-5">

        <div class="row mb-4 align-items-center justify-content-center">
        <div class="col-md-4 ">
		        <a href="/dashboard/registration/create" class="btn btn-success">Add Registration</a>
		    </div>
		    <div class="col-md-4 align-items-center">
		        <form method="get" action="/dashboard/registrations/searchs" class="search-bar">
		            <div class="input-group">
		                <input type="text" name="query" class="form-control" placeholder="Search by name, email, or phone" required>
		                <button class="btn btn-primary" type="submit">Search</button>
		            </div>
		        </form>
		    </div>

		</div>



        <table class="table custom-table table__users  " >
            <thead class="table-dark">
                <tr>
                    <th>Họ tên</th>
                    <th>Số điện thoại</th>
                    <th>Email</th>
                    <th>Mã khóa học</th>
                    <th>Mã người đăng ký</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th> <!-- Thêm cột thao tác -->
                </tr>
            </thead>
            <tbody>
                <%
                    List<RegistrationProfile> profiles = (List<RegistrationProfile>) request.getAttribute("profiles");
                    if (profiles != null && !profiles.isEmpty()) {
                        for (RegistrationProfile profile : profiles) {
                %>
                    <tr>
                        <td><%= profile.getFullName() %></td>
                        <td><%= profile.getPhone() %></td>
                        <td><%= profile.getEmail() %></td>
                        <td><%= profile.getCourseId() %></td>
                        <td><%= profile.getUserId() %></td>
                        <td><%= profile.getStatus() %></td>
                        <td>
                            <a href="/dashboard/registration/detail?id=<%= profile.getId() %>" class="btn btn-info">Xem</a>
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal"
        data-bs-target="#deleteModal"
        data-id="<%= profile.getId() %>"
        data-name="<%= profile.getFullName() %>">
    Xóa
</button>
                        </td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="7" class="text-center">Không có hồ sơ nào.</td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <!-- Modal Xóa (dùng chung) -->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">Xác nhận xóa</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p id="deleteModalBody">Bạn có chắc chắn muốn xóa hồ sơ này không?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <a href="#" id="confirmDeleteBtn" class="btn btn-danger">Xóa</a>
                </div>
            </div>
        </div>
    </div>


</div>
<script src="../../css/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
  <script>
   const deleteModal = document.getElementById('deleteModal');
   const deleteModalBody = document.getElementById('deleteModalBody');
   const confirmDeleteBtn = document.getElementById('confirmDeleteBtn');

   deleteModal.addEventListener('show.bs.modal', function (event) {
	    const button = event.relatedTarget; // Lấy button vừa được nhấn
	    const profileId = button.getAttribute('data-id'); // Lấy giá trị data-id
	    const profileName = button.getAttribute('data-name'); // Lấy giá trị data-name

	    // Kiểm tra giá trị của profileId và profileName
	    console.log('Profile ID:', profileId); // Debug
	    console.log('Profile Name:', profileName); // Debug

	    // Kiểm tra nếu profileId hoặc profileName rỗng
	    if (!profileId || !profileName) {
	        console.error("profileId hoặc profileName không có giá trị hợp lệ.");
	    }

	    // Loại bỏ khoảng trắng thừa trong profileName
	    const cleanedProfileName = profileName.trim();

	    // Gắn thông tin động vào modal
	    if (cleanedProfileName) {
	        deleteModalBody.innerHTML = "Bạn có chắc chắn muốn xóa hồ sơ: <strong>" + profileName + "</strong>?";
	    } else {
	        deleteModalBody.textContent = "Tên hồ sơ không hợp lệ.";
	    }

	    // Gán href cho nút xác nhận
	    confirmDeleteBtn.href = "/dashboard/registration/delete?id=" + profileId;
	});
</script>
<jsp:include page="../../layout/admin/footer.jsp" />