package controller.client.course;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bean.Course;
import model.bo.CourseBO;

import java.io.IOException;

@WebServlet("/course-detail")
public class CourseDetailServlet extends HttpServlet {
    private CourseBO courseBO;

    @Override
    public void init() {
        courseBO = new CourseBO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String courseId = request.getParameter("id");
        Course course = courseBO.getCourseById(courseId);

        if (course != null) {
            request.setAttribute("course", course);
            int studentCount = courseBO.getStudentCountByCourseId(course.getId());
            request.setAttribute("studentCount",studentCount);
            request.getRequestDispatcher("/pages/course-detail.jsp").forward(request, response);
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}