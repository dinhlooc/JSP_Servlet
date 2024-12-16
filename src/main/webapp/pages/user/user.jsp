<%@ page import="model.bean.User" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../layout/admin/header.jsp" />
<jsp:include page="../../layout/admin/sidebar.jsp" />
<!-- Include Bootstrap CSS from your local folder -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap-4-dist/css/bootstrap.min.css">
<div class="content p-4">
    <h1 class="mb-4 text-center">Quản lý người dùng</h1>
    <p class="text-center mb-4">Tại đây, bạn có thể quản lý tất cả các hồ sơ người dùng. Bạn có thể tìm kiếm người dùng và cập nhật hoặc xóa thông tin của họ.</p>
    <%
        String query = request.getParameter("query") != null ? request.getParameter("query") : "";
        String searchBy = request.getParameter("searchBy") != null ? request.getParameter("searchBy") : "";
    %>
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <button onclick="window.location.href='/dashboard/user/create'" class="btn btn-success btn-sm">Tạo người dùng mới</button>
        </div>
        <form action="/dashboard/users" method="get" class="d-flex">
            <div class="mr-3">
                <input type="text" name="query" class="form-control" placeholder="Search" value="<%= query %>" />
            </div>
            <div class="mr-3">
                <select name="searchBy" class="form-control">
                    <option value="id" <%= "id".equals(searchBy) ? "selected" : "" %>>ID</option>
                    <option value="full_name" <%= "full_name".equals(searchBy) ? "selected" : "" %>>Tên</option>
                    <option value="email" <%= "email".equals(searchBy) ? "selected" : "" %>>Email</option>
                    <option value="role" <%= "role".equals(searchBy) ? "selected" : "" %>>Quyền</option>
                </select>
            </div>
            <div>
                <button class="btn btn-primary" type="submit">Tìm kiếm</button>
            </div>
        </form>

    </div>
    <!-- User Table -->
    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Họ tên</th>
                <th>Email</th>
                <th>Quyền</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<User> users = (List<User>) request.getAttribute("users");
                if (users == null || users.isEmpty()) {
            %>
            <tr>
                <td colspan="5" class="text-center">Không có người dùng</td>
            </tr>
            <%
            } else {
                for (User user : users) {
            %>
            <tr>
                <td><%= user.getId() %></td>
                <td><%= user.getFullName() %></td>
                <td><%= user.getEmail() %></td>
                <td><%= user.getRole() %></td>
                <td>
                    <!-- Update Button -->
                    <a href="/dashboard/user/update?id=<%= user.getId() %>" class="btn btn-warning btn-sm">Cập nhật
                    </a>
                    <!-- Delete Button -->
                    <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteModal" data-userid="<%= user.getId() %>">Xóa</button>
                </td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>
</div>
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">Xác nhận xóa</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Bạn thực sự muốn xóa người dùng
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                <a id="deleteBtn" href="#" class="btn btn-danger">Xóa</a>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../../layout/admin/footer.jsp" />
<script src="../../assets/js/jquery-3.6.0.min.js"></script>
<script src="../../assets/bootstrap-4-dist/js/bootstrap.bundle.js"></script>
<script>
    $('#deleteModal').on('show.bs.modal', function (event) {
        let button = $(event.relatedTarget);
        let userId = button.data('userid');
        let deleteUrl = "/dashboard/user/delete?id=" + userId;
        let modal = $(this);
        modal.find('#deleteBtn').attr('href', deleteUrl);
    });
</script>