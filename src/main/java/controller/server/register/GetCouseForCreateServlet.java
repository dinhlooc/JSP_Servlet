package controller.server.register;

import java.io.IOException;
import java.util.List;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bo.CourseBO;
import model.bean.Course;
/**
 * Servlet implementation class GetCouseForCreateServlet
 */
@WebServlet("/dashboard/")
public class GetCouseForCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CourseBO courseBO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetCouseForCreateServlet() {
        super();
        courseBO = new CourseBO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response)
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
		List<Course> courseList = courseBO.getAllCourses();

        // Thêm danh sách khóa học vào request
        request.setAttribute("courseList", courseList);

        // Chuyển hướng tới trang CreateRegistration.jsp
        request.getRequestDispatcher("/pages/registration/CreateRegistration.jsp").forward(request, response);

	}

}