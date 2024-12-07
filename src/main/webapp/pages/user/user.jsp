<%@ page import="model.bean.User" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../layout/admin/header.jsp" />
<jsp:include page="../../layout/admin/sidebar.jsp" />

<!-- Include Bootstrap CSS from your local folder -->
<link rel="stylesheet" href="../../css/bootstrap-4-dist/css/bootstrap.min.css">
<div class="content p-4">
    <h1 class="mb-4 text-center">User Management</h1>
    <p class="text-center mb-4">Here, you can manage all user records. You can search for users, and update or delete their information.</p>

    <!-- Search Box with 4 options -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <!-- Form tìm kiếm -->
        <form action="/dashboard/users" method="get" class="d-flex">
            <div class="mr-3">
                <input type="text" name="query" class="form-control" placeholder="Search" />
            </div>
            <div class="mr-3">
                <select name="searchBy" class="form-control">
                    <option value="id">ID</option>
                    <option value="full_name">Full Name</option>
                    <option value="email">Email</option>
                    <option value="role">Role</option>
                </select>
            </div>
            <div>
                <button class="btn btn-primary" type="submit">Search</button>
            </div>
        </form>

        <!-- Button to create new user -->
        <div>
            <button onclick="window.location.href='/dashboard/create-user'" class="btn btn-success btn-sm">Create New User</button>
        </div>
    </div>

    <!-- User Table -->
    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<User> users = (List<User>) request.getAttribute("users");
                for (User user : users) {
            %>
            <tr>
                <td><%= user.getId() %></td>
                <td><%= user.getFullName() %></td>
                <td><%= user.getEmail() %></td>
                <td><%= user.getRole() %></td>
                <td>
                    <!-- Update Button -->
                    <a href="/dashboard/update-user?id=<%= user.getId() %>" class="btn btn-warning btn-sm">Update</a>
                    <!-- Delete Button -->
                    <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteModal" data-userid="<%= user.getId() %>">Delete</button>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<!-- Delete Confirmation Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">Confirm Deletion</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this user?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <a id="deleteBtn" href="#" class="btn btn-danger">Delete</a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../../layout/admin/footer.jsp" />

<!-- Include Bootstrap JS and dependencies from your local folder -->
<script src="../../css/bootstrap-4-dist/js/bootstrap.bundle.min.js"></script>

<!-- Script to handle modal actions -->
<script>
    // Get the modal and delete button
    $('#deleteModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var userId = button.data('userid'); // Extract info from data-* attributes
        var deleteUrl = "/dashboard/delete-user?id=" + userId;

        // Set the delete button URL to the correct delete action
        var modal = $(this);
        modal.find('#deleteBtn').attr('href', deleteUrl);
    });
</script>
