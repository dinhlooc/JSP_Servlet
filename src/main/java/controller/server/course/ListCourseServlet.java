package controller.server.course;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bo.CourseBO;
import model.bean.Course;
import java.io.IOException;
import java.util.List;

@WebServlet("/courses")
public class ListCourseServlet extends HttpServlet {
    private CourseBO courseBO;

    @Override
    public void init() {
        courseBO = new CourseBO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        List<Course> courses;

        if (search != null && !search.trim().isEmpty()) {
            courses = courseBO.searchCourses(search);
        } else {
            courses = courseBO.getAllCourses();
        }
        request.setAttribute("courseList", courses);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/course/course-management.jsp");
        dispatcher.forward(request, response);
    }
}