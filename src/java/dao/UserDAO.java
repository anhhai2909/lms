/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

//import model.User;
import java.sql.Connection;
import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Setting;

/**
 *
 * @author Admin
 */
public class UserDAO extends BaseDAO {

    public boolean checkEmail(String email) {
        try {
            String query = "SELECT * FROM user WHERE email = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void register(User us) {
        try {
            String query = "INSERT INTO user\n"
                    + "(`email`,\n"
                    + "`password`,\n"
                    + "`role_id`,\n"
                    + "`status`,\n"
                    + "`register_at`)\n"
                    + "VALUES\n"
                    + "(?, ?, ?, 1, NOW())";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, us.getEmail());
            ps.setString(2, us.getPassword());
            ps.setInt(3, us.getRole().getId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public User login(String email, String password) {
        String query = "SELECT * FROM user u join setting s on u.role_id = s.id\n"
                + "                WHERE email = ? and password = ? AND u.status = 1";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                Setting role = new Setting();
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setId(rs.getInt(1));
                user.setFullname(rs.getString("fullname"));
                user.setPhone_number(rs.getString("phone_number"));
                user.setAvatar(rs.getString("avatar"));
                user.setStatus(rs.getBoolean("status"));
                role.setId(rs.getInt(13));
                role.setSetting_name(rs.getString("setting_name"));
                role.setSetting_value(rs.getString("setting_value"));
                user.setRole(role);
                return user;
            }
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public boolean resetPassword(User user) {
        try {
            String sql = "UPDATE user SET password = ? WHERE email = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getPassword());
            ps.setString(2, user.getEmail());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public void googleRegister(User newUser) {
        try {
            String query = "INSERT INTO user\n"
                    + "(`email`,\n"
                    + "`role_id`,\n"
                    + "`status`,\n"
                    + "`register_at`)\n"
                    + "VALUES\n"
                    + "(?, ?, 1, NOW())";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, newUser.getEmail());
            ps.setInt(2, newUser.getRole().getId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public User googleLogin(String email) {
        String query = "SELECT * FROM user u join setting s on u.role_id = s.id\n"
                + " WHERE email = ?  AND u.status = 1";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                Setting role = new Setting();
                user.setEmail(rs.getString("email"));
                user.setId(rs.getInt(1));
                role.setId(rs.getInt(13));
                role.setSetting_name(rs.getString("setting_name"));
                role.setSetting_value(rs.getString("setting_value"));
                user.setRole(role);
                return user;
            }
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public ArrayList<User> getUserList() {
        ArrayList<User> userList = new ArrayList<>();
        String sql = "select u.*,s.setting_value,s.id from user u join setting s on u.role_id = s.id\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Setting setting = new Setting();
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone_number(rs.getString("phone_number"));
                user.setAvatar(rs.getString("avatar"));
                user.setStatus(rs.getBoolean("status"));
                user.getRole().setId(rs.getInt("role_id"));
                setting.setId(rs.getInt("id"));
                setting.setSetting_value(rs.getString("setting_value"));
                user.setRole(setting);
                user.setCreated_by(rs.getInt("created_by"));
                user.setRegister_at(rs.getDate("register_at"));
                user.setUpdated_by(rs.getInt("updated_by"));
                user.setUpdated_at(rs.getDate("updated_at"));
                userList.add(user);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return userList;
    }

    public void deleteUser(String id) {

        String sql = "DELETE FROM group6_lms.user\n"
                + "WHERE id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addUser(String password, String fullname, String email, String phone_number, String avatar, int status, String role_id) {
        String sql = "insert into user(password,fullname,email,phone_number,avatar,status,role_id)\n"
                + "value(?,?,?,?,?,?,?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setString(2, fullname);
            st.setString(3, email);
            st.setString(4, phone_number);
            st.setString(5, avatar);
            st.setInt(6, status);
            st.setString(7, role_id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public User getUserByID(String id) {
        ResultSet rs;
        String sql = "select * from user join setting on user.role_id = setting.id \n"
                + "where user.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            rs = st.executeQuery();
            while (rs.next()) {
                Setting setting = new Setting();
                User user = new User();
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setId(rs.getInt("id"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone_number(rs.getString("phone_number"));
                user.setAvatar(rs.getString("avatar"));
                user.setStatus(rs.getBoolean("status"));
                user.getRole().setId(rs.getInt("role_id"));
                setting.setId(rs.getInt("id"));
                setting.setSetting_value(rs.getString("setting_value"));
                user.setRole(setting);
                user.setRegister_at(rs.getDate("register_at"));
                user.setCreated_by(rs.getInt("created_by"));
                user.setCreated_by(rs.getInt("created_at"));
                user.setUpdated_by(rs.getInt("updated_by"));
                user.setUpdated_at(rs.getDate("updated_at"));
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<User> filterStatus(String status) {
        ArrayList<User> list = new ArrayList<>();
        ResultSet rs;
        String sql = "select * from user join setting on user.role_id= setting.id\n"
                + "where status = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            rs = st.executeQuery();
            while (rs.next()) {
                Setting setting = new Setting();
                User user = new User();
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setId(rs.getInt("id"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone_number(rs.getString("phone_number"));
                user.setAvatar(rs.getString("avatar"));
                user.setStatus(rs.getBoolean("status"));
                user.getRole().setId(rs.getInt("role_id"));
                setting.setId(rs.getInt("id"));
                setting.setSetting_value(rs.getString("setting_value"));
                user.setRole(setting);
                list.add(user);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<User> filterRole(String roleID) {
        ArrayList<User> list = new ArrayList<>();
        ResultSet rs;
        String sql = "SELECT u.*, s.setting_value\n"
                + "FROM user u\n"
                + "INNER JOIN setting s ON u.role_id = s.id\n"
                + "WHERE u.role_id = ? AND s.is_active = 1;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, roleID);
            rs = st.executeQuery();
            while (rs.next()) {
                Setting setting = new Setting();
                User user = new User();
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setId(rs.getInt("id"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone_number(rs.getString("phone_number"));
                user.setAvatar(rs.getString("avatar"));
                user.setStatus(rs.getBoolean("status"));
                user.getRole().setId(rs.getInt("role_id"));
                setting.setId(rs.getInt("id"));
                setting.setSetting_value(rs.getString("setting_value"));
                user.setRole(setting);
                list.add(user);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public User getUserByName(String fullname) {
        ResultSet rs;
        String sql = "select * from user \n"
                + "where fullname = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, fullname);
            rs = st.executeQuery();
            while (rs.next()) {
                Setting setting = new Setting();
                User user = new User();
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setId(rs.getInt("id"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone_number(rs.getString("phone_number"));
                user.setAvatar(rs.getString("avatar"));
                user.setStatus(rs.getBoolean("status"));
                user.getRole().setId(rs.getInt("role_id"));
                setting.setId(rs.getInt("id"));
                setting.setSetting_value(rs.getString("setting_value"));
                user.setRole(setting);
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User getUserByEmail(String email) {
        ResultSet rs;
        String sql = "select * from user \n"
                + "where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            rs = st.executeQuery();
            while (rs.next()) {
                Setting setting = new Setting();
                User user = new User();
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setId(rs.getInt("id"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone_number(rs.getString("phone_number"));
                user.setAvatar(rs.getString("avatar"));
                user.setStatus(rs.getBoolean("status"));
                user.getRole().setId(rs.getInt("role_id"));
                setting.setId(rs.getInt("id"));
                setting.setSetting_value(rs.getString("setting_value"));
                user.setRole(setting);
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User getUserByPhone(String phone) {
        ResultSet rs;
        String sql = "select * from user \n"
                + "where phone_number = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, phone);
            rs = st.executeQuery();
            while (rs.next()) {
                Setting setting = new Setting();
                User user = new User();
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setId(rs.getInt("id"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone_number(rs.getString("phone_number"));
                user.setAvatar(rs.getString("avatar"));
                user.setStatus(rs.getBoolean("status"));
                user.getRole().setId(rs.getInt("role_id"));
                setting.setId(rs.getInt("id"));
                setting.setSetting_value(rs.getString("setting_value"));
                user.setRole(setting);
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<User> getUserByPage(ArrayList<User> list, int start, int end) {
        ArrayList<User> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public boolean saveAvatar(int id, String avatarUrl) {
        int check = 0;
        String sql = "UPDATE user SET avatar = ? WHERE id = ?";

        try ( Connection con = new BaseDAO().connection;  PreparedStatement ps = con.prepareStatement(sql)) {
            // Set the avatar data as a binary stream
            ps.setString(1, avatarUrl);
            ps.setInt(2, id);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public void updateUser(String id, String password, String fullname, String email, String phone, String avatar, int status, int role_id, int updated_by) {
        String sql = "Update user \n"
                + "set fullname = ?, email = ?,phone_number = ?,avatar = ?,status = ?, role_id = ?,updated_by = ?, updated_at = NOW()\n"
                + "where id = ?; ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, fullname);
            st.setString(2, email);
            st.setString(3, phone);
            st.setString(4, avatar);
            st.setInt(5, status);
            st.setInt(6, role_id);
            st.setInt(7, updated_by);
            st.setString(8, id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public User checkUpdateEmail(String newEmail, String id) {
        String sql = "select * from user\n"
                + "where email = ? and id != ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newEmail);
            st.setString(2, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Setting setting = new Setting();
                User user = new User();
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setId(rs.getInt("id"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone_number(rs.getString("phone_number"));
                user.setAvatar(rs.getString("avatar"));
                user.setStatus(rs.getBoolean("status"));
                user.getRole().setId(rs.getInt("role_id"));
                setting.setId(rs.getInt("id"));
                setting.setSetting_value(rs.getString("setting_value"));
                user.setRole(setting);
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User checkUpdatePhone(String newPhone, String id) {
        String sql = "select * from user\n"
                + "where phone_number = ? and id != ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newPhone);
            st.setString(2, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Setting setting = new Setting();
                User user = new User();
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setId(rs.getInt("id"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone_number(rs.getString("phone_number"));
                user.setAvatar(rs.getString("avatar"));
                user.setStatus(rs.getBoolean("status"));
                user.getRole().setId(rs.getInt("role_id"));
                setting.setId(rs.getInt("id"));
                setting.setSetting_value(rs.getString("setting_value"));
                user.setRole(setting);
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateStatusUser(String id, String status) {
        try {
            String sql = "UPDATE User\n"
                    + "SET status= ?\n"
                    + "WHERE id=?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            stm.setString(2, status);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<User> searchUser(String searchQuery) {
        PreparedStatement st;
        ResultSet rs;
        ArrayList list = new ArrayList();
        String sql = "SELECT u.*,s.id,s.setting_value FROM user AS u "
                + "JOIN setting AS s ON u.role_id = s.id "
                + "WHERE (u.fullname LIKE ? OR u.id LIKE ? OR u.phone_number LIKE ? OR u.email LIKE ?);";
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, "%" + searchQuery + "%");
            st.setString(2, "%" + searchQuery + "%");
            st.setString(3, "%" + searchQuery + "%");
            st.setString(4, "%" + searchQuery + "%");
            rs = st.executeQuery();
            while (rs.next()) {
                Setting setting = new Setting();
                User user = new User();
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setId(rs.getInt("id"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone_number(rs.getString("phone_number"));
                user.setAvatar(rs.getString("avatar"));
                user.setStatus(rs.getBoolean("status"));
                user.getRole().setId(rs.getInt("role_id"));
                setting.setId(rs.getInt("id"));
                setting.setSetting_value(rs.getString("setting_value"));
                user.setRole(setting);
                list.add(user);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        ArrayList<User> list = dao.getUserList();
        System.out.println(list);
    }

}
