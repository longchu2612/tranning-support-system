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
import model.Assignment;
import model.Subject;

/**
 *
 * @author ACER
 */
public class AssignmentDAO extends ConnectionDAO {

    public Assignment getAssByID(int id) {
        String sql = "select * from assignment where assignment_id = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                SubjectDAO sd = new SubjectDAO();
                Subject s = sd.getSubjectByID(rs.getInt("subject_id"));
                Assignment a = new Assignment(rs.getInt("assignment_id"), rs.getString("title"), rs.getString("ass_body"), s, rs.getBoolean("is_team_work"), rs.getBoolean("is_ongoing"), rs.getBoolean("status"));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public ArrayList<Assignment> getAll() {
        String sql = "select * from assignment";
        ArrayList<Assignment> list = new ArrayList<>();
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                SubjectDAO sd = new SubjectDAO();
                Subject s = sd.getSubjectByID(rs.getInt("subject_id"));
                Assignment a = new Assignment(rs.getInt("assignment_id"), rs.getString("title"), rs.getString("ass_body"), s, rs.getBoolean("is_team_work"), rs.getBoolean("is_ongoing"), rs.getBoolean("status"));
                list.add(a);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Assignment> getAssignmentBySubjectID(int id) {
        String sql = "select * from assignment where subject_id = ?";
        ArrayList<Assignment> list = new ArrayList<>();
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                SubjectDAO sd = new SubjectDAO();
                Subject s = sd.getSubjectByID(rs.getInt("subject_id"));
                Assignment a = new Assignment(rs.getInt("assignment_id"), rs.getString("title"), rs.getString("ass_body"), s, rs.getBoolean("is_team_work"), rs.getBoolean("is_ongoing"), rs.getBoolean("status"));
                list.add(a);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Assignment> getAssignmentNotMileStone() {
        String sql = "select assignment.assignment_id , assignment.title , "
                + "assignment.ass_body , assignment.subject_id ,assignment.is_team_work , "
                + "assignment.is_ongoing , assignment.status \n"
                + "from  assignment left join milestone on assignment.assignment_id = milestone.ass_id  "
                + "where milestone.ass_id is null";
        ArrayList<Assignment> list = new ArrayList<>();
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                SubjectDAO sd = new SubjectDAO();
                Subject s = sd.getSubjectByID(rs.getInt("subject_id"));
                Assignment a = new Assignment(rs.getInt("assignment_id"), rs.getString("title"), rs.getString("ass_body"), s, rs.getBoolean("is_team_work"), rs.getBoolean("is_ongoing"), rs.getBoolean("status"));
                list.add(a);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        AssignmentDAO ad = new AssignmentDAO();

//        ArrayList<Assignment> list = ad.getAssignmentBySubjectID(4);
//        for (Assignment assignment : list) {
//            System.out.println(assignment.getTitle());
//        }
    }
}
