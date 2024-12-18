<%@ page import="model.bean.Course" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../layout/admin/header.jsp" />
<jsp:include page="../../layout/admin/sidebar.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap-4-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap-5.3.3-dist/js/bootstrap.bundle.js">
<style>
    .btn:hover {
        opacity: 0.9;
    }

    .table thead th {
        vertical-align: middle;
    }

    .modal-header {
        border-bottom: 2px solid #dee2e6;
    }

</style>
<div class="content p-4">
    <h1 class="mb-4 text-center">Quản lý các khoá học</h1>
    <div class="d-flex justify-content-between align-items-center mt-3 mb-3">
        <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#createModal">Thêm khoá học mới</button>

        <form method="get" action="" class="input-group" style="width: 50%;">
            <input type="search" id="searchInput" name="search" class="form-control"
                   value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>"
                   placeholder="Tìm kiếm khoá học" />
            <button type="submit" class="btn btn-primary">
                Tìm kiếm
            </button>
        </form>
    </div>

    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
            <tr>
                <th scope="col">Mã khoá học</th>
                <th scope="col">Tên</th>
                <th scope="col">Giá</th>
                <th scope="col">Thời gian bắt đầu</th>
                <th scope="col">Thời gian kết thúc</th>
                <th scope="col">Hành động</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Course> courses = (List<Course>) request.getAttribute("courseList");
                if (courses != null) {
                    for (Course course : courses) {
            %>
            <tr>
                <td class="text-wrap"><%= course.getId() %></td>
                <td class="text-wrap"><%= course.getName() %></td>
                <td><%= course.getPrice() %></td>
                <td><%= new java.text.SimpleDateFormat("dd/MM/yyyy").format(course.getStartDate()) %></td>
                <td><%= new java.text.SimpleDateFormat("dd/MM/yyyy").format(course.getEndDate()) %></td>
                <td class="text-center">
                    <div class="d-flex  justify-content-center">
                        <a href="/dashboard/course/update?id=<%= course.getId() %>" class="btn btn-warning btn-sm mr-2 mb-2">
                            Sửa
                        </a>
                        <a href="/dashboard/course/delete?id=<%= course.getId() %>" class="btn btn-danger btn-sm mr-2 mb-2"
                           onclick="return confirm('Bạn muốn xoá khoá học này?');">
                            Xoá
                        </a>
                        <a href="/dashboard/course/view?id=<%= course.getId() %>" class="btn btn-info btn-sm mb-2">
                            Xem
                        </a>
                    </div>
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
<div class="modal fade" id="createModal" tabindex="-1" aria-labelledby="createModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="createModalLabel">Thêm khoá học mới</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="/dashboard/course/create">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="courseId" class="form-label">Mã khoá học</label>
                            <input type="text" class="form-control" id="courseId" name="courseId" required onblur="checkCourseIdExistence()">
                            <div id="courseIdError" class="invalid-feedback" style="display: none;"></div>
                        </div>
                        <div class="col-md-6">
                            <label for="coursePrice" class="form-label">Giá</label>
                            <input type="text" class="form-control" id="coursePrice" name="price" required>
                            <div class="invalid-feedback" style="display: none;">Giá phải là một số dương.</div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-12">
                            <label for="courseName" class="form-label">Tên khoá học</label>
                            <input type="text" class="form-control" id="courseName" name="name" required>
                        </div>

                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="courseStartDate" class="form-label">Thời gian bắt đầu</label>
                            <input type="date" class="form-control" id="courseStartDate" name="start_date" required>
                            <div class="invalid-feedback" style="display: none;">Ngày bắt đầu phải là ngày trong tương lai.</div>
                        </div>
                        <div class="col-md-6">
                            <label for="courseEndDate" class="form-label">Thời gian kết thúc</label>
                            <input type="date" class="form-control" id="courseEndDate" name="end_date">
                            <div class="invalid-feedback" style="display: none;">Ngày kết thúc phải sau ngày bắt đầu.</div>
                        </div>
                    </div>
                    <div class="row mb-6">
                        <div class="col-md-12">
                            <label for="courseDescription" class="form-label">Mô tả</label>
                            <textarea class="form-control" id="courseDescription" name="description" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-success">
                            <i class="bi bi-plus-circle"></i> Thêm khoá học
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Include Bootstrap JS and dependencies from your local folder -->
<script src="${pageContext.request.contextPath}/assets/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>

<script>
    function checkCourseIdExistence() {
        var courseId = document.getElementById("courseId").value;

        if (courseId.trim() === "") {
            return;
        }
        fetch('/dashboard/course/checkid?courseId=' + encodeURIComponent(courseId))
            .then(response => response.text())
            .then(data => {
                var errorElement = document.getElementById("courseIdError");

                if (data === "exists") {
                    errorElement.style.display = "block";
                    errorElement.textContent = "Mã khoá học đã tồn tại";
                    document.getElementById("courseId").classList.add("is-invalid");
                } else {
                    errorElement.style.display = "none";
                    document.getElementById("courseId").classList.remove("is-invalid");
                }
            })
            .catch(error => {
                console.error('Error checking course ID:', error);
            });
    }
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