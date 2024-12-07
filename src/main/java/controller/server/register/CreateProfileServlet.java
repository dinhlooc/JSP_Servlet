package controller.server.register;

import java.io.IOException;
import java.util.UUID;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bean.RegistrationProfile;
import model.bo.RegistrationProfileBO;
/**
 * Servlet implementation class CreateProfileServlet
 */
@WebServlet("/dashboard/registration/create")
public class CreateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RegistrationProfileBO profileBO;
	public void init() {
        profileBO = new RegistrationProfileBO();
    }

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = UUID.randomUUID().toString();
        String fullName = request.getParameter("fullName");
        String birthDate = request.getParameter("birthDate");
        String courseId = request.getParameter("courseId");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String idCard = request.getParameter("idCard");
        boolean isStudent = Boolean.parseBoolean(request.getParameter("isStudent"));
        String goals = request.getParameter("goals");
        String userId = request.getParameter("userId");
        String status = request.getParameter("status");

        RegistrationProfile profile = new RegistrationProfile();
        profile.setId(id);
        profile.setFullName(fullName);
        profile.setBirthDate(java.sql.Date.valueOf(birthDate));
        profile.setCourseId(courseId);
        profile.setEmail(email);
        profile.setPhone(phone);
        profile.setIdCard(idCard);
        profile.setStudent(isStudent);
        profile.setGoals(goals);
        profile.setUserId(userId);
        profile.setStatus(status);

        boolean result = profileBO.addRegistrationProfile(profile);
        if (result) {
            response.sendRedirect("GetAllProfile");
        } else {
            response.sendRedirect("error.jsp");
        }
	}
	public void destroy() {
    }

}