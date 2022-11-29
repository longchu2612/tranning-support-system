/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.ClassUser;
import model.User;

/**
 *
 * @author NTA-PC
 */
public class ClassUserDAO extends ConnectionDAO{

    

    private PreparedStatement prepared_statement;
    private String sql;
    private ResultSet result_set;

    public ArrayList<ClassUser> getAllTraineeList() {
        ArrayList<ClassUser> traineeList = new ArrayList<>();
        try {
            sql = "SELECT class_id, user_id, `status`, note,\n"
                    + "dropout_date, ongoing_eval, final_eval, topic_eval\n"
                    + "FROM class_user;";
            
            prepared_statement = getConnection().prepareStatement(sql);
            result_set = prepared_statement.executeQuery();
            
            while (result_set.next()) {
                ClassUser trainee = new ClassUser();
                // Will be update
                
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return traineeList;
    }

}
