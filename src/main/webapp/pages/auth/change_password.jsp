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

    <!--
      - preload images
    -->

    <link rel="stylesheet" type="text/css" href="../../assets/css/style.scss">
    <style>
        .main_login {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            margin: auto;
        }
        label{
            font-weight: bold;
            color: hsl(170, 75%, 41%);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: hsl(170, 75%, 41%);
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-group label {
            font-size: 14px;
            color: #555;
            margin-bottom: 5px;
            display: block;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
            outline: none;
            transition: border-color 0.3s;
        }

        .input-group input:focus {
            border-color: #3498db;
        }

        button.login-btn {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            background-color: hsl(170, 75%, 41%);
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button.login-btn:hover {
            background-color: #2980b9;
        }

        .forgot-password {
            text-align: center;
            margin-top: 10px;

        }

        .forgot-password a {
            color: hsl(170, 75%, 41%);
            text-decoration: none;
            font-size: 14px;
        }

        .forgot-password a:hover {
            text-decoration: underline;
        }
        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }

    </style>
</head>

<body id="top">
<jsp:include page="../../layout/client/header.jsp"/>
<main>
    <article>
        <section class="section">
            <div class="main_login">
                <form action="/change-password" method="POST">
                    <h2>Thay doi mat khau</h2>

                    <!-- Email input -->
                    <div class="input-group">
                        <label for="email">Mat khau hien tai:</label>
                        <input type="password" id="email" name="currentPassword" placeholder="Nhap mat khau hien tai" required>

                        <!-- Display error message for invalid email -->
                        <%
                            String errorPassword = (String) request.getAttribute("error_currentPassword");
                            if (errorPassword != null) {
                        %>
                        <div class="error-message"><%= errorPassword %></div>
                        <%
                                request.setAttribute("error_currentPassword","");
                            }
                        %>
                    </div>

                    <!-- Password input -->
                    <div class="input-group">
                        <label for="password">Mật khẩu moi:</label>
                        <input type="password" id="password" name="newPassword" placeholder="Nhập mật khẩu moi" required>

                        <!-- Display error message for incorrect password -->
                        <%
                            String errorPass = (String) request.getAttribute("error_newPassword");
                            if (errorPass != null) {
                        %>
                        <div class="error-message"><%= errorPass %></div>
                        <%
                                request.setAttribute("error_newPassword","");
                            }
                        %>
                    </div>
                    <div class="input-group">
                        <label for="password">Xac nhan mật khẩu moi:</label>
                        <input type="password" id="password" name="confirmPassword" placeholder="Xac nhan mat khau moi"
                               required>

                        <!-- Display error message for incorrect password -->
                        <%
                            String errorPassCon = (String) request.getAttribute("error_confirmPassword");
                            if (errorPassCon != null) {
                        %>
                        <div class="error-message"><%= errorPassCon %></div>
                        <%
                                request.setAttribute("error_confirmPassword","");
                            }
                        %>
                    </div>
                    <button type="submit" class="login-btn">Doi mat khau</button>
                </form>
            </div>
        </section>
    </article>
</main>

<jsp:include page="../../layout/client/footer.jsp"/>


</body>
</html>

