package controller.client.user;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.bean.User;
import model.bo.RegistrationProfileBO;
import java.util.List;
import model.bean.RegistrationProfile;

/**
 * Servlet implementation class RegistrationUserServlet
 */
@WebServlet("/registered")
public class RegistrationUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private RegistrationProfileBO registrationProfileBO;

    public RegistrationUserServlet() {
        super();
        registrationProfileBO = new RegistrationProfileBO();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user=(User) session.getAttribute("user");
        String userId = user.getId();

        if (userId != null && !userId.isEmpty()) {

            List<RegistrationProfile> profiles = registrationProfileBO.getRegistrationProfilesByUserIdBO(userId);


            request.setAttribute("profiles", profiles);


            request.getRequestDispatcher("/RegistrationUser.jsp").forward(request, response);
        } else {
            response.getWriter().append("User ID is required.");
        }
    }



}