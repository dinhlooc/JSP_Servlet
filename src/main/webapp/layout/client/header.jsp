<%@ page import="model.bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
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


    <!--
      - google font link
    -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=League+Spartan:wght@400;500;600;700;800&family=Poppins:wght@400;500&display=swap"
            rel="stylesheet">


    <link rel="stylesheet" type="text/css" href="../../assets/css/style.scss">
</head>

<body>

<header class="header" data-header>
    <div class="container">
        <a href="#" class="logo">
            <img src="../../assets/images/logo.svg" width="162" height="50" alt="EduWeb logo">
        </a>

        <nav class="navbar" data-navbar>
            <div class="wrapper">
                <a href="/home" class="logo">
                    <img src="../../assets/images/logo.svg" width="162" height="50" alt="EduWeb logo">
                </a>
                <button class="nav-close-btn" aria-label="close menu" data-nav-toggler>
                    <ion-icon name="close-outline" aria-hidden="true"></ion-icon>
                </button>
            </div>

            <ul class="navbar-list">
                <li class="navbar-item">
                    <a href="/home" class="navbar-link" data-nav-link>Trang chủ</a>
                </li>
                <li class="navbar-item">
                    <a href="#about" class="navbar-link" data-nav-link>Về chúng tôi</a>
                </li>
                <li class="navbar-item">
                    <a href="#courses" class="navbar-link" data-nav-link>Khoá học</a>
                </li>
                <li class="navbar-item">
                    <a href="#blog" class="navbar-link" data-nav-link>Blog</a>
                </li>
            </ul>
        </nav>

        <div class="header-actions">
            <button class="header-action-btn" aria-label="toggle search" title="Search">
                <ion-icon name="search-outline" aria-hidden="true"></ion-icon>
            </button>

            <!-- Check session to display Avatar with popup or Login/Register -->
            <%
                User user = (User) session.getAttribute("user");

                if (user != null) {
            %>
            <!-- Avatar with Popup -->
            <div class="avatar-menu">
                <img src="../../assets/images/avatar.jpg"
                     alt="User Avatar" class="avatar">
                <div class="popup-menu">
                    <%
                        if(user.getRole().equalsIgnoreCase("ADMIN")){
                    %>
                    <a href="/dashboard/users" class="menu-item">Dashboard</a>
                    <%
                        }
                    %>
                    <a href="/profile" class="menu-item">Xem thong tin ca nhan</a>
                    <a href="/change-password" class="menu-item">Doi mat khau</a>
                    <a href="/logout" class="menu-item">Dang xuat</a>
                </div>
            </div>
            <%
            } else {
            %>
            <!-- Login/Register button -->
            <a href="/login" class="btn has-before">
                <span class="span">Đăng nhập/Đăng ký</span>
                <ion-icon name="arrow-forward-outline" aria-hidden="true"></ion-icon>
            </a>
            <%
                }
            %>

            <button class="header-action-btn" aria-label="open menu" data-nav-toggler>
                <ion-icon name="menu-outline" aria-hidden="true"></ion-icon>
            </button>
        </div>

        <div class="overlay" data-nav-toggler data-overlay></div>
    </div>
</header>
</body>
</html>
