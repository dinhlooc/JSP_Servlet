package model.dao;

import lib.AESUtil;
import model.bean.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO extends DBContext {

    public UserDAO() {
        super();
    }
    public List<User> search(String type, String query) {
        List<User> list = new ArrayList<>();
        String sql = "";

        // Build the SQL query based on the 'type' parameter
        switch (type) {
            case "id":
                sql="SELECT * FROM User WHERE id=?";
                break;
            case "full_name":
                sql = "SELECT * FROM User WHERE full_name LIKE ?";
                break;
            case "email":
                sql = "SELECT * FROM User WHERE email LIKE ?";
                break;
            case "role":
                sql = "SELECT * FROM User WHERE role LIKE ?";
                break;
            default:
                throw new IllegalArgumentException("Invalid search type: " + type);
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            String searchKeyword = "";
            if(type.equalsIgnoreCase("id")){
                searchKeyword=query;
            }else{
                searchKeyword ="%" + query + "%";
            }
            st.setString(1, searchKeyword);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                String hashPassword = rs.getString("password");
                String password = "";
                try {
                    password = AESUtil.decrypt(hashPassword);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }

                User user = new User(
                        rs.getString("Id"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        password,
                        rs.getString("role")
                );
                list.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public User getById(String id) {
        String sql = "select * from user where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                String hashPassword=rs.getString("password");
                String password="";
                try {
                    password=AESUtil.decrypt(hashPassword);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                User user = new User(
                        rs.getString("Id"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        password,
                        rs.getString("role")
                );
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public User getByEmail(String email) {
        String sql = "select * from user where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                String hashPassword=rs.getString("password");
                String password="";
                try {
                    password=AESUtil.decrypt(hashPassword);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                User user = new User(
                        rs.getString("Id"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        password,
                        rs.getString("role")
                );
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public void create(User user) {
        String sql = "insert into User (id,full_name,email,password,role) values(?,?,?,?,?)";
        String hashPassword = "";
        try {
            hashPassword = AESUtil.encrypt(user.getPassword());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1,user.getId());
            st.setString(2, user.getFullName());
            st.setString(3, user.getEmail());
            st.setString(4, hashPassword);
            st.setString(5, user.getRole());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(User user) {
        String sql = "UPDATE user SET full_name = ?, email = ?, password = ?, role = ? WHERE id = ?";

        String hashPassword = "";
        try {
            hashPassword = AESUtil.encrypt(user.getPassword());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getFullName());
            st.setString(2, user.getEmail());
            st.setString(3, hashPassword);
            st.setString(4, user.getRole());
            st.setString(5, user.getId());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void changePassword(String password,String id) {

        String sql = "update user set password=? where id=?";
        String hashPassword = "";
        try {
            hashPassword = AESUtil.encrypt(password);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, hashPassword);
            st.setString(2, id);
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(String id) {
        String sql = "delete from user where id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
