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

@WebServlet(name = "UpdateProfileServlet", value = "/profile")
public class UpdateProfile extends HttpServlet {
    private String message;
    private UserBO userBO;
    public void init() {
        message = "Hello World!";
        userBO=new UserBO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session=request.getSession();
        User user=(User) session.getAttribute("user");
        request.getRequestDispatcher("/pages/auth/profile.jsp").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("Id");
        String fullName = request.getParameter("fullname");
        User user=userBO.getUserById(id);
        if (user==null){
            response.sendRedirect("/profile");
        }
        try {
            user.setFullName(fullName);
            userBO.updateUser(user);
            HttpSession session=request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("/profile");
        } catch (Exception e) {
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
            e.printStackTrace();
        }

    }

    public void destroy() {
    }
}