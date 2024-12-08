package controller.server.course;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bo.CourseBO;

import java.io.IOException;

@WebServlet("/dashboard/course/checkid")
public class CheckCourseIdServlet extends HttpServlet {
    private CourseBO courseBO;

    @Override
    public void init() throws ServletException {
        courseBO = new CourseBO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String courseId = request.getParameter("courseId");
        boolean exists = courseBO.isCourseIdExist(courseId);
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        if (exists) {
            response.getWriter().write("exists");
        } else {
            response.getWriter().write("not exists");
        }
    }
}