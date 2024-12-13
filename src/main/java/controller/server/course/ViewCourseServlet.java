package controller.server.course;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bean.RegistrationProfile;
import model.bo.CourseBO;
import model.bean.Course;
import model.bo.RegistrationProfileBO;

import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard/course/view")
public class ViewCourseServlet extends HttpServlet {
    private CourseBO courseBO;
    private RegistrationProfileBO registrationProfileBO;

    @Override
    public void init() {
        courseBO = new CourseBO();
        registrationProfileBO=new RegistrationProfileBO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        if (id != null && !id.isEmpty()) {
            Course course = courseBO.getCourseById(id);

            if (course != null) {
                List<RegistrationProfile> profiles = registrationProfileBO.getProfileByCourse(id);
                request.setAttribute("course", course);
                request.setAttribute("profiles", profiles);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/course/view-course.jsp");
                dispatcher.forward(request, response);
                return;
            } else {
                request.setAttribute("errorMessage", "Course not found for the provided ID.");
            }
        } else {
            request.setAttribute("errorMessage", "Course ID is missing.");
        }

        response.sendRedirect("/404notfound/index.jsp");
    }

}