package controller.LoginController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lib.AESUtil;
import model.bean.User;
import model.dao.UserDAO;

import java.io.IOException;

@WebServlet(name = "LoginServletServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private String message;
    private UserDAO userDAO;
    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("pages/auth/login.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("Email");
        String password = request.getParameter("Password");

        HttpSession session = request.getSession();
        User user = userDAO.getByEmail(email);
        if (user == null) {
            request.setAttribute("error", "username invalid");
            request.getRequestDispatcher("pages/auth/login.jsp").forward(request, response);
        } else {
            String pass = "";
            try {
                pass = AESUtil.decrypt(user.getPassword());
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            if (!pass.equals(password)) {
                request.setAttribute("error", "password incorrect");
                request.getRequestDispatcher("pages/auth/login.jsp").forward(request, response);
            } else {
                session.setAttribute("user", user);
                response.sendRedirect("/");
            }
        }
    }

    public void destroy() {
    }
}