/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Assignment;
import model.Class;
import model.MileStone;

/**
 *
 * @author ACER
 */
public class MileStoneDAO extends ConnectionDAO {

    public ArrayList<MileStone> getAll() {
        String sql = "select * from milestone";
        ArrayList<MileStone> list = new ArrayList<>();
        AssignmentDAO ad = new AssignmentDAO();
        ClassDAO cd = new ClassDAO();
        try {

            PreparedStatement st = getConnection().prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Assignment a = ad.getAssByID(rs.getInt("ass_id"));
                Class c = cd.getClassByID(rs.getInt("class_id"));

                MileStone m = new MileStone(rs.getInt("milestone_id"), a, c, rs.getDate("from_date"), rs.getDate("to_date"), rs.getString("title"), rs.getString("ass_body"), rs.getString("description"), rs.getBoolean("status"));
                list.add(m);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public MileStone getMileStoneByID(int id) {
        String sql = "select * from milestone where milestone_id=?";

        MileStone m = new MileStone();
        AssignmentDAO ad = new AssignmentDAO();

        ClassDAO cd = new ClassDAO();

        try {

            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Assignment a = ad.getAssByID(rs.getInt("ass_id"));
                Class c = cd.getClassByID(rs.getInt("class_id"));

                m = new MileStone(rs.getInt("milestone_id"), a, c, rs.getDate("from_date"), rs.getDate("to_date"), rs.getString("title"), rs.getString("ass_body"), rs.getString("description"), rs.getBoolean("status"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return m;
    }

    public ArrayList<MileStone> getMileStoneByAssID(int id) {
        String sql = "select * from milestone where ass_id=?";

        ArrayList<MileStone> list = new ArrayList<>();
        AssignmentDAO ad = new AssignmentDAO();

        ClassDAO cd = new ClassDAO();

        try {

            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Assignment a = ad.getAssByID(rs.getInt("ass_id"));
                Class c = cd.getClassByID(rs.getInt("class_id"));

                MileStone m = new MileStone(rs.getInt("milestone_id"), a, c, rs.getDate("from_date"), rs.getDate("to_date"), rs.getString("title"), rs.getString("ass_body"), rs.getString("description"), rs.getBoolean("status"));
                list.add(m);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotalMilestone() {
        String sql = "select count(*) from milestone";
        int count = 0;
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return count;
    }

    public static void main(String[] args) {
        MileStoneDAO md = new MileStoneDAO();
//        md.add_milestone(1, 1, "2022-10-10", "2022-10-10", "adda", "dda", "", 0);
////        System.out.println(md.getMileStoneByID(3).getFrom_date());
        ArrayList<MileStone> list = md.getAll();
        for (MileStone mileStone : list) {
            System.out.println(mileStone.getFrom_date());
        }
    }

    public void deleteMilestone(int id) {
        String sql = "delete from milestone where milestone_id=?";

        try {

            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<MileStone> pagingMilestone(int start, int end) {
        AssignmentDAO ad = new AssignmentDAO();
        ClassDAO cd = new ClassDAO();
        ArrayList<MileStone> list = new ArrayList<>();
        String sql = "select * from milestone order by milestone_id limit ? , ?";

        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, start);
            st.setInt(2, end);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                Assignment a = ad.getAssByID(rs.getInt("ass_id"));
                Class c = cd.getClassByID(rs.getInt("class_id"));

                MileStone m = new MileStone(rs.getInt("milestone_id"), a, c, rs.getDate("from_date"), rs.getDate("to_date"), rs.getString("title"), rs.getString("ass_body"), rs.getString("description"), rs.getBoolean("status"));
                list.add(m);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<model.MileStone> searchMilestone(String search) {
        AssignmentDAO ad = new AssignmentDAO();
        ClassDAO cd = new ClassDAO();
        ArrayList<MileStone> list = new ArrayList<>();
        String sql = "select * from milestone where title like ? ";
//        or ass_id = ? or class_id = ?

        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, "%" + search + "%");
//            st.setString(2, "%" + search + "%");
//            st.setString(3, "%" + search + "%");
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Assignment a = ad.getAssByID(rs.getInt("ass_id"));
                Class c = cd.getClassByID(rs.getInt("class_id"));

                MileStone m = new MileStone(rs.getInt("milestone_id"), a, c, rs.getDate("from_date"), rs.getDate("to_date"), rs.getString("title"), rs.getString("ass_body"), rs.getString("description"), rs.getBoolean("status"));
                list.add(m);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void add_milestone(int ass_id, int class_id, String fromdate, String todate, String title, String ass_body, String description, int status) {
        String sql = "INSERT INTO `project_swp_391`.`milestone`\n"
                + "(\n"
                + "`ass_id`,\n"
                + "`class_id`,\n"
                + "`from_date`,\n"
                + "`to_date`,\n"
                + "`title`,\n"
                + "`ass_body`,\n"
                + "`description`,\n"
                + "`status`)\n"
                + "VALUES\n"
                + "(?,?,?,?,?,?,?,?);";

        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, ass_id);
            st.setInt(2, class_id);
            st.setString(3, fromdate);
            st.setString(4, todate);
            st.setString(5, title);
            st.setString(6, ass_body);
            st.setString(7, description);
            st.setInt(8, status);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
