package controller.server.register;

import java.io.IOException;
import java.util.List;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bean.RegistrationProfile;
import model.bo.RegistrationProfileBO;

/**
 * Servlet implementation class GetAllProfile
 */
@WebServlet(name = "GetAllProfile",value = "/dashboard/registrations")
public class GetAllProfile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private RegistrationProfileBO profileBO;

    @Override
    public void init() throws ServletException {
        profileBO = new RegistrationProfileBO();
    }

    public GetAllProfile() {
        super();
    }

    /**
     * @see HttpServlet#doGet(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 try {

             List<RegistrationProfile> profiles = profileBO.getAllRegistrationProfiles();


             request.setAttribute("profiles", profiles);


             request.getRequestDispatcher("/pages/registration/registration.jsp").forward(request, response);

         } catch (Exception e) {
             e.printStackTrace();
             response.sendRedirect("error.jsp");
         }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */

}