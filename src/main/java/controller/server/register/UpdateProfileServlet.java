package controller.server.register;

import java.io.IOException;

import java.util.List;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bean.Course;
import model.bean.RegistrationProfile;
import model.bo.CourseBO;
import model.bo.RegistrationProfileBO;

/**
 * Servlet implementation class UpdateProfileServlet
 */
@WebServlet("/dashboard/registration/update")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ServletException {
		// TODO Auto-generated method stub
		RegistrationProfile profile = new RegistrationProfile();

	    // Gán các giá trị từ request vào đối tượng profile
	    profile.setId(request.getParameter("id"));
	    profile.setFullName(request.getParameter("fullName"));
	    profile.setEmail(request.getParameter("email"));
	    profile.setPhone(request.getParameter("phone"));
	    profile.setCourseId(request.getParameter("courseId"));
	    profile.setIdCard(request.getParameter("idCard"));
	    profile.setGoals(request.getParameter("goals"));
	    profile.setStatus(request.getParameter("status"));



	    RegistrationProfileBO profileBO = new RegistrationProfileBO();
	    CourseBO courseBO= new CourseBO();
	    List<Course> courseList = courseBO.getAllCourses();

	    // Cập nhật thông tin vào database
	    boolean isUpdated = profileBO.updateRegistrationProfile(profile);

	    if (isUpdated) {
	    	Course c= courseBO.getCourseById(profile.getCourseId());
        	request.setAttribute("courseName", c);
	    	RegistrationProfile profile2 = profileBO.getRegistrationProfile(profile.getId());
	    	request.setAttribute("profile", profile2);
	    	request.setAttribute("courseList", courseList);
            request.getRequestDispatcher("/pages/registration//ProfileDetail.jsp").forward(request, response);

	    } else {

	        response.sendRedirect("ProfileDetail.jsp?id=" + profile.getId() + "&error=true");
	    }
	}

}