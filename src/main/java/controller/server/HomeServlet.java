package controller.client;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bean.Course;
import model.bo.CourseBO;

import java.io.*;
import java.util.*;
@WebServlet("/")
public class HomeServlet extends HttpServlet {

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
        for (Course course : courses) {
            int studentCount = courseBO.getStudentCountByCourseId(course.getId());
            request.setAttribute("studentCount_" + course.getId(), studentCount);
        }
        request.setAttribute("courseList", courses);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }
}