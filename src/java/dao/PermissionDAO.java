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
import model.Permission;
import model.Setting;

/**
 *
 * @author Giang Dong PC
 */
public class PermissionDAO extends ConnectionDAO {

    private PreparedStatement prepared_statement;
    private String sql;
    private ResultSet result_set;

    public ArrayList<ArrayList<Permission>> getPermissionPaging(int page) {
        ArrayList<ArrayList<Permission>> permissionList = new ArrayList<>();
        int count = 0;
        try {
            sql = "select perm.screen_id, st.setting_value, perm.setting_id, perm.get_all_data, perm.can_add, perm.can_delete, perm.can_edit from\n"
                    + "	permission as perm\n"
                    + "    inner join setting as st \n"
                    + "    on st.setting_id = perm.screen_id\n"
                    + "    and st.type_id = 2 order by perm.screen_id,perm.setting_id  LIMIT 70 OFFSET ?;";
            prepared_statement = getConnection().prepareStatement(sql);
            prepared_statement.setInt(1, (page - 1) * 70);
            result_set = prepared_statement.executeQuery();
            while (result_set.next()) {
                if (result_set.getInt("screen_id") != count) {
                    count = result_set.getInt("screen_id");
                    permissionList.add(new ArrayList<>());
                }
                Permission permission = new Permission();
                Setting setting = new Setting();
                setting.setSetting_id(result_set.getInt("screen_id"));
                setting.setSetting_value(result_set.getString("setting_value"));
                permission.setSetting(setting);
                permission.setGet_all_data(result_set.getBoolean("get_all_data"));
                permission.setCan_add(result_set.getBoolean("can_add"));
                permission.setCan_edit(result_set.getBoolean("can_edit"));
                permission.setCan_delete(result_set.getBoolean("can_delete"));
                permissionList.get(permissionList.size() - 1).add(permission);
            }
        } catch (Exception e) {

        }
        return permissionList;
    }

    public int countPage() {
        int page = 1;
        System.out.println("Abc");
        try {
            sql = "SELECT count(DISTINCT `screen_id`) as 'screen' FROM permission";
            prepared_statement = getConnection().prepareStatement(sql);
            result_set = prepared_statement.executeQuery();

            while (result_set.next()) {

                page = result_set.getInt("screen");
            }
        } catch (Exception e) {

        }
        if (page <= 10) {
            return 1;
        }
        if (page % 10 == 0) {
            return page / 10;
        }
        return page / 10 + 1;
    }

    public Permission getPermission(int role, String path) {
        Permission permission = new Permission();
        try {
            sql = "select st.setting_id, get_all_data, can_delete, can_add, can_edit from\n"
                    + "	(select setting_id from setting where setting_value = ?) as st\n"
                    + "    inner join permission as per\n"
                    + "			on per.screen_id = st.setting_id\n"
                    + "			and per.setting_id = ?";
            prepared_statement = getConnection().prepareStatement(sql);
            prepared_statement.setString(1, path);
            prepared_statement.setInt(2, role);
            result_set = prepared_statement.executeQuery();
            while (result_set.next()) {
                permission.setSetting(new Setting());
                permission.getSetting().setSetting_id(result_set.getInt("setting_id"));
                permission.setCan_add(result_set.getBoolean("can_add"));
                permission.setCan_delete(result_set.getBoolean("can_delete"));
                permission.setCan_edit(result_set.getBoolean("can_edit"));
                permission.setGet_all_data(result_set.getBoolean("get_all_data"));
            }
        } catch (SQLException exception) {
        }
        return permission;
    }

    public void updatePermission(ArrayList<Permission> permissionList) {
        for (Permission permission : permissionList) {
            sql = "UPDATE `permission`\n"
                    + "SET\n"
                    + "`get_all_data` = ?,\n"
                    + "`can_delete` = ?,\n"
                    + "`can_edit` = ?,\n"
                    + "`can_add` = ?\n"
                    + "WHERE `screen_id` = ?\n"
                    + "	and `setting_id` = ?;";
            try {
                getConnection().setAutoCommit(false);
                prepared_statement = getConnection().prepareStatement(sql);
                prepared_statement.setBoolean(1, permission.isGet_all_data());
                prepared_statement.setBoolean(2, permission.isCan_delete());
                prepared_statement.setBoolean(3, permission.isCan_edit());
                prepared_statement.setBoolean(4, permission.isCan_add());
                prepared_statement.setInt(5, permission.getSetting().getSetting_id());
                prepared_statement.setInt(6, permission.getSetting().getType_id());
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
    }
}
