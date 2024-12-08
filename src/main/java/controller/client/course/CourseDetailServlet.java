package controller.client.course;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.bean.Course;
import model.bean.RegistrationProfile;
import model.bean.User;
import model.bo.CourseBO;
import model.bo.RegistrationProfileBO;

import java.io.IOException;
import java.util.UUID;

@WebServlet("/course-detail")
public class CourseDetailServlet extends HttpServlet {
    private CourseBO courseBO;
    private RegistrationProfileBO profileBO;
    @Override
    public void init() {
        courseBO = new CourseBO();
        profileBO = new RegistrationProfileBO();
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String birthDate = request.getParameter("birthDate");
        String courseId = request.getParameter("courseId");  // Course ID taken directly from the request
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String idCard = request.getParameter("idCard");
        boolean isStudent = Boolean.parseBoolean(request.getParameter("isStudent"));
        String goals = request.getParameter("goals");
        String id = UUID.randomUUID().toString();
        HttpSession session = request.getSession();
        User user=(User) session.getAttribute("user");
        String userId=user.getId();
        System.out.println(userId);

        String status = "active";

        RegistrationProfile profile = new RegistrationProfile();
        profile.setId(id);
        profile.setFullName(fullName);
        profile.setBirthDate(java.sql.Date.valueOf(birthDate));
        profile.setCourseId(courseId);
        profile.setEmail(email);
        profile.setPhone(phone);
        profile.setIdCard(idCard);
        profile.setStudent(isStudent);
        profile.setGoals(goals);
        profile.setUserId(userId);
        profile.setStatus(status);
        boolean result = profileBO.addRegistrationProfile(profile);
        if (result) {
            response.sendRedirect("/registered");
        } else {
            response.sendRedirect("/error.jsp");
        }
    }
}