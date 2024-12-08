<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.bean.RegistrationProfile" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="./favicon.svg" type="image/svg+xml">
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="preload" as="image" href="./assets/images/hero-bg.svg">
    <link rel="preload" as="image" href="./assets/images/hero-banner-1.jpg">
    <link rel="preload" as="image" href="./assets/images/hero-banner-2.jpg">
    <link rel="preload" as="image" href="./assets/images/hero-shape-1.svg">
    <link rel="preload" as="image" href="./assets/images/hero-shape-2.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap-4-dist/css/bootstrap.min.css">

</head>
<body id="top">
<jsp:include page="layout/client/header.jsp"/>
<main>
    <article>
        <section class="section">
            <div class="container">
                <h2 class="text-center text-info mb-4"><span class="span">Danh sách các hồ sơ bạn đã đăng ký</span></h2>
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