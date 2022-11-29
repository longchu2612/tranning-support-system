/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author Giang Dong PC
 */
public class UserDAO extends ConnectionDAO {

    private PreparedStatement prepared_statement;
    private String sql;
    private ResultSet result_set;

    public ArrayList<User> getUserListPaging(int page, String search, int sortElement, boolean order) {
        ArrayList<User> user_list = new ArrayList<>();

        int count = 1;
        try {
            sql = "SELECT us.user_id, fullname, mobile, avatar_url, us.status, note, gmail, st.setting_title FROM(user us \n"
                    + "	left OUTER JOIN  userrole as ur on ur.user_id = us.user_id\n"
                    + "    left OUTER JOIN setting as st on ur.setting_id = st.setting_id) \n";
            if (search != null) {
                sql += " where fullname like ? or gmail like ? or mobile like ?";
                count = 4;
            }
            sql += " order by ";
            switch (sortElement) {
                case 0:
                    sql += "us.user_id";
                    break;
                case 1:
                    sql += "fullname";
                    break;
                case 2:
                    sql += "gmail";
                    break;
                case 3:
                    sql += "mobile";
                    break;
            }
            if (order) {
                sql += " ASC ";
            } else {
                sql += " DESC ";
            }
            sql += "LIMIT 10 OFFSET ?";
            prepared_statement = connection.prepareStatement(sql);
            if (search != null) {
                search = '%' + search + '%';
                prepared_statement.setString(1, search);
                prepared_statement.setString(2, search);
                prepared_statement.setString(3, search);
            }
            prepared_statement.setInt(count, (page - 1) * 10);
            result_set = prepared_statement.executeQuery();
            System.out.println(prepared_statement.toString());
            while (result_set.next()) {
                User user = new User();
                user.setId(result_set.getInt("user_id"));
                user.setFull_name(result_set.getString("fullname"));
                user.setMobile(result_set.getString("mobile"));
                user.setAvatar_url(result_set.getString("avatar_url"));
                user.setNote(result_set.getString("note"));
                if (result_set.getString("status") == null) {
                    user.setStatus(-1);
                } else {
                    user.setStatus(result_set.getInt("status"));
                }

                user.setGmail(result_set.getString("gmail"));
                user.setRole(result_set.getString("setting_title"));
                user_list.add(user);
            }
        } catch (Exception e) {

        }
        return user_list;
    }

    public ArrayList<User> search(String search, int page) {
        ArrayList<User> users = new ArrayList<>();
        if (search.contains("@")) {
            sql = "SELECT us.user_id, fullname, mobile, avatar_url, us.status, note, gmail, st.setting_title FROM(\n"
                    + "	(select * from user where gmail like ?) as us\n"
                    + "	left OUTER JOIN  userrole as ur on ur.user_id = us.user_id\n"
                    + "	left OUTER JOIN setting as st on ur.setting_id = st.setting_id) \n"
                    + "	ORDER BY us.user_id LIMIT 10 OFFSET ?;";
        } else {
            if (search.matches("\\d+")) {
                sql = "SELECT us.user_id, fullname, mobile, avatar_url, us.status, note, gmail, st.setting_title FROM(\n"
                        + "	(select * from user where mobile like ?) as us\n"
                        + "	left OUTER JOIN  userrole as ur on ur.user_id = us.user_id\n"
                        + "	left OUTER JOIN setting as st on ur.setting_id = st.setting_id) \n"
                        + "	ORDER BY us.user_id LIMIT 10 OFFSET ?;";
            } else {
                sql = "SELECT us.user_id, fullname, mobile, avatar_url, us.status, note, gmail, st.setting_title FROM(\n"
                        + "	(select * from user where fullname like ?) as us\n"
                        + "	left OUTER JOIN  userrole as ur on ur.user_id = us.user_id\n"
                        + "	left OUTER JOIN setting as st on ur.setting_id = st.setting_id) \n"
                        + "	ORDER BY us.user_id LIMIT 10 OFFSET ?;";
            }
        }

        try {
            prepared_statement = getConnection().prepareStatement(sql);
            prepared_statement.setString(1, "%" + search + "%");
            prepared_statement.setInt(2, (page - 1) * 10);
            result_set = prepared_statement.executeQuery();
            while (result_set.next()) {
                User user = new User();
                user.setId(result_set.getInt("user_id"));
                user.setFull_name(result_set.getString("fullname"));
                user.setMobile(result_set.getString("mobile"));
                user.setAvatar_url(result_set.getString("avatar_url"));
                user.setNote(result_set.getString("note"));
                if (result_set.getString("status") == null) {
                    user.setStatus(-1);
                } else {
                    user.setStatus(result_set.getInt("status"));
                }
                user.setGmail(result_set.getString("gmail"));
                user.setRole(result_set.getString("setting_title"));
                users.add(user);
            }
        } catch (Exception exception) {
        }
        return users;
    }

    public int countPageSearch(String search) {
        int user = 0;
        sql = "SELECT count(*) as'User' FROM user ";
        if (search != null) {
            sql += "where fullname like ? or gmail like ? or mobile like ?";
        }
        try {
            prepared_statement = connection.prepareStatement(sql);
            if (search != null) {
                prepared_statement.setString(1, "%" + search + "%");
                prepared_statement.setString(2, "%" + search + "%");
                prepared_statement.setString(3, "%" + search + "%");
            }

            result_set = prepared_statement.executeQuery();
            while (result_set.next()) {
                user = result_set.getInt("User");
            }
        } catch (Exception e) {

        }
        if (user <= 10) {
            return 1;
        }
        if (user % 10 == 0) {
            return user / 10;
        }
        return user / 10 + 1;
    }

    public User getUser(int id) {
        User user = new User();

        sql = "SELECT us.user_id, fullname, mobile, avatar_url, us.status, note, gmail,ur.setting_id FROM(\n"
                + "	(select * from user where user_id=?) as us\n"
                + "	left OUTER JOIN  userrole as ur on ur.user_id = us.user_id\n"
                + "	left OUTER JOIN setting as st on ur.setting_id = st.setting_id)";
        try {
            prepared_statement = getConnection().prepareStatement(sql);
            prepared_statement.setInt(1, id);
            result_set = prepared_statement.executeQuery();

            while (result_set.next()) {
                user.setId(result_set.getInt("user_id"));
                user.setFull_name(result_set.getString("fullname"));
                user.setMobile(result_set.getString("mobile"));
                user.setAvatar_url(result_set.getString("avatar_url"));
                user.setNote(result_set.getString("note"));
                if (result_set.getString("status") == null) {
                    user.setStatus(-1);
                } else {
                    user.setStatus(result_set.getInt("status"));
                }
                user.setGmail(result_set.getString("gmail"));
                user.setSetting_id(result_set.getInt("setting_id"));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return user;
    }

    public ArrayList<User> getAll() throws ClassNotFoundException {
        String sql = "select * from user";
        ArrayList<User> list = new ArrayList<>();
        try {
            prepared_statement = getConnection().prepareStatement(sql);
            result_set = prepared_statement.executeQuery();
            while (result_set.next()) {
                User user = new User();
                user.setId(result_set.getInt("user_id"));
                user.setFull_name(result_set.getString("fullname"));
                user.setMobile(result_set.getString("mobile"));
                user.setAvatar_url(result_set.getString("avatar_url"));
                user.setNote(result_set.getString("note"));
                if (result_set.getString("status") == null) {
                    user.setStatus(-1);
                } else {
                    user.setStatus(result_set.getInt("status"));
                }
                user.setGmail(result_set.getString("gmail"));
                user.setPassword(result_set.getString("password"));
                list.add(user);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void deleteAcc(int id) {
        String sql = "delete from user where user_id =? ";
        try {
            prepared_statement = getConnection().prepareStatement(sql);
            prepared_statement.setInt(1, id);
            prepared_statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public User checkLogin(String email, String password) {
        User user = new User();
        sql = "SELECT us.user_id, fullname, mobile, avatar_url, us.status, note, gmail,ur.setting_id, st.setting_title FROM(\n"
                + "	(select * from user where password=? and gmail=?) as us\n"
                + "	left OUTER JOIN  userrole as ur on ur.user_id = us.user_id\n"
                + "	left OUTER JOIN setting as st on ur.setting_id = st.setting_id)";
        try {
            prepared_statement = getConnection().prepareStatement(sql);
            prepared_statement.setString(1, password);
            prepared_statement.setString(2, email);
            result_set = prepared_statement.executeQuery();
            while (result_set.next()) {
                user.setId(result_set.getInt("user_id"));
                user.setRole(result_set.getString("setting_title"));
                user.setGmail(result_set.getString("gmail"));
                user.setAvatar_url(result_set.getString("avatar_url"));
//                user.setPassword(result_set.getString("password"));
                user.setSetting_id(result_set.getInt("setting_id"));
                return user;
            }
        } catch (SQLException exception) {
            System.out.println(exception);
        }
        return null;
    }

    public static void main(String[] args) {
        UserDAO ud = new UserDAO();
        User u = ud.checkLogin("haicv@fpt.edu.vn", "74AC8798B296C6F7D1755C3D079B57D5");
        System.out.println(u.getPassword());
    }

    public User getUserById(int id) {
        String sql = "select * from user where user_id = ?";
        User user = new User();
        try {
            prepared_statement = getConnection().prepareStatement(sql);
            prepared_statement.setInt(1, id);
            result_set = prepared_statement.executeQuery();
            if (result_set.next()) {
                user.setId(result_set.getInt("user_id"));
                user.setFull_name(result_set.getString("fullname"));
                user.setMobile(result_set.getString("mobile"));
                user.setAvatar_url(result_set.getString("avatar_url"));
                user.setNote(result_set.getString("note"));
                if (result_set.getString("status") == null) {
                    user.setStatus(-1);
                } else {
                    user.setStatus(result_set.getInt("status"));
                }
                user.setGmail(result_set.getString("gmail"));
                user.setPassword(result_set.getString("password"));
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateUser(User user) {

        sql = "UPDATE`user`\n"
                + "SET\n"
                + "`fullname` = ?,\n"
                + "`mobile` = ?,\n"
                + "`avatar_url` = ?,\n"
                + "`status` = ?,\n"
                + "`note` = ?,\n"
                + "`gmail` = ?\n"
                + "WHERE `user_id` = ?;";
        try {
            getConnection().setAutoCommit(false);
            prepared_statement = getConnection().prepareStatement(sql);
            prepared_statement.setString(1, user.getFull_name());
            prepared_statement.setString(2, user.getMobile());
            prepared_statement.setString(3, user.getAvatar_url());
            if (user.getStatus() == -1) {
                prepared_statement.setNull(4, 1);
            } else {
                if (user.getStatus() == 0) {
                    prepared_statement.setBoolean(4, false);
                } else {
                    prepared_statement.setBoolean(4, true);
                }
            }
            prepared_statement.setString(5, user.getNote());
            prepared_statement.setString(6, user.getGmail());
            prepared_statement.setInt(7, user.getId());
            prepared_statement.executeUpdate();
            getConnection().commit();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            try {
                getConnection().rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                getConnection().setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void addUser(User user) {
        sql = "INSERT INTO `user`\n"
                + "(`fullname`,\n"
                + "`mobile`,\n"
                + "`password`,\n"
                + "`status`,\n"
                + "`note`,\n"
                + "`gmail`)\n"
                + "VALUES\n"
                + "(?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?);";
        try {
            connection.setAutoCommit(false);
            prepared_statement = connection.prepareStatement(sql);
            prepared_statement.setString(1, user.getFull_name());
            prepared_statement.setString(2, user.getMobile());
            prepared_statement.setString(3, user.getAvatar_url());
            if (user.getStatus() == -1) {
                prepared_statement.setNull(4, 1);
            } else {
                if (user.getStatus() == 0) {
                    prepared_statement.setBoolean(4, false);
                } else {
                    prepared_statement.setBoolean(4, true);
                }
            }
            prepared_statement.setString(5, user.getNote());
            prepared_statement.setString(6, user.getGmail());
            prepared_statement.executeUpdate();
            connection.commit();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
