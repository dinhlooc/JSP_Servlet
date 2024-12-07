package controller.server.register;

import java.io.IOException;
import java.util.List;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bo.CourseBO;
import model.bo.RegistrationProfileBO;
import model.bean.Course;
import model.bean.RegistrationProfile;
/**
 * Servlet implementation class ProfileDetailServlet
 */
@WebServlet("/dashboard/registration/detail")
public class ProfileDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final RegistrationProfileBO registrationProfileBO;
	private CourseBO courseBO;

    public ProfileDetailServlet() {
        this.registrationProfileBO = new RegistrationProfileBO();
        courseBO = new CourseBO();
    }

    /**
     * @see HttpServlet#HttpServlet()
     */


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ServletException {
		String profileId = request.getParameter("id");
		List<Course> courseList = courseBO.getAllCourses();


        if (profileId != null && !profileId.isEmpty()) {

            RegistrationProfile profile = registrationProfileBO.getRegistrationProfile(profileId);


            if (profile != null) {
            	Course c= courseBO.getCourseById(profile.getCourseId());
            	request.setAttribute("courseName", c);
            	request.setAttribute("courseList", courseList);
                request.setAttribute("profile", profile);
                request.getRequestDispatcher("/pages/registration//ProfileDetail.jsp").forward(request, response);
            } else {

                response.sendRedirect("error.jsp");
            }
        } else {

            response.sendRedirect("error.jsp");
        }

	}

}