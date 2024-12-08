package model.dao;
import model.bean.Course;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CourseDAO extends DBContext {

    public CourseDAO() {
        super();
    }

    // Lấy danh sách tất cả các khóa học
    public List<Course> getAllCourses() {
        List<Course> courses = new ArrayList<>();
        String query = "SELECT * FROM course";

        try (PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getString("id"));
                course.setName(rs.getString("name"));
                course.setPrice(rs.getString("price"));
                course.setDescription(rs.getString("description"));
                course.setStartDate(rs.getDate("start_date"));
                course.setEndDate(rs.getDate("end_date"));
                courses.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }

    // Lấy thông tin một khóa học theo ID
    public Course getCourseById(String id) {
        Course course = null;
        String query = "SELECT * FROM course WHERE id = ?";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    course = new Course();
                    course.setId(rs.getString("id"));
                    course.setName(rs.getString("name"));
                    course.setPrice(rs.getString("price"));
                    course.setDescription(rs.getString("description"));
                    course.setStartDate(rs.getDate("start_date"));
                    course.setEndDate(rs.getDate("end_date"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return course;
    }

    // Thêm một khóa học mới
    public boolean insertCourse(Course course) {
        if (isCourseIdExist(course.getId())) {
            System.out.println("Mã khóa học đã tồn tại. Vui lòng chọn mã khác.");
            return false;
        }
        String query = "INSERT INTO course (id, name, price, description, start_date, end_date) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, course.getId());
            ps.setString(2, course.getName());
            ps.setString(3, course.getPrice());
            ps.setString(4, course.getDescription());
            ps.setDate(5, new java.sql.Date(course.getStartDate().getTime()));
            ps.setDate(6, course.getEndDate() != null ? new java.sql.Date(course.getEndDate().getTime()) : null);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Cập nhật thông tin khóa học
    public boolean updateCourse(Course course) {
        String query = "UPDATE course SET name = ?, price = ?, description = ?, start_date = ?, end_date = ? WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, course.getName());
            ps.setString(2, course.getPrice());
            ps.setString(3, course.getDescription());
            ps.setDate(4, new java.sql.Date(course.getStartDate().getTime()));
            ps.setDate(5, course.getEndDate() != null ? new java.sql.Date(course.getEndDate().getTime()) : null);
            ps.setString(6, course.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Xóa một khóa học theo ID
    public boolean deleteCourse(String id) {
        String query = "DELETE FROM course WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean isCourseIdExist(String courseId) {
        String query = "SELECT COUNT(*) FROM course WHERE id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, courseId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
    public List<Course> searchCourses(String keyword) {
        List<Course> courses = new ArrayList<>();
        String query = "SELECT * FROM course WHERE name LIKE ? ";

        try (PreparedStatement statement = connection.prepareStatement(query)){
            statement.setString(1, "%" + keyword + "%");
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Course course = new Course(
                            resultSet.getString("id"),
                            resultSet.getString("name"),
                            resultSet.getString("price"),
                            resultSet.getString("description"),
                            resultSet.getString("start_date"),
                            resultSet.getString("end_date")
                    );
                    courses.add(course);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }
    public int getStudentCountByCourseId(String courseId) {
        int studentCount = 0;
        String sql = "SELECT COUNT(*) FROM RegistrationProfile WHERE course_id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setString(1, courseId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                studentCount = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return studentCount;
    }
    public List<Course> getTopCoursesByRegistrations(int limit) {
        List<Course> courses = new ArrayList<>();
        String query = "SELECT c.*, COUNT(rp.id) AS registration_count " +
                "FROM course c " +
                "LEFT JOIN RegistrationProfile rp ON c.id = rp.course_id " +
                "GROUP BY c.id, c.name, c.price, c.description, c.start_date, c.end_date " +
                "ORDER BY registration_count DESC " +
                "LIMIT ?";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, limit); // Giới hạn số lượng khóa học trả về
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Course course = new Course();
                    course.setId(rs.getString("id"));
                    course.setName(rs.getString("name"));
                    course.setPrice(rs.getString("price"));
                    course.setDescription(rs.getString("description"));
                    course.setStartDate(rs.getDate("start_date"));
                    course.setEndDate(rs.getDate("end_date"));
                    courses.add(course);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }


}