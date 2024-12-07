package model.bo;

import model.dao.CourseDAO;
import model.bean.Course;
import java.util.List;

public class CourseBO {
    private CourseDAO courseDAO;

    public CourseBO() {
        courseDAO = new CourseDAO();
    }

    // Lấy danh sách tất cả các khóa học
    public List<Course> getAllCourses() {
        return courseDAO.getAllCourses();
    }

    // Lấy thông tin một khóa học theo ID
    public Course getCourseById(String id) {
        return courseDAO.getCourseById(id);
    }

    // Thêm một khóa học mới (có thể thêm logic kiểm tra dữ liệu đầu vào)
    public boolean addCourse(Course course) {
        if (course == null || course.getId().isEmpty() || course.getName().isEmpty()) {
            return false;
        }
        return courseDAO.insertCourse(course);
    }

    // Cập nhật thông tin khóa học
    public boolean updateCourse(Course course) {
        if (course == null || course.getId().isEmpty() || course.getName().isEmpty()) {
            return false;
        }
        return courseDAO.updateCourse(course);
    }

    // Xóa một khóa học theo ID
    public boolean deleteCourse(String id) {
        if (id == null || id.isEmpty()) {
            return false;
        }
        return courseDAO.deleteCourse(id);
    }

    public boolean isCourseIdExist(String courseId) {
        return courseDAO.isCourseIdExist(courseId);
    }
    public List<Course> searchCourses(String keyword) {
        return courseDAO.searchCourses(keyword);
    }

}