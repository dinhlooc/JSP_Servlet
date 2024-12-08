package model.dao;

import model.bean.RegistrationProfile;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RegistrationProfileDAO extends DBContext {

    public RegistrationProfileDAO() {
        super();
    }

    // Create
    public boolean addRegistrationProfile(RegistrationProfile profile) {
        String sql = "INSERT INTO RegistrationProfile (id, full_Name, birth_Date, course_id, email, phone, id_card, is_student, goals, user_id, status) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, profile.getId());
            ps.setString(2, profile.getFullName());
            ps.setDate(3, new Date(profile.getBirthDate().getTime()));
            ps.setString(4, profile.getCourseId());
            ps.setString(5, profile.getEmail());
            ps.setString(6, profile.getPhone());
            ps.setString(7, profile.getIdCard());
            ps.setBoolean(8, profile.isStudent());
            ps.setString(9, profile.getGoals());
            ps.setString(10, profile.getUserId());
            ps.setString(11, profile.getStatus());
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Read
    public RegistrationProfile getRegistrationProfile(String id) {
        String sql = "SELECT * FROM RegistrationProfile WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                RegistrationProfile profile = new RegistrationProfile();
                profile.setId(rs.getString("id"));
                profile.setFullName(rs.getString("full_Name"));
                profile.setBirthDate(rs.getDate("birth_date"));
                profile.setCourseId(rs.getString("course_id"));
                profile.setEmail(rs.getString("email"));
                profile.setPhone(rs.getString("phone"));
                profile.setIdCard(rs.getString("id_card"));
                profile.setStudent(rs.getBoolean("is_student"));
                profile.setGoals(rs.getString("goals"));
                profile.setUserId(rs.getString("user_id"));
                profile.setStatus(rs.getString("status"));
                return profile;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Read all
    public List<RegistrationProfile> getAllRegistrationProfiles() {
        List<RegistrationProfile> profiles = new ArrayList<>();
        String sql = "SELECT * FROM RegistrationProfile";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                RegistrationProfile profile = new RegistrationProfile();
                profile.setId(rs.getString("id"));
                profile.setFullName(rs.getString("full_Name"));
                profile.setBirthDate(rs.getDate("birth_date"));
                profile.setCourseId(rs.getString("course_id"));
                profile.setEmail(rs.getString("email"));
                profile.setPhone(rs.getString("phone"));
                profile.setIdCard(rs.getString("id_card"));
                profile.setStudent(rs.getBoolean("is_student"));
                profile.setGoals(rs.getString("goals"));
                profile.setUserId(rs.getString("user_id"));
                profile.setStatus(rs.getString("status"));
                profiles.add(profile);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return profiles;
    }

    // Update
    public boolean updateRegistrationProfile(RegistrationProfile profile) {
        String sql = "UPDATE RegistrationProfile SET full_name = ?,  course_id = ?, email = ?, phone = ?, " +
                     "id_card = ?, is_student = ?, goals = ?, status = ? WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, profile.getFullName());

            ps.setString(2, profile.getCourseId());
            ps.setString(3, profile.getEmail());
            ps.setString(4, profile.getPhone());
            ps.setString(5, profile.getIdCard());
            ps.setBoolean(6, profile.isStudent());
            ps.setString(7, profile.getGoals());

            ps.setString(8, profile.getStatus());
            ps.setString(9, profile.getId());
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete
    public boolean deleteRegistrationProfile(String id) {
        String sql = "DELETE FROM RegistrationProfile WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, id);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public List<RegistrationProfile> searchProfiles(String query) {
        List<RegistrationProfile> profiles = new ArrayList<>();
        String sql = "SELECT * FROM RegistrationProfile WHERE full_name LIKE ? OR email LIKE ? OR phone LIKE ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            String searchPattern = "%" + query + "%";
            ps.setString(1, searchPattern);
            ps.setString(2, searchPattern);
            ps.setString(3, searchPattern);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                RegistrationProfile profile = new RegistrationProfile();
                profile.setId(rs.getString("id"));
                profile.setFullName(rs.getString("full_Name"));
                profile.setBirthDate(rs.getDate("birth_date"));
                profile.setCourseId(rs.getString("course_id"));
                profile.setEmail(rs.getString("email"));
                profile.setPhone(rs.getString("phone"));
                profile.setIdCard(rs.getString("id_card"));
                profile.setStudent(rs.getBoolean("is_student"));
                profile.setGoals(rs.getString("goals"));
                profile.setUserId(rs.getString("user_id"));
                profile.setStatus(rs.getString("status"));
                profiles.add(profile);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return profiles;
    }
    public List<RegistrationProfile> getProfilesByCourse(String courseId) {
        List<RegistrationProfile> profiles = new ArrayList<>();
        String sql = "SELECT * FROM RegistrationProfile WHERE course_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, courseId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                RegistrationProfile profile = new RegistrationProfile();
                profile.setId(rs.getString("id"));
                profile.setFullName(rs.getString("full_Name"));
                profile.setBirthDate(rs.getDate("birth_date"));
                profile.setCourseId(rs.getString("course_id"));
                profile.setEmail(rs.getString("email"));
                profile.setPhone(rs.getString("phone"));
                profile.setIdCard(rs.getString("id_card"));
                profile.setStudent(rs.getBoolean("is_student"));
                profile.setGoals(rs.getString("goals"));
                profile.setUserId(rs.getString("user_id"));
                profile.setStatus(rs.getString("status"));
                profiles.add(profile);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return profiles;
    }
    public List<RegistrationProfile> getRegistrationProfilesByUserId(String userId) {
        List<RegistrationProfile> profiles = new ArrayList<>();
        String sql = "SELECT * FROM RegistrationProfile WHERE user_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                RegistrationProfile profile = new RegistrationProfile();
                profile.setId(rs.getString("id"));
                profile.setFullName(rs.getString("full_Name"));
                profile.setBirthDate(rs.getDate("birth_date"));
                profile.setCourseId(rs.getString("course_id"));
                profile.setEmail(rs.getString("email"));
                profile.setPhone(rs.getString("phone"));
                profile.setIdCard(rs.getString("id_card"));
                profile.setStudent(rs.getBoolean("is_student"));
                profile.setGoals(rs.getString("goals"));
                profile.setUserId(rs.getString("user_id"));
                profile.setStatus(rs.getString("status"));
                profiles.add(profile);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return profiles;
    }
}