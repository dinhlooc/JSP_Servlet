package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bo.CourseBO;
import model.bean.Course;

import java.io.IOException;
import java.util.List;


/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/courses-search")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CourseBO courseBO;

    public SearchServlet() {
        super();
        courseBO = new CourseBO();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ServletException {

        String keyword = request.getParameter("keyword");
        int number = 0;
        List<Course> courses;


        if (keyword == null || keyword.trim().isEmpty()) {
            courses = courseBO.getAllCourses();
        } else {
            courses = courseBO.searchCourses(keyword);
        }


        for (Course course : courses) {
            int studentCount = courseBO.getStudentCountByCourseId(course.getId());
            request.setAttribute("studentCount_" + course.getId(), studentCount);
            number++;
        }


        request.setAttribute("courses", courses);
        request.setAttribute("keyword", keyword);
        request.setAttribute("number", number);

        // Chuyển tiếp đến trang Search.jsp
        request.getRequestDispatcher("/Search.jsp").forward(request, response);
    }


    /**
     * Xử lý yêu cầu POST (nếu có)
     */

}