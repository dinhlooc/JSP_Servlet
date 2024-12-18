package controller.server.course;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bean.Course;
import model.bo.CourseBO;

import java.io.IOException;


@WebServlet("/dashboard/course/create")
public class AddCourseServlet extends HttpServlet {
    private CourseBO courseBO;

    @Override
    public void init() {
        courseBO = new CourseBO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("courseId");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String description = request.getParameter("description");
        String startDate = request.getParameter("start_date");
        String endDate = request.getParameter("end_date");

        Course course = new Course(id,name, price, description, startDate, endDate);
        boolean result = courseBO.addCourse(course);

        if (result) {
            response.sendRedirect(request.getContextPath() + "/dashboard/courses");
        } else {
            request.setAttribute("error", "Failed to add course.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("course.jsp");
            dispatcher.forward(request, response);
        }
    }
}