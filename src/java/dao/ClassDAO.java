/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Class;
import model.Subject;
import model.User;

/**
 *
 * @author ACER
 */
public class ClassDAO extends ConnectionDAO {
    private PreparedStatement prepared_statement;
    private String sql;
    private ResultSet result_set;
    
    public Class getClassByID(int id) {
        SubjectDAO sd = new SubjectDAO();

        String sql = "select * from class where class_id = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User();
                Subject s = sd.getSubjectByID(rs.getInt("subject_id"));

                Class c = new Class();
                c.setClass_id(rs.getInt("class_id"));
                c.setClass_code(rs.getString("class_code"));
                c.setCombo_id(rs.getInt("combo_id"));
                c.setTrainer(u);
                c.setTerm_id(rs.getInt("term_id"));
                c.setStatus(rs.getBoolean("status"));
                c.setDescription(rs.getString("decription"));
                c.setSubject(s);
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<Class> getAll() {
        SubjectDAO sd = new SubjectDAO();

        ArrayList<Class> list_class = new ArrayList<>();
        String sql = "select * from class ";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                Subject s = sd.getSubjectByID(rs.getInt("subject_id"));
                Class c = new Class();
                c.setClass_id(rs.getInt("class_id"));
                c.setClass_code(rs.getString("class_code"));
                c.setCombo_id(rs.getInt("combo_id"));
                c.setTrainer(u);
                c.setTerm_id(rs.getInt("term_id"));
                c.setStatus(rs.getBoolean("status"));
                c.setDescription(rs.getString("decription"));
                c.setSubject(s);
                list_class.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list_class;
    }

    public ArrayList<Class> getClassList(int userId) {
        ArrayList<Class> classes = new ArrayList<>();
        String sql = "select * from class where supporter_id = ? or trainer_id = ?";
        try {
            prepared_statement = getConnection().prepareStatement(sql);
            prepared_statement.setInt(1, userId);
            prepared_statement.setInt(2, userId);
            result_set = prepared_statement.executeQuery();
            while (result_set.next()) {
                Class c = new Class();
                c.setClass_id(result_set.getInt("class_id"));
                c.setClass_code(result_set.getString("class_code"));
                c.setCombo_id(result_set.getInt("combo_id"));
                c.setTerm_id(result_set.getInt("term_id"));
                c.setStatus(result_set.getBoolean("status"));
                c.setDescription(result_set.getString("decription"));
                classes.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
//        Class cd = c.getClassByID(1);
//        System.out.println(cd.getCombo_id());
        return classes;
    }

    public ArrayList<Class> getTraineeClassList(int id) {
        ArrayList<Class> classes = new ArrayList<>();
        sql = "select cl.class_id, cl.class_code from class as cl"
                + " inner join class_user as cu"
                + " on cu.class_id = cl.class_id"
                + " and cu.user_id = ?";
        try {
            prepared_statement = getConnection().prepareStatement(sql);
            prepared_statement.setInt(1, id);
            result_set = prepared_statement.executeQuery();
            while (result_set.next()) {
                Class c = new Class();
                c.setClass_id(result_set.getInt("class_id"));
                c.setClass_code(result_set.getString("class_code"));
                classes.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return classes;
    }

}
