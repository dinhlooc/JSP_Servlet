package controller.LoginController;

import lib.AESUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.bean.User;
import model.dao.UserDAO;

import java.io.IOException;

@WebServlet(name = "LoginServletServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private String message;
    private UserDAO userDAO;
    public void init() {
        message = "Hello World!";
        userDAO=new UserDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("pages/auth/login.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        User user = userDAO.getByEmail(email);

        if (user == null) {
            request.setAttribute("error_email", "Email invalid");
            request.getRequestDispatcher("pages/auth/login.jsp").forward(request, response);
        } else {
            if (!user.getPassword().equals(password)) {
                request.setAttribute("email",email);
                request.setAttribute("error_pass", "password incorrect");
                request.getRequestDispatcher("pages/auth/login.jsp").forward(request, response);
            } else {
                session.setAttribute("user", user);
                response.sendRedirect("/home");
            }
        }
    }

    public void destroy() {
    }
}