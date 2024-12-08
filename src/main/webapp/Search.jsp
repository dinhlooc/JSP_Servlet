<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="model.bean.Course" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--
      - primary meta tag
    -->
    <title>search</title>
    <meta name="title" content="EduWeb - The Best Program to Enroll for Exchange">
    <meta name="description" content="This is an education html template made by codewithsadee">

    <!--
      - favicon
    -->
    <link rel="shortcut icon" href="./favicon.svg" type="image/svg+xml">

    <!--
      - custom css link
    -->
    <link rel="stylesheet" type="text/css" href="./assets/css/style.scss">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap-4-dist/css/bootstrap.min.css">
    <!--
      - google font link
    -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=League+Spartan:wght@400;500;600;700;800&family=Poppins:wght@400;500&display=swap"
            rel="stylesheet">

    <!--
      - preload images
    -->
    <link rel="preload" as="image" href="./assets/images/hero-bg.svg">
    <link rel="preload" as="image" href="./assets/images/hero-banner-1.jpg">
    <link rel="preload" as="image" href="./assets/images/hero-banner-2.jpg">
    <link rel="preload" as="image" href="./assets/images/hero-shape-1.svg">
    <link rel="preload" as="image" href="./assets/images/hero-shape-2.png">
    <link rel="stylesheet" type="text/css" href="./assets/css/style.scss">


</head>
<body id="top">
<jsp:include page="layout/client/header.jsp"/>
<main>
    <article>
        <%
            String keyword = (String) request.getAttribute("keyword");
            List<Course> courses = (List<Course>) request.getAttribute("courses");
            int number = (int) request.getAttribute("number");
        %>
        <section class="section course" id="courses" aria-label="course">
            <div class="container">
                <!-- Form tìm kiếm -->
                <div class="row justify-content-center mb-4">
                    <div class="col-md-8">
                        <form action="/courses-search" method="GET" class="form-inline">
                            <div class="input-group input-group-lg w-100">
                                <input
                                        name="keyword"
                                        type="text"
                                        class="form-control"
                                        placeholder="Tìm kiếm khóa học"
                                        aria-label="Tìm kiếm khóa học"
                                        value="<%= keyword != null ? keyword : "" %>"
                                >
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="submit">
                                        <i class="fas fa-search"></i> Tìm kiếm
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Kết quả tìm kiếm -->
                <%
                    if (keyword != null && !keyword.isEmpty()) {
                %>
                <p class="section-subtitle text-center">Kết quả tìm kiếm</p>
                <h2 class="h2 section-title text-center">
                    Có <%= number %> kết quả tìm kiếm cho từ khóa "<%= keyword %>"
                </h2>
                <%
                    }
                %>

                <!-- Danh sách khóa học -->
                <ul class="grid-list">
                    <%
                        if (courses != null && !courses.isEmpty()) {
                            for (Course course : courses) {
                                Integer studentCount = (Integer) request.getAttribute("studentCount_" + course.getId());
                    %>
                    <li>
                        <div class="course-card">
                            <figure class="card-banner img-holder" style="--width: 370; --height: 220;">
                                <img src="./assets/images/day-mon-tieng-anh.jpg" width="370" height="220" loading="lazy" alt="<%= course.getName() %>" class="img-cover">
                            </figure>

                            <div class="abs-badge">
                                <ion-icon name="time-outline" aria-hidden="true"></ion-icon>
                                <span class="span"><%= course.getStartDate() %> - <%= course.getEndDate() %></span>
                            </div>

                            <div class="card-content">
                                <h3 class="h3">
                                    <span class="badge">Beginner</span>
                                    <a href="course-detail?id=<%= course.getId() %>" class="card-title"><%= course.getName() %></a>
                                </h3>

                                <div class="wrapper">
                                    <div class="rating-wrapper">
                                        <ion-icon name="star"></ion-icon>
                                        <ion-icon name="star"></ion-icon>
                                        <ion-icon name="star"></ion-icon>
                                        <ion-icon name="star"></ion-icon>
                                        <ion-icon name="star"></ion-icon>
                                    </div>
                                    <p class="rating-text">(5.0/5 Đánh giá)</p>
                                </div>

                                <data class="price" value="<%= course.getPrice() %>"><%= course.getPrice() %> đ</data>

                                <ul class="card-meta-list">
                                    <li class="card-meta-item">
                                        <ion-icon name="people-outline" aria-hidden="true"></ion-icon>
                                        <span class="span"><%= studentCount != null ? studentCount : 0 %> Học viên</span>
                                    </li>
                                </ul>

                                <!-- Nút đăng ký -->

                            </div>
                        </div>
                    </li>
                    <%
                        }
                    } else {
                    %>
                    <p>Không tìm thấy khóa học nào.</p>
                    <%
                        }
                    %>
                </ul>
            </div>
        </section>
    </article>
</main>


<jsp:include page="layout/client/footer.jsp"/>
  <a href="#top" class="back-top-btn" aria-label="back top top" data-back-top-btn>
    <ion-icon name="chevron-up" aria-hidden="true"></ion-icon>
</a>





<!--
  - custom js link
-->
<script src="./assets/js/script.js" defer></script>

<!--
  - ionicon link
-->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>