package controller.server.course;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bo.CourseBO;

import java.io.IOException;

@WebServlet("/dashboard/course/delete")
public class DeleteCourseServlet extends HttpServlet {
    private CourseBO courseBO;

    @Override
    public void init() {
        courseBO = new CourseBO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        if (id != null && !id.trim().isEmpty()) {
            boolean result = courseBO.deleteCourse(id);

            if (result) {
                response.sendRedirect(request.getContextPath() + "/dashboard/courses");
            } else {
                request.setAttribute("error", "Failed to delete the course.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/dashboard/courses");
                dispatcher.forward(request, response);
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/courses");
        }
    }
}