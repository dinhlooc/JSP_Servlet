<%@ page import="model.bean.Course" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../layout/admin/header.jsp" />
<jsp:include page="../../layout/admin/sidebar.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap-4-dist/css/bootstrap.min.css">
<div class="container mt-4">
    <h2>Edit Course</h2>
    <%
        Course course = (Course) request.getAttribute("course");
        if (course != null) {
    %>
    <form method="post" action="/courses/edit">
        <!-- Course ID (hidden field) -->
        <input type="hidden" name="id" value="<%= course.getId() %>" />

        <!-- Course Name -->
        <div class="row mb-3">
            <div class="col-md-12">
                <label for="courseName" class="form-label">Tên khoá học</label>
                <input type="text" class="form-control" id="courseName" name="name" value="<%= course.getName() %>" required>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-4">
                <label for="courseStartDate" class="form-label">Thời gian bắt đầu</label>
                <input type="date" class="form-control" id="courseStartDate" name="start_date" value="<%= course.getStartDate() %>" required>
                <div class="invalid-feedback" style="display: none;">Ngày bắt đầu phải là ngày trong tương lai.</div>
            </div>
            <div class="col-md-4">
                <label for="courseEndDate" class="form-label">Thời gian kết thúc</label>
                <input type="date" class="form-control" id="courseEndDate" name="end_date" value="<%= course.getEndDate() %>" required>
                <div class="invalid-feedback" style="display: none;">Ngày kết thúc phải sau ngày bắt đầu.</div>
            </div>
            <div class="col-md-4">
                <label for="coursePrice" class="form-label">Giá</label>
                <input type="text" class="form-control" id="coursePrice" name="price" value="<%= course.getPrice() %>" required>
                <div class="invalid-feedback" style="display: none;">Giá phải là một số dương.</div>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-12">
                <label for="courseDescription" class="form-label">Mô tả</label>
                <textarea class="form-control" id="courseDescription" name="description" rows="3"><%= course.getDescription() %></textarea>
            </div>
        </div>

        <!-- Submit Button -->
        <div class="text-center mt-4">
            <button type="submit" class="btn btn-success">Cập nhật</button>
            <a href="/dashboard/courses" class="btn btn-primary">Trở lại</a>
        </div>
    </form>
    <% } else { %>
    <div class="alert alert-danger mt-3">Course not found.</div>
    <% } %>
</div>
</body>



<!-- Include Bootstrap JS and dependencies from your local folder -->
<script src="../../css/bootstrap-4-dist/js/bootstrap.bundle.min.js"></script>
<script>
    function showError(fieldId, message) {
        const field = document.getElementById(fieldId);
        const errorElement = field.nextElementSibling;
        errorElement.textContent = message;
        errorElement.style.display = "block";
        field.classList.add("is-invalid");
    }

    function hideError(fieldId) {
        const field = document.getElementById(fieldId);
        const errorElement = field.nextElementSibling;
        errorElement.style.display = "none";
        field.classList.remove("is-invalid");
    }

    document.getElementById("coursePrice").addEventListener("blur", function () {
        const price = this.value.trim();
        if (price === "" || isNaN(price) || Number(price) <= 0) {
            showError("coursePrice", "Giá phải là một số dương.");
        } else {
            hideError("coursePrice");
        }
    });

    document.getElementById("courseStartDate").addEventListener("blur", function () {
        const startDate = new Date(this.value);
        const today = new Date();

        if (!this.value || startDate <= today) {
            showError("courseStartDate", "Ngày bắt đầu phải là ngày trong tương lai.");
        } else {
            hideError("courseStartDate");
        }
    });

    // Kiểm tra ngày kết thúc
    document.getElementById("courseEndDate").addEventListener("blur", function () {
        const endDate = new Date(this.value);
        const startDate = new Date(document.getElementById("courseStartDate").value);

        if (!this.value || endDate <= startDate) {
            showError("courseEndDate", "Ngày kết thúc phải sau ngày bắt đầu.");
        } else {
            hideError("courseEndDate");
        }
    });
</script>
<jsp:include page="../../layout/admin/footer.jsp" />