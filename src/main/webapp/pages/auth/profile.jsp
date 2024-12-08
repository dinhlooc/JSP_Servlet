<%@ page import="model.bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin cá nhân</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap" rel="stylesheet">

    <!-- CSS -->
    <style>

        .container-profile {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            margin: auto;
        }

        .avatar-container-profile {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 30px;
        }

        .avatar-profile {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid hsl(170, 75%, 41%);
        }

        .info-container-profile {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 700px;
            color:hsl(170, 75%, 41%);
        }
        .form-profile{
            width: 100%;
        }
        .info-container h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: hsl(170, 75%, 41%);
        }

        .input-group {
            margin-bottom: 20px;
            width: 100%;
        }

        .input-group label {
            font-size: 14px;
            color: hsl(170, 75%, 41%);
            margin-bottom: 5px;
            display: block;
            font-weight:600;
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
            border-color: hsl(170, 75%, 41%);
        }

        .change-info-btn {
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

        .change-info-btn:hover {
            background-color: #2980b9;
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
            <div class="container-profile">
                <!-- Avatar -->
                <div class="avatar-container-profile">
                    <img class="avatar-profile" src="../../assets/images/avatar.jpg" alt="Avatar">
                </div>

                <!-- Thông tin cá nhân -->
                <div class="info-container-profile">
                    <h2>Thông tin cá nhân</h2>
                    <%
                        if(session.getAttribute("user")!=null){
                            User user = (User) session.getAttribute("user");
                    %>
                    <form class="form-profile" action="/profile" method="POST" id="infoForm">
                        <input type="text" id="id"  style="display: none;" name="Id" value="<%=user.getId()%>">
                        <div class="input-group">
                            <label for="fullname">Họ và tên</label>
                            <input type="text" id="fullname" name="fullname" value="<%=user.getFullName()%>" required>
                        </div>
                        <div class="input-group">
                            <label for="email">Email</label>
                            <input type="email" readonly id="email" name="email" value="<%=user.getEmail()%>" required>
                        </div>
                        <button type="submit" class="change-info-btn">Thay đổi thông tin</button>
                    </form>
                    <%
                        }
                    %>
                </div>
            </div>
        </section>
    </article>
</main>
<jsp:include page="../../layout/client/footer.jsp"/>

</body>
</html>
