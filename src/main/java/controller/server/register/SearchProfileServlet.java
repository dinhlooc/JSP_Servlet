package controller.server.register;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bo.RegistrationProfileBO;
import model.bean.RegistrationProfile;

import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class SearchProfileServlet
 */
@WebServlet("/dashboard/registrations/searchs")
public class SearchProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private RegistrationProfileBO profileBO;

    public SearchProfileServlet() {
        super();
        profileBO = new RegistrationProfileBO();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query"); // Lấy từ request
        System.out.println(query);
        if (query != null && !query.isEmpty()) {
            List<RegistrationProfile> profiles = profileBO.SearchProfileBO(query); // Gọi BO để tìm kiếm
            request.setAttribute("profiles", profiles); // Đưa danh sách kết quả vào request
        }
        request.getRequestDispatcher("/pages/registration/registration.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}