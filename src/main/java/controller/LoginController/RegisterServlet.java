package controller.LoginController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bean.User;
import model.dao.UserDAO;

import java.io.IOException;

@WebServlet(name = "RegisterServletServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    private String message;
    private UserDAO userDAO;

    public void init() {
        message = "Hello World!";
        userDAO = new UserDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("Sing_up/index.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("Fullname");
        String email = request.getParameter("Email");
        String password = request.getParameter("Password");

        if(userDAO.getByEmail(email) != null){
            request.setAttribute("error", "Email already exists");
            request.getRequestDispatcher("pages/auth/register.jsp").forward(request, response);
        }else{
            User user=new User();
            user.setEmail(email);
            user.setFullName(name);
            user.setPassword(password);
            user.setRole("USER");
            userDAO.create(user);
            response.sendRedirect("/login");
        }


        response.sendRedirect("/home");
    }

    public void destroy() {
    }
}