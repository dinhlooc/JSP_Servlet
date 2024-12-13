package controller;

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
@WebServlet(name = "HomeServlet", value = "/home")
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
        courses=courseBO.getTopCoursesByRegistrations(3);
        for (Course course : courses) {
            int studentCount = courseBO.getStudentCountByCourseId(course.getId());
            request.setAttribute("studentCount_" + course.getId(), studentCount);
        }
        request.setAttribute("courseList", courses);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
        dispatcher.forward(request, response);
    }
}