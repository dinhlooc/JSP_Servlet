<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.bean.RegistrationProfile" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--
      - primary meta tag
    -->
    <title>IT English</title>
    <meta name="title" content="EduWeb - The Best Program to Enroll for Exchange">
    <meta name="description" content="This is an education html template made by codewithsadee">

    <!--
      - favicon
    -->
    <link rel="shortcut icon" href="./favicon.svg" type="image/svg+xml">

    <!--
      - custom css link
    -->
    <link rel="stylesheet" href="./assets/css/style.css">

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
    <style type="text/css">



    <style>
    .form-container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh; /* Căn giữa theo chiều dọc */
    }

    form {
        display: flex;
        align-items: center;
        gap: 10px; /* Khoảng cách giữa input và button */
    }

    .form-control {
        width: 250px; /* Tùy chỉnh chiều rộng của ô input */
    }
</style>


</head>
<body id="top">
<jsp:include page="layout/client/header.jsp"/>
<main>

    <div class="container mt-5">



        <div class="row mb-4 align-items-center justify-content-center">




        <table class="table custom-table table__users  " >
            <thead class="table-dark">
                <tr>
                    <th>Họ tên</th>
                    <th>Số điện thoại</th>
                    <th>Email</th>
                    <th>Mã khóa học</th>
                    <th>Mã người đăng ký</th>
                    <th>Trạng thái</th>

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