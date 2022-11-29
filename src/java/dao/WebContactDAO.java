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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Setting;
import model.User;
import model.WebContact;

/**
 *
 * @author Acer
 */
public class WebContactDAO extends ConnectionDAO {

    public List<User> getAllSupporter() {
        List<User> listSup = new ArrayList<>();
        String sql = "SELECT u.user_id, fullname ,mobile, avatar_url,mail FROM userrole as ur, user as u where u.user_id = ur.user_id and ur.setting_id = 15";

        try {

            PreparedStatement ps = getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();

                user.setId(rs.getInt("user_id"));
                user.setFull_name(rs.getString("fullname"));
                user.setMobile(rs.getString("mobile"));
                user.setAvatar_url(rs.getString("avatar_url"));

                user.setGmail(rs.getString("gmail"));

                listSup.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(WebContactDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listSup;

    }

    public User getSupporterByID(int id) {
        String sql = "SELECT * FROM user where user_id=?";
        try {
//            Connection conn = ConnectionDAO.getConnection();
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("user_id"));
                user.setFull_name(rs.getString("fullname"));
                user.setMobile(rs.getString("mobile"));
                user.setAvatar_url(rs.getString("avatar_url"));
                user.setNote(rs.getString("note"));
                user.setStatus(rs.getInt("status"));
                user.setGmail(rs.getString("gmail"));
                user.setRole(rs.getString("setting_title"));

                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(WebContactDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public List<Setting> getAllContactCategory() {
        List<Setting> listSet = new ArrayList<>();
        String sql = "select setting_id,setting_title from setting where type_id = 2";
        try {

//            Connection conn = ConnectionDAO.getConnection();
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Setting setting = new Setting();
                setting.setSetting_id(rs.getInt("setting_id"));
                setting.setSetting_title(rs.getString("setting_title"));
                listSet.add(setting);
            }
        } catch (SQLException ex) {
            Logger.getLogger(WebContactDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listSet;

    }

    public void saveWebContact(WebContact w) {
        String sql = "INSERT INTO `web_contact`"
                + "(`contact_id`,"
                + "`category_id`,"
                + "`supporter_id`,"
                + "`full_name`,"
                + "`email`,"
                + "`mobile`,"
                + "`message`)"
                + "VALUES(?,?,?,?,?,?,?)";
        try {
//            Connection conn = ConnectionDAO.getConnection();
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, w.getContact_id());
            ps.setInt(2, w.getCategory_id());
            ps.setInt(3, w.getSupporter_id());
            ps.setString(4, w.getFull_name());
            ps.setString(5, w.getEmail());
            ps.setString(6, w.getMobile());
            ps.setString(7, w.getMessage());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(WebContactDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void main(String[] args) {
//        WebContactDAO dao = new WebContactDAO();
//        List<Setting> list = new ArrayList<>();
//        list = dao.getAllContactCategory();
//        for (int i = 0; i < list.size(); i++) {
//            System.out.println(list.get(i));
//        }
//        User user = new User();
//        user = dao.getSupporterByID(3);
//        System.out.println(user);
    }

}
