<%@ page import="model.bean.Course" %>
<%@ page import="java.util.List" %>
<%@ page import="model.bean.RegistrationProfile" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    Course course = (Course) request.getAttribute("course");
    String iduser = (String) request.getAttribute("userId");
    List<RegistrationProfile> profiles = (List<RegistrationProfile>) request.getAttribute("profiles");
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
                                <%
                                    boolean isRegistered = false;
                                    if(profiles!=null){
                                        for (RegistrationProfile profile : profiles) {
                                            if (profile.getUserId().equals(iduser) && profile.getCourseId().equals(course.getId())) {
                                                isRegistered = true;
                                                break;
                                            }
                                        }

                                    }

                                %>
                                <form action="/course-detail" method="POST" id="registrationForm">
                                    <input type="text" id="courseId" name="courseId" value="<%=course.getId() %>" hidden>
                                    <input type="text" id="status" name="status" value="active" hidden>

                                    <div class="container mt-4">

                                        <!-- Họ và Tên + Sinh Viên -->
                                        <div class="row mb-4">
                                            <div class="col-md-8">
                                                <label for="fullName" class="form-label">Họ và Tên:</label>
                                                <input type="text" class="form-control form-control-lg" id="fullName" name="fullName" required>
                                            </div>
                                            <div class="col-md-4 d-flex align-items-center">
                                                <div>
                                                    <label for="isStudent" class="form-label mr-2">Sinh Viên:</label>
                                                    <input type="checkbox" class="form-check-input" id="isStudent" name="isStudent">
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Ngày sinh + Điện thoại -->
                                        <div class="row mb-4">
                                            <div class="col-md-6">
                                                <label for="birthDate" class="form-label">Ngày sinh:</label>
                                                <input type="date" class="form-control form-control-lg" id="birthDate" name="birthDate" required>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="phone" class="form-label">Điện thoại:</label>
                                                <input type="text" class="form-control form-control-lg" id="phone" name="phone" required>
                                            </div>
                                        </div>

                                        <!-- Email -->
                                        <div class="row mb-4">
                                            <div class="col-md-12">
                                                <label for="email" class="form-label">Email:</label>
                                                <input type="email" class="form-control form-control-lg" id="email" name="email" required>
                                            </div>
                                        </div>

                                        <!-- CCCD -->
                                        <div class="row mb-4">
                                            <div class="col-md-12">
                                                <label for="idCard" class="form-label">CCCD:</label>
                                                <input type="text" class="form-control form-control-lg" id="idCard" name="idCard" required>
                                            </div>
                                        </div>

                                        <!-- Mục tiêu -->
                                        <div class="row mb-4">
                                            <div class="col-md-12">
                                                <label for="goals" class="form-label">Mục tiêu:</label>
                                                <input type="text" class="form-control form-control-lg" id="goals" name="goals">
                                            </div>
                                        </div>


                                        <% if (!isRegistered) { %>
                                        <button type="submit" class="btn btn-primary btn-sm w-90" style="margin:auto">Đăng ký</button>
                                        <% } else { %>
                                        <p class="text-success">Bạn đã đăng ký khóa học này!</p>
                                        <% } %>

                                    </div>
                                </form>
                                <script>
                                    document.getElementById("registrationForm").addEventListener("submit", function (e) {
                                        const isUserLoggedIn = <%= (session.getAttribute("user") != null) ? "true" : "false" %>;
                                        if (!isUserLoggedIn) {
                                            e.preventDefault();
                                            alert("Bạn cần đăng nhập để thực hiện đăng ký.");
                                            window.location.href = "/login";
                                        }
                                    });
                                </script>
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