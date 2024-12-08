package controller.LoginController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bean.User;
import model.dao.UserDAO;

import java.io.IOException;

@WebServlet(name = "CheckEmailServlet", value = "/check-email")
public class CheckEmail extends HttpServlet {

    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        User user = userDAO.getByEmail(email);

        if (user != null) {
            response.getWriter().write("exists");
        } else {
            response.getWriter().write("available");
        }
    }
}

