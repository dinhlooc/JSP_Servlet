package controller.client.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.bean.User;
import model.bo.UserBO;

import java.io.IOException;

@WebServlet(name = "ChangePasswordServlet", value = "/change-password")
public class ChangePassword extends HttpServlet {
    private UserBO userBO;

    @Override
    public void init() {
        userBO = new UserBO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("/login");
            return;
        }

        request.getRequestDispatcher("/pages/auth/change_password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("/login");
            return;
        }

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        boolean hasError = false;

        if (!user.getPassword().equals(currentPassword)) {
            request.setAttribute("error_currentPassword", "Mật khẩu hiện tại không chính xác!");
            hasError = true;
        }

        if (newPassword == null || newPassword.length() < 6) {
            request.setAttribute("error_newPassword", "Mật khẩu mới phải có ít nhất 6 kí tự");
            hasError = true;
        }

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error_confirmPassword", "Xác nhận mật khẩu không khớp");
            hasError = true;
        }

        if (hasError) {
            request.getRequestDispatcher("/pages/auth/change_password.jsp").forward(request, response);
            return;
        }

        try {
            user.setPassword(newPassword);
            userBO.updateUser(user);
            session.setAttribute("user", user); // Update session with new user data
            response.sendRedirect("/home");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/error");
        }
    }
}
