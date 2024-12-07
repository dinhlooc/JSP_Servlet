package model.bo;

import model.bean.User;
import model.dao.UserDAO;

import java.util.List;

public class UserBO {
    private final UserDAO userDAO;

    public UserBO() {
        this.userDAO = new UserDAO();
    }

    public List<User> searchUsersByName(String type, String query) {
        return userDAO.search(type,query);
    }

    public User getUserById(String id) {
        if (id == null || id.isEmpty()) {
            throw new IllegalArgumentException("ID cannot be null or empty");
        }
        return userDAO.getById(id);
    }

    public User getUserByEmail(String email) {
        if (email == null || email.isEmpty()) {
            throw new IllegalArgumentException("Email cannot be null or empty");
        }
        return userDAO.getByEmail(email);
    }

    public void createUser(User user) {
        if (user == null) {
            throw new IllegalArgumentException("User cannot be null");
        }
        validateUserFields(user);
        userDAO.create(user);
    }

    public void updateUser(User user) {
        if (user == null) {
            throw new IllegalArgumentException("User cannot be null");
        }
        if (user.getId() == null || user.getId().isEmpty()) {
            throw new IllegalArgumentException("User ID cannot be null or empty");
        }
        validateUserFields(user);
        userDAO.update(user);
    }

    public void changeUserPassword(String password, String userId) {
        if (password == null || password.isEmpty()) {
            throw new IllegalArgumentException("Password cannot be null or empty");
        }
        if (userId == null || userId.isEmpty()) {
            throw new IllegalArgumentException("User ID cannot be null or empty");
        }
        userDAO.changePassword(password, userId);
    }

    public void deleteUser(String id) {
        if (id == null || id.isEmpty()) {
            throw new IllegalArgumentException("ID cannot be null or empty");
        }
        userDAO.delete(id);
    }

    private void validateUserFields(User user) {
        if (user.getFullName() == null || user.getFullName().isEmpty()) {
            throw new IllegalArgumentException("Full name cannot be null or empty");
        }
        if (user.getEmail() == null || user.getEmail().isEmpty()) {
            throw new IllegalArgumentException("Email cannot be null or empty");
        }
        if (user.getPassword() == null || user.getPassword().isEmpty()) {
            throw new IllegalArgumentException("Password cannot be null or empty");
        }
        if (user.getRole() == null || user.getRole().isEmpty()) {
            throw new IllegalArgumentException("Role cannot be null or empty");
        }
    }
}
