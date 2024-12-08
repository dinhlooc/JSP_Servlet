package controller.LoginController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bean.User;
import model.dao.UserDAO;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "RegisterServletServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    private String message;
    private UserDAO userDAO;

    public void init() {
        message = "Hello World!";
        userDAO = new UserDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/pages/auth/register.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if(userDAO.getByEmail(email) != null){
            request.setAttribute("error", "Email already exists");
            request.getRequestDispatcher("pages/auth/register.jsp").forward(request, response);
        }else{
            String id = UUID.randomUUID().toString();
            User user=new User();
            user.setId(id);
            user.setEmail(email);
            user.setFullName(name);
            user.setPassword(password);
            user.setRole("USER");
            userDAO.create(user);
            response.sendRedirect("/login");
        }
    }

    public void destroy() {
    }
}