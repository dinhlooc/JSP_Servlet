<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="./favicon.svg" type="image/svg+xml">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=League+Spartan:wght@400;500;600;700;800&family=Poppins:wght@400;500&display=swap" rel="stylesheet">

    <!-- Preload Images -->
    <link rel="preload" as="image" href="./assets/images/hero-bg.svg">
    <link rel="preload" as="image" href="./assets/images/hero-banner-1.jpg">

    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="./assets/css/style.scss">
    <style>
        .main_register {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            margin: auto;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: hsl(170, 75%, 41%);
        }

        label {
            font-weight: bold;
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

        button.register-btn {
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

        button.register-btn:hover {
            background-color: #2980b9;
        }

        .login-link {
            text-align: center;
            margin-top: 10px;
        }

        .login-link a {
            color: hsl(170, 75%, 41%);
            text-decoration: none;
            font-size: 14px;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }
    </style>
</head>

<body>
<jsp:include page="../../layout/client/header.jsp"/>
<main>
    <article>
        <section class="section">
            <div class="main_register">
                <form name="registerForm" action="/register" method="POST" onsubmit="return validateForm()">
                    <h2>Đăng Ký</h2>
                    <div class="input-group">
                        <label for="fullname">Họ và tên:</label>
                        <input type="text" id="fullname" name="fullname" placeholder="Nhập họ và tên của bạn" required>
                    </div>
                    <div class="input-group">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" placeholder="Nhập email của bạn" required onblur="checkEmailAvailability()">
                        <div id="emailError" class="error-message"></div>
                    </div>
                    <div class="input-group">
                        <label for="password">Mật khẩu:</label>
                        <input type="password" id="password" name="password" placeholder="Nhập mật khẩu" required>
                    </div>
                    <div class="input-group">
                        <label for="confirmPassword">Nhập lại mật khẩu:</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Nhập lại mật khẩu" required>
                        <div id="confirmPasswordError" class="error-message"></div>
                    </div>
                    <button type="submit" class="register-btn">Đăng Ký</button>
                    <div class="login-link">
                        <a href="/login">Đã có tài khoản? Đăng nhập</a>
                    </div>
                </form>
            </div>
        </section>
    </article>
</main>
<jsp:include page="../../layout/client/footer.jsp"/>

<script>
    function checkEmailAvailability() {
        var email = document.getElementById("email").value;
        var emailError = document.getElementById("emailError");

        var xhr = new XMLHttpRequest();
        xhr.open("GET", "/check-email?email=" + email, true);
        xhr.onload = function() {
            if (xhr.status === 200) {
                var response = xhr.responseText.trim();
                if (response === "exists") {
                    emailError.innerHTML = "Email đã tồn tại!";
                } else {
                    emailError.innerHTML = "";
                }
            }
        };
        xhr.send();
    }

    function validateForm() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirmPassword").value;
        var errorMessage = document.getElementById("confirmPasswordError");

        if (password !== confirmPassword) {
            errorMessage.innerHTML = "Mật khẩu không khớp!";
            return false;  // Prevent form submission
        } else {
            errorMessage.innerHTML = "";  // Clear any previous error
            return true;  // Proceed with form submission
        }
    }
</script>

</body>
</html>
