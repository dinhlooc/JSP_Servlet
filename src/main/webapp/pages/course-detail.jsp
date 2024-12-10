<%@ page import="model.bean.Course" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    Course course = (Course) request.getAttribute("course");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap-4-dist/css/bootstrap.min.css">

</head>

<body id="top">

<!--
  - #HEADER
-->

<jsp:include page="../layout/client/header.jsp"/>
<main>
    <article>
        <section class="section course" id="courses" aria-label="course">
            <div class="container mt-2">
                <div class="row">
                    <div class="col-md-7">
                        <figure class="mb-4">
                            <img src="../assets/images/unnamed.jpg"
                                 alt="<%= course.getName() %>"
                                 class="img-fluid rounded">
                        </figure>
                        <h2 class="display-4 mb-4 h2 section-title"><%= course.getName() %></h2>
                        <p class="section-subtitle lead">Mô tả:</p>
                        <p class="section-text"><%= course.getDescription() %></p>

                        <ul class="list-group">
                            <li class="list-group-item">
                                <strong>Học phí:</strong> <%= course.getPrice() %> đ
                            </li>
                            <li class="list-group-item">
                                <strong>Thời gian:</strong> <%= course.getStartDate() %> - <%= course.getEndDate() %>
                            </li>
                            <li class="list-group-item">
                                <strong>Học viên đã đăng ký:</strong> <%= request.getAttribute("studentCount") %> học viên
                            </li>
                        </ul>

                    </div>

                    <!-- Phần form đăng ký -->
                    <div class="col-md-5">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title">Đăng ký khóa học</h3>
                                <form action="/course-detail" method="POST">
                                    <input type="text" id="courseId" name="courseId" value="<%=course.getId() %>" hidden>
                                    <input type="text" id="status" name="status" value="active" hidden>

                                    <div class="container mt-4">

                                        <div class="row mb-3">
                                            <div class="col-md-8">
                                                <label for="fullName" class="form-label">Họ và Tên:</label>
                                                <input type="text" class="form-control" id="fullName" name="fullName" required>
                                            </div>
                                            <div class="col-md-4 ">
                                                <label for="isStudent" class="form-label mr-2">Sinh Viên:</label>
                                                <input type="checkbox" class="form-check-input" id="isStudent" name="isStudent">
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-md-6">
                                                <label for="birthDate" class="form-label">Ngày sinh:</label>
                                                <input type="date" class="form-control form-control-sm" id="birthDate" name="birthDate" required>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="phone" class="form-label">Điện thoại:</label>
                                                <input type="text" class="form-control" id="phone" name="phone" required>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-md-12">
                                                <label for="email" class="form-label">Email:</label>
                                                <input type="email" class="form-control" id="email" name="email" required>
                                            </div>
                                        </div>

                                        <!-- Hàng cho CCCD và Mục tiêu -->
                                        <div class="row mb-3">
                                            <div class="col-md-12">
                                                <label for="idCard" class="form-label">CCCD:</label>
                                                <input type="text" class="form-control" id="idCard" name="idCard" required>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-md-12">
                                                <label for="goals" class="form-label">Mục tiêu:</label>
                                                <input type="text" class="form-control" id="goals" name="goals">
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-sm w-90 " style="margin:auto">Đăng ký</button>

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </article>
</main>

<!--
  - #FOOTER
-->

<jsp:include page="../layout/client/footer.jsp"/>

<!--
  - #BACK TO TOP
-->

<a href="#top" class="back-top-btn" aria-label="back top top" data-back-top-btn>
    <ion-icon name="chevron-up" aria-hidden="true"></ion-icon>
</a>

<!--
  - custom js link
-->
<script src="./assets/js/script.js" defer></script>
<script src="${pageContext.request.contextPath}/assets/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>