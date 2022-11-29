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
import model.MileStone;
import model.EvalCriteria;

/**
 *
 * @author ACER
 */
public class EvalCriteriaDAO extends ConnectionDAO {

    public ArrayList<EvalCriteria> getAllCriteria() {

        ArrayList<EvalCriteria> list = new ArrayList<>();
        String sql = "select * from eval_criteria";
        AssignmentDAO ad = new AssignmentDAO();
        MileStoneDAO md = new MileStoneDAO();

        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                Assignment a = ad.getAssByID(rs.getInt("ass_id"));
                MileStone m = md.getMileStoneByID(rs.getInt("milestone_id"));
                EvalCriteria e = new EvalCriteria(rs.getInt("criteria_id"), a, m, rs.getString("criteria_name"), rs.getBoolean("is_team_eval"), rs.getInt("eval_weight"), rs.getInt("max_loc"), rs.getBoolean("status"), rs.getString("description"));
                list.add(e);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public ArrayList<EvalCriteria> getCriteriaMileIdNotNull() {

        ArrayList<EvalCriteria> list = new ArrayList<>();
        String sql = "SELECT * FROM project_swp_391.eval_criteria where milestone_id is not null;";
        AssignmentDAO ad = new AssignmentDAO();
        MileStoneDAO md = new MileStoneDAO();

        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                Assignment a = ad.getAssByID(rs.getInt("ass_id"));
                MileStone m = md.getMileStoneByID(rs.getInt("milestone_id"));
                EvalCriteria e = new EvalCriteria(rs.getInt("criteria_id"), a, m, rs.getString("criteria_name"), rs.getBoolean("is_team_eval"), rs.getInt("eval_weight"), rs.getInt("max_loc"), rs.getBoolean("status"), rs.getString("description"));
                list.add(e);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public int getTotalEval() {
        String sql = "select count(*) from eval_criteria ;";
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

    public int getTotalEvalMileIdNull() {
        String sql = "select count(*) from eval_criteria  where milestone_id is not null;";
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

    public EvalCriteria getCriteriaByID(int id) {

        AssignmentDAO ad = new AssignmentDAO();
        MileStoneDAO md = new MileStoneDAO();
        String sql = "select * from eval_criteria where criteria_id = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Assignment a = ad.getAssByID(rs.getInt("ass_id"));
                MileStone m = md.getMileStoneByID(rs.getInt("milestone_id"));

                EvalCriteria e = new EvalCriteria(rs.getInt("criteria_id"), a, m, rs.getString("criteria_name"), rs.getBoolean("is_team_eval"), rs.getInt("eval_weight"), rs.getInt("max_loc"), rs.getBoolean("status"), rs.getString("description"));

                return e;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<EvalCriteria> pagingCriteria(int start, int end) {
        ArrayList<EvalCriteria> list = new ArrayList<>();
        String sql = "select * from eval_criteria order by criteria_id limit ? , ? ;";
        AssignmentDAO ad = new AssignmentDAO();
        MileStoneDAO md = new MileStoneDAO();

        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, start);
            st.setInt(2, end);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                MileStone m = md.getMileStoneByID(rs.getInt("milestone_id"));
                Assignment a = ad.getAssByID(rs.getInt("ass_id"));
                EvalCriteria e = new EvalCriteria(rs.getInt("criteria_id"), a, m, rs.getString("criteria_name"), rs.getBoolean("is_team_eval"), rs.getInt("eval_weight"), rs.getInt("max_loc"), rs.getBoolean("status"), rs.getString("description"));
                list.add(e);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<EvalCriteria> pagingCriteriaMileIdNull(int start, int end) {
        ArrayList<EvalCriteria> list = new ArrayList<>();
        String sql = "select * from eval_criteria where milestone_id is not null order by criteria_id limit ? , ? ;";
        AssignmentDAO ad = new AssignmentDAO();
        MileStoneDAO md = new MileStoneDAO();

        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, start);
            st.setInt(2, end);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                MileStone m = md.getMileStoneByID(rs.getInt("milestone_id"));
                Assignment a = ad.getAssByID(rs.getInt("ass_id"));
                EvalCriteria e = new EvalCriteria(rs.getInt("criteria_id"), a, m, rs.getString("criteria_name"), rs.getBoolean("is_team_eval"), rs.getInt("eval_weight"), rs.getInt("max_loc"), rs.getBoolean("status"), rs.getString("description"));
                list.add(e);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<EvalCriteria> searchCriteria(String search) {
        ArrayList<EvalCriteria> list = new ArrayList<>();
        String sql = "select * from eval_criteria where criteria_name like ?";
        AssignmentDAO ad = new AssignmentDAO();
        MileStoneDAO md = new MileStoneDAO();

        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, "%" + search + "%");
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                MileStone m = md.getMileStoneByID(rs.getInt("milestone_id"));

                Assignment a = ad.getAssByID(rs.getInt("ass_id"));
                EvalCriteria e = new EvalCriteria(rs.getInt("criteria_id"), a, m, rs.getString("criteria_name"), rs.getBoolean("is_team_eval"), rs.getInt("eval_weight"), rs.getInt("max_loc"), rs.getBoolean("status"), rs.getString("description"));
                list.add(e);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void addCriteria(int ass_id, String criteria_name, int is_team_eval, int max_loc, int eval_weight, int status, String description) {
        String sql = "INSERT INTO `project_swp_391`.`eval_criteria`\n"
                + "(\n"
                + "`ass_id`,\n"
                + "`criteria_name`,\n"
                + "`is_team_eval`,\n"
                + "`eval_weight`,\n"
                + "`max_loc`,\n"
                + "`status`,\n"
                + "`description`)\n"
                + "VALUES\n"
                + "(?,?,?,?,?,?,?,?);";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, ass_id);
            st.setString(2, criteria_name);
            st.setInt(3, is_team_eval);
            st.setInt(4, eval_weight);
            st.setInt(5, max_loc);
            st.setInt(6, status);
            st.setString(7, description);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void classAddCriteria( int milestone_id, String criteria_name, int is_team_eval, int max_loc, int eval_weight, int status, String description) {
        String sql = "INSERT INTO `project_swp_391`.`eval_criteria`\n"
                + "(\n"
                
                + "`criteria_name`,\n"
                + "`is_team_eval`,\n"
                + "`eval_weight`,\n"
                + "`max_loc`,\n"
                + "`status`,\n"
                + "`description`,\n"
                + "`milestone_id`)"
                + "VALUES\n"
                + "(?,?,?,?,?,?,?);";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
//            st.setInt(1, ass_id);
            st.setString(1, criteria_name);
            st.setInt(2, is_team_eval);
            st.setInt(3, eval_weight);
            st.setInt(4, max_loc);
            st.setInt(5, status);
            st.setString(6, description);
            st.setInt(7, milestone_id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateCriteria(int criteria_id, int ass_id, int milestone_id, String criteria_name, int is_team_eval, int max_loc, int eval_weight, int status, String description) {
        String sql = "UPDATE `project_swp_391`.`eval_criteria`\n"
                + "SET\n"
                + "`ass_id` = ?,\n"
                + "`milestone_id` = ?,\n"
                + "`criteria_name` = ?,\n"
                + "`is_team_eval` = ?,\n"
                + "`eval_weight` = ?,\n"
                + "`max_loc` = ?,\n"
                + "`status` = ?,\n"
                + "`description` = ?\n"
                + "WHERE `criteria_id` =?;";

        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, ass_id);
            st.setInt(2, milestone_id);
            st.setString(3, criteria_name);
            st.setInt(4, is_team_eval);
            st.setInt(5, eval_weight);
            st.setInt(6, max_loc);
            st.setInt(7, status);
            st.setString(8, description);
            st.setInt(9, criteria_id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateClassCriteria(int criteria_id, String criteria_name, int is_team_eval, int max_loc, int eval_weight, int status, String description) {
        String sql = "UPDATE `project_swp_391`.`eval_criteria`\n"
                + "SET\n"
                + "`criteria_name` = ?,\n"
                + "`is_team_eval` = ?,\n"
                + "`eval_weight` = ?,\n"
                + "`max_loc` = ?,\n"
                + "`status` = ?,\n"
                + "`description` = ?\n"
                + "WHERE `criteria_id` =?;";

        try {
            PreparedStatement st = getConnection().prepareStatement(sql);

            st.setString(1, criteria_name);
            st.setInt(2, is_team_eval);
            st.setInt(3, eval_weight);
            st.setInt(4, max_loc);
            st.setInt(5, status);
            st.setString(6, description);
            st.setInt(7, criteria_id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteCriteria(int id) {
        String sql = "delete from eval_criteria where criteria_id=?";

        try {

            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public static void main(String[] args) {
        EvalCriteriaDAO e = new EvalCriteriaDAO();
        e.classAddCriteria( 1, "Hoang Minhgadad", 1, 700, 700, 1, "null");
//        e.updateClassCriteria(1, "ada", 1, 100, 100, 1, "add");
//        ArrayList<EvalCriteria> list = e.getCriteriaMileIdNotNull();
//        ArrayList<EvalCriteria> list = e.sort("SELECT *\n"
//                + "FROM eval_criteria\n"
//                + "ORDER BY criteria_name asc ;");
//
//        for (EvalCriteria criteria : list) {
//            System.out.println(criteria.getCriteria_name());
//
//        }
    }

    public void changeStatus(int id_eval, int status) {
        String sql = "UPDATE `project_swp_391`.`eval_criteria` SET `status` = ? WHERE (`criteria_id` = ?);";

        try {

            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, status);
            st.setInt(2, id_eval);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<EvalCriteria> sort(String sql) {
        ArrayList<EvalCriteria> list = new ArrayList<>();

        AssignmentDAO ad = new AssignmentDAO();
        MileStoneDAO md = new MileStoneDAO();

        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                Assignment a = ad.getAssByID(rs.getInt("ass_id"));
                MileStone m = md.getMileStoneByID(rs.getInt("milestone_id"));
                EvalCriteria e = new EvalCriteria(rs.getInt("criteria_id"), a, m, rs.getString("criteria_name"), rs.getBoolean("is_team_eval"), rs.getInt("eval_weight"), rs.getInt("max_loc"), rs.getBoolean("status"), rs.getString("description"));
                list.add(e);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public ArrayList<EvalCriteria> getCriteriaByAssignmentID(int ass_id) {
        ArrayList<EvalCriteria> list = new ArrayList<>();

        AssignmentDAO ad = new AssignmentDAO();
        MileStoneDAO md = new MileStoneDAO();
        String sql = "SELECT * FROM project_swp_391.eval_criteria where ass_id = ?;";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, ass_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                Assignment a = ad.getAssByID(rs.getInt("ass_id"));
                MileStone m = md.getMileStoneByID(rs.getInt("milestone_id"));
                EvalCriteria e = new EvalCriteria(rs.getInt("criteria_id"), a, m, rs.getString("criteria_name"), rs.getBoolean("is_team_eval"), rs.getInt("eval_weight"), rs.getInt("max_loc"), rs.getBoolean("status"), rs.getString("description"));
                list.add(e);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }
}
