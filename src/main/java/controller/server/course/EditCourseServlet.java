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

@WebServlet("/courses/edit")
public class EditCourseServlet extends HttpServlet {
    private CourseBO courseBO;

    @Override
    public void init() {
        courseBO = new CourseBO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Course course = courseBO.getCourseById(id);
        if (course != null) {
            request.setAttribute("course", course);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/course/edit-course.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/courses");
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String description = request.getParameter("description");
        String startDate = request.getParameter("start_date");
        String endDate = request.getParameter("end_date");

        Course course = new Course(id,name, price, description, startDate, endDate);
        boolean result = courseBO.updateCourse(course);

        if (result) {
            response.sendRedirect(request.getContextPath() + "/courses");
        } else {
            request.setAttribute("error", "Failed to update course.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("course_edit.jsp");
            dispatcher.forward(request, response);
        }
    }
}