/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Setting;
import model.Slot;

/**
 *
 * @author NTA-PC
 */
public class SettingDAO extends ConnectionDAO {

    private PreparedStatement prepared_statement;
    private String sql;
    private ResultSet result_set;

    public ArrayList<Setting> getAllSetting() {
        ArrayList<Setting> setting_list = new ArrayList<>();
        try {
            sql = "SELECT * FROM setting";
            prepared_statement = getConnection().prepareStatement(sql);
            result_set = prepared_statement.executeQuery();
            while (result_set.next()) {
                setting_list.add(new Setting(result_set.getInt("setting_id"),
                        result_set.getInt("type_id"),
                        result_set.getString("setting_value"),
                        result_set.getString("display_order"),
                        result_set.getBoolean("status"),
                        result_set.getString("description"),
                        result_set.getString("setting_title")));
            }
        } catch (SQLException exception) {
        }
        return setting_list;
    }

    public ArrayList<Setting> getListByPage(int page) {
        ArrayList<Setting> setting_list = new ArrayList<>();
        try {
            sql = "select setting_id, type_id, setting_value, display_order, status, description, setting_title "
                    + "from setting order by setting_id limit 10 offset ?;";
            prepared_statement = getConnection().prepareStatement(sql);
            prepared_statement.setInt(1, (page - 1) * 10);
            result_set = prepared_statement.executeQuery();
            while (result_set.next()) {
                setting_list.add(new Setting(result_set.getInt("setting_id"),
                        result_set.getInt("type_id"),
                        result_set.getString("setting_value"),
                        result_set.getString("display_order"),
                        result_set.getBoolean("status"),
                        result_set.getString("description"),
                        result_set.getString("setting_title")));
            }
        } catch (SQLException exception) {
        }
        return setting_list;
    }

    public ArrayList<Setting> getSettingByTitle(String search, int page) {
        ArrayList<Setting> settings = new ArrayList<>();
        sql = "select setting_id, type_id, setting_value, display_order, status, description, setting_title from setting\n"
                + "where setting_title like ?\n"
                + "order by setting_id limit 10 offset ?;";
        try {
            prepared_statement = getConnection().prepareStatement(sql);
            prepared_statement.setString(1, "%" + search + "%");
            prepared_statement.setInt(2, (page - 1) * 10);
            result_set = prepared_statement.executeQuery();
            while (result_set.next()) {
                settings.add(new Setting(result_set.getInt("setting_id"),
                        result_set.getInt("type_id"),
                        result_set.getString("setting_value"),
                        result_set.getString("display_order"),
                        result_set.getBoolean("status"),
                        result_set.getString("description"),
                        result_set.getString("setting_title")));
            }
        } catch (SQLException exception) {
        }
        return settings;
    }

    public int countPage() {
        int setting = 0;
        try {
            sql = "SELECT count(*) as 'Setting' FROM setting;";
            prepared_statement = getConnection().prepareStatement(sql);
            result_set = prepared_statement.executeQuery();
            while (result_set.next()) {
                setting = result_set.getInt("Setting");
            }
        } catch (SQLException exception) {
        }
        if (setting <= 10) {
            return 1;
        }
        if (setting % 10 == 0) {
            return setting / 10;
        }
        return setting / 10 + 1;
    }

    public void SettingAdd(Setting setting) {
        try {
            sql = "INSERT INTO `setting` (`type_id`, "
                    + "`setting_value`, "
                    + "`display_order`, "
                    + "`status`, "
                    + "`description`, "
                    + "`setting_title`) "
                    + "VALUES (?, ?, ?, ?, ?, ?);";
            PreparedStatement statement = getConnection().prepareStatement(sql);
            statement.setInt(1, setting.getType_id());
            statement.setString(2, setting.getSetting_value());
            statement.setString(3, setting.getDisplay_order());
            statement.setBoolean(4, setting.isStatus());
            statement.setString(5, setting.getDescription());
            statement.setString(6, setting.getSetting_title());
            statement.executeUpdate();
        } catch (SQLException exception) {
            Logger.getLogger(SettingDAO.class.getName()).log(Level.SEVERE, null, exception);
        }
    }

    public void SettingUpdate(Setting setting) {
        try {
            sql = "UPDATE `setting` SET `type_id` = ?, "
                    + "`setting_value` = ?, "
                    + "`display_order` = ?, "
                    + "`status` = ?, "
                    + "`description` = ?, "
                    + "`setting_title` = ? "
                    + "WHERE (`setting_id` = ?);";
            PreparedStatement statement = getConnection().prepareStatement(sql);
            statement.setInt(1, setting.getType_id());
            statement.setString(1, setting.getSetting_value());
            statement.setString(2, setting.getDisplay_order());
            statement.setBoolean(3, setting.isStatus());
            statement.setString(4, setting.getDescription());
            statement.setString(5, setting.getSetting_title());
            statement.setInt(6, setting.getSetting_id());
            statement.executeUpdate();
        } catch (SQLException exception) {
            Logger.getLogger(SettingDAO.class.getName()).log(Level.SEVERE, null, exception);
        }
    }

    public ArrayList<Setting> getRoleList() {
        ArrayList<Setting> settings = new ArrayList<>();
        sql = "SELECT setting_id, setting_title FROM setting where type_id = 1;";
        try {
            prepared_statement = getConnection().prepareStatement(sql);
            result_set = prepared_statement.executeQuery();
            while (result_set.next()) {
                Setting setting = new Setting();
                setting.setSetting_id(result_set.getInt("setting_id"));
                setting.setSetting_title(result_set.getString("setting_title"));
                settings.add(setting);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return settings;
    }

    public void updateUserRole(int user_id, int setting_id) {
        sql = "UPDATE `userrole`\n"
                + "SET\n"
                + "`setting_id` = ?\n"
                + "WHERE `user_id` = ?";
        try {
            getConnection().setAutoCommit(false);
            prepared_statement = getConnection().prepareStatement(sql);
            prepared_statement.setInt(1, setting_id);
            prepared_statement.setInt(2, user_id);
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

    public ArrayList<Setting> getSlotList() {
        ArrayList<Setting> slots = new ArrayList<>();
        try {
            sql = "SELECT setting_id, setting_value FROM setting where type_id = 40;";
            prepared_statement = connection.prepareStatement(sql);
            result_set = prepared_statement.executeQuery();
            while (result_set.next()) {
                Setting slot = new Setting();
                slot.setSetting_id(result_set.getInt("setting_id"));
                slot.setSetting_value(result_set.getString("setting_value"));
                slots.add(slot);
            }
        } catch (Exception exception) {
        }
        return slots;
    }

    public void addUserRole(int id, int setting_id) {
        sql = "insert into  `userrole`(`user_id`, `setting_id` )\n"
                + "values (? , ?)\n";
        try {
            connection.setAutoCommit(false);
            prepared_statement = connection.prepareStatement(sql);
            prepared_statement.setInt(1, id);
            prepared_statement.setInt(2, setting_id);
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

    public ArrayList<Setting> getRoomList() {
        ArrayList<Setting> roomSettings = new ArrayList<>();
        try {
            sql = "SELECT setting_id, setting_value FROM setting where type_id = 39;";
            prepared_statement = connection.prepareStatement(sql);
            result_set = prepared_statement.executeQuery();
            while (result_set.next()) {
                Setting slot = new Setting();
                slot.setSetting_id(result_set.getInt("setting_id"));
                slot.setSetting_value(result_set.getString("setting_value"));
                roomSettings.add(slot);
            }
        } catch (Exception exception) {
        }
        return roomSettings;
    }

}
