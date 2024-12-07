package controller.client.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bean.User;
import model.bo.UserBO;

import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "CreateUserServlet", value = "/dashboard/create-user")
public class CreateUser extends HttpServlet {
    private String message;
    private UserBO userBO;

    public void init() {
        userBO = new UserBO();
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/pages/user/add-user.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String fullName = request.getParameter("Fullname");
        String email = request.getParameter("Email");
        String password = request.getParameter("Password");
        String role = request.getParameter("Role");


        User userExisted = userBO.getUserByEmail(email);
        if (userExisted != null) {
            response.sendRedirect("/dashboard/users");
        } else {
            try {
                String id = UUID.randomUUID().toString();
                User user = new User(id,fullName,email,password,role);
                userBO.createUser(user);
                response.sendRedirect("/dashboard/users");
            } catch (Exception e) {
                request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
                e.printStackTrace();
            }
        }


    }

    public void destroy() {
    }
}