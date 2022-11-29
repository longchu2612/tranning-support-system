/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Subject;
import model.User;

/**
 *
 * @author Giang Dong PC
 */
public class SubjectDAO extends ConnectionDAO {

    private PreparedStatement prepared_statement;
    private String sql;
    private ResultSet result_set;

    public ArrayList<Subject> getSubjectListPaging(int page) {
        ArrayList<Subject> subject_list = new ArrayList<>();
        try {
            sql = "select subject_id, subject_code, subject_name, sj.manager_id, us1.fullname as 'manager_name', sj.expert_id, us2.fullname as 'expert_name', sj.status\n"
                    + "	from subject as sj \n"
                    + "    inner join user as us1 on sj.manager_id = us1.user_id\n"
                    + "    inner join user as us2 on sj.expert_id = us2.user_id\n"
                    + "	ORDER BY subject_id LIMIT 10 OFFSET ?;";
            prepared_statement = getConnection().prepareStatement(sql);
            prepared_statement.setInt(1, (page - 1) * 10);
            result_set = prepared_statement.executeQuery();
            while (result_set.next()) {
                Subject subject = new Subject();
                System.out.println("dao.SubjectDAO.getSubjectListPaging()");
                subject.setSubject_id(result_set.getInt("subject_id"));
                subject.setSubject_code(result_set.getString("subject_code"));
                subject.setSubject_name(result_set.getString("subject_name"));
                User manager = new User();
                manager.setId(result_set.getInt("manager_id"));
                manager.setFull_name(result_set.getString("manager_name"));
                subject.setManager(manager);
                User expert = new User();
                expert.setId(result_set.getInt("expert_id"));
                expert.setFull_name(result_set.getString("expert_name"));
                subject.setExpert(expert);
                subject.setStatus(result_set.getBoolean("status"));
                subject_list.add(subject);
            }
        } catch (Exception exception) {
        }
        return subject_list;
    }

    public int countPage() {
        int subject = 0;
        try {
            sql = "SELECT count(*) as 'Subject' FROM subject";
            prepared_statement = getConnection().prepareStatement(sql);
            result_set = prepared_statement.executeQuery();
            while (result_set.next()) {
                subject = result_set.getInt("Subject");
            }
        } catch (Exception exception) {
        }
        if (subject <= 10) {
            return 1;
        }
        if (subject % 10 == 0) {
            return subject / 10;
        }
        return subject / 10 + 1;
    }

//    public ArrayList<Subject> getAll() throws ClassNotFoundException {
//        ArrayList<Subject> list = new ArrayList<>();
//        String sql = "select * from subject";
//        try {
//            PreparedStatement st = getConnection().prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//
//            while (rs.next()) {
//                Subject s = new Subject();
//                s.setSubject_id(rs.getInt("subject_id"));
//                s.setSubject_code(rs.getString("subject_code"));
//                rs.getString("subject_name");
//                rs.getInt("manager_id");
//                rs.getInt("expert_id");
//                rs.getBoolean("status");
//                rs.getString("body");
//                list.add(s);
//            }
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//        return list;
//    }
    public ArrayList<Subject> getAll() {
        UserDAO ud = new UserDAO();
        ArrayList<Subject> list = new ArrayList<>();
        String sql = "select * from subject";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = ud.getUser(rs.getInt("manager_id"));
                Subject s = new Subject();
                s.setSubject_id(rs.getInt("subject_id"));
                s.setSubject_code(rs.getString("subject_code"));
                s.setSubject_name(rs.getString("subject_name"));
                s.setManager(u);
                s.setExpert(u);
                s.setStatus(rs.getBoolean("status"));
                s.setBody(rs.getString("body"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Subject> search(int page, String search) {
        ArrayList<Subject> subject_list = new ArrayList<>();
        try {
            sql = "select subject_id, subject_code, subject_name, sj.manager_id, us1.fullname as 'manager_name', sj.expert_id, us2.fullname as 'expert_name', sj.status\n"
                    + "from (select * from subject where subject_code like ? or subject_name like ?) as sj inner join user as us1 on sj.manager_id = us1.user_id\n"
                    + "                    inner join user as us2 on sj.expert_id = us2.user_id\n"
                    + "                    ORDER BY subject_id LIMIT 10 OFFSET ?";
            prepared_statement = getConnection().prepareStatement(sql);
            prepared_statement.setString(1, "%" + search + "%");
            prepared_statement.setString(2, "%" + search + "%");
            prepared_statement.setInt(3, (page - 1) * 10);
            result_set = prepared_statement.executeQuery();
            while (result_set.next()) {
                Subject subject = new Subject();
                System.out.println("dao.SubjectDAO.getSubjectListPaging()");
                subject.setSubject_id(result_set.getInt("subject_id"));
                subject.setSubject_code(result_set.getString("subject_code"));
                subject.setSubject_name(result_set.getString("subject_name"));
                User manager = new User();
                manager.setId(result_set.getInt("manager_id"));
                manager.setFull_name(result_set.getString("manager_name"));
                subject.setManager(manager);
                User expert = new User();
                expert.setId(result_set.getInt("expert_id"));
                expert.setFull_name(result_set.getString("expert_name"));
                subject.setExpert(expert);
                subject.setStatus(result_set.getBoolean("status"));
                subject_list.add(subject);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return subject_list;
    }

    public int countPageSearch(String search) {
        int subject = 0;
        try {
            sql = "SELECT count(*) as'Subject' FROM subject subject_code like ? or subject_name like ?";
            prepared_statement = getConnection().prepareStatement(sql);
            prepared_statement.setString(1, "%" + search + "%");
            prepared_statement.setString(2, "%" + search + "%");
            result_set = prepared_statement.executeQuery();
            while (result_set.next()) {
                subject = result_set.getInt("Subject");
            }
        } catch (Exception e) {

        }
        if (subject <= 10) {
            return 1;
        }
        if (subject % 10 == 0) {
            return subject / 10;
        }
        return subject / 10 + 1;
    }

    public Subject getSubjectByID(int id) {
        String sql = "select * from subject where subject_id =?";

        try {
            prepared_statement = getConnection().prepareStatement(sql);
            prepared_statement.setInt(1, id);
            result_set = prepared_statement.executeQuery();

            if (result_set.next()) {
                UserDAO ud = new UserDAO();
                User u = ud.getUserById(id);

                Subject s = new Subject(result_set.getInt("subject_id"), result_set.getString("subject_code"), result_set.getString("subject_name"), u, u, result_set.getBoolean("status"), result_set.getString("body"));
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        SubjectDAO sd = new SubjectDAO();
        ArrayList<Subject> list = sd.getAll();
        for (Subject subject : list) {
            System.out.println(subject.getBody());
        }
    }

}
