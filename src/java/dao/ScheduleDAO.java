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
import model.Room;
import model.Schedule;
import model.Class;
import model.Setting;
import model.Slot;

/**
 *
 * @author Giang Dong PC
 */
public class ScheduleDAO extends ConnectionDAO {

    private PreparedStatement prepared_statement;
    private String sql;
    private ResultSet result_set;

    public ArrayList<Schedule> getScheduleList(int userId, int classId, int sortElement, boolean order, int page, String search) {
        ArrayList<Schedule> schedules = new ArrayList<>();
        sql = "select schedule_id, sch.training_date, sch.topic , from_time, to_time, st2.setting_value as room_name, st1.setting_value as slot_name, sch.status from schedule as sch \n"
                + "	inner join setting as st1 \n"
                + "		on sch.slot_id = st1.setting_id \n"
                + "	inner join setting as st2\n"
                + "		on st2.setting_id = sch.room_id\n"
                + "	inner join class as cl \n"
                + "		on cl.class_id = sch.class_id\n"
                + "		and cl.trainer_id = ?\n"
                + "        or cl.supporter_id = ?\n"
                + "	where sch.class_id = ? ";
        int count = 0;
        if (search != null) {
            sql += " and( r.room_name like ? or topic like ?)";
        }
        sql += " order by ";
        switch (sortElement) {
            case 0:
                sql += "st1.setting_value";
                break;
            case 1:
                sql += "sch.topic";
                break;
            case 2:
                sql += "sch.training_date";
                break;
            case 3:
                sql += "from_time";
                break;
            case 4:
                sql += "to_time";
                break;
            case 5:
                sql += "st2.setting_value";
                break;
            default:
                sql += "sch.schedule_id";
                break;
        }
        if (order) {
            sql += " ASC ";
        } else {
            sql += " DESC ";
        }
        sql += "LIMIT 10 OFFSET ?";
        try {
            prepared_statement = getConnection().prepareStatement(sql);
            prepared_statement.setInt(1, userId);
            prepared_statement.setInt(2, userId);
            prepared_statement.setInt(3, classId);
         
            if (search != null) {
                prepared_statement.setString(4, "%" + search + "%");
                prepared_statement.setString(5, "%" + search + "%");
                count = 6;
            } else {
                count = 4;
            }
            prepared_statement.setInt(count, (page - 1) * 10);
            result_set = prepared_statement.executeQuery();
            System.out.println(prepared_statement);
            while (result_set.next()) {
                
                Schedule schedule = new Schedule();
                schedule.setSchedule_id(result_set.getInt("schedule_id"));
                schedule.setDate(result_set.getDate("training_date"));
                schedule.setFrom_time(result_set.getTime("from_time"));
                schedule.setTo_time(result_set.getTime("to_time"));
                schedule.setStatus(result_set.getBoolean("status"));
                Setting room = new Setting();
                room.setSetting_value(result_set.getString("room_name"));
                schedule.setRoom(room);
                Setting slot = new Setting();
                slot.setSetting_value(result_set.getString("slot_name"));
                schedule.setSlot(slot);
                schedule.setTopic(result_set.getString("topic"));
                schedules.add(schedule);
            }
        } catch (Exception e) {

        }
        return schedules;
    }

    public int countPage(int classId, String search) {
        int page = 1;
        try {
            sql = "SELECT count(*) as 'schedule' FROM schedule";
            if (search != null) {
                sql += "inner join room as r\n"
                        + "	on r.room_id = sch.room_id\n"
                        + "where class_id = ? and ( r.room_name like ? or topic like ?)";
            } else {
                sql += "where class_id = ?";
            }
            prepared_statement = getConnection().prepareStatement(sql);
            prepared_statement.setInt(1, classId);
            if (search != null) {
                prepared_statement.setString(2, search);
                prepared_statement.setString(3, search);
            }
            result_set = prepared_statement.executeQuery();

            while (result_set.next()) {
                page = result_set.getInt("schedule");
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

    

    public Schedule getSchedule(int id) {
        Schedule schedule = new Schedule();
        sql = "select schedule_id, sch.training_date, sch.topic , from_time, to_time, room_id, slot_id, cl.class_code, sch.status from schedule as sch \n"
                + "	inner join class as cl \n"
                + "		on cl.class_id = sch.class_id"
                + "             and sch.schedule_id = ?\n";
        try {
            prepared_statement = getConnection().prepareStatement(sql);
            prepared_statement.setInt(1, id);
            result_set = prepared_statement.executeQuery();
            System.out.println(prepared_statement);
            System.out.println(prepared_statement.toString());
            while (result_set.next()) {
                schedule.setSchedule_id(result_set.getInt("schedule_id"));
                Class classs = new Class();
                classs.setClass_code(result_set.getString("class_code"));
                schedule.setClass_(classs);
                schedule.setDate(result_set.getDate("training_date"));
                schedule.setFrom_time(result_set.getTime("from_time"));
                schedule.setTo_time(result_set.getTime("to_time"));
                Setting room = new Setting();
                room.setSetting_id(result_set.getInt("room_id"));
                schedule.setRoom(room);
                Setting slot = new Setting();
                slot.setSetting_id(result_set.getInt("slot_id"));
                schedule.setSlot(slot);
                schedule.setStatus(result_set.getBoolean("status"));
                schedule.setTopic(result_set.getString("topic"));

            }
        } catch (Exception exception) {
        }
        return schedule;
    }

    public ArrayList<Room> getRoomList() {
        ArrayList<Room> rooms = new ArrayList<>();
        try {
            sql = "SELECT room_id, room_name FROM room;";
            prepared_statement = getConnection().prepareStatement(sql);
            result_set = prepared_statement.executeQuery();
            while (result_set.next()) {
                Room room = new Room();
                room.setRoom_id(result_set.getInt("room_id"));
                room.setRoom_name(result_set.getString("room_name"));
                rooms.add(room);
            }
        } catch (Exception exception) {
        }
        return rooms;
    }

    public void updateSchedule(Schedule schedule) {
        sql = "UPDATE `schedule`\n"
                + "SET\n"
                + "	`topic` = ?,\n"
                + "	`slot_id` = ?,\n"
                + "	`room_id` = ?,\n"
                + "	`training_date` = ?,\n"
                + "	`from_time` = ?,\n"
                + "	`to_time` = ?,\n"
                + "	`status` = ?\n"
                + "WHERE `schedule_id` = ?;";
        try {
            getConnection().setAutoCommit(false);
            prepared_statement = getConnection().prepareStatement(sql);
            prepared_statement.setString(1, schedule.getTopic());
            prepared_statement.setInt(2, schedule.getSlot().getSetting_id());
            prepared_statement.setInt(3, schedule.getRoom().getSetting_id());
            prepared_statement.setDate(4, schedule.getDate());
            prepared_statement.setTime(5, schedule.getFrom_time());
            prepared_statement.setTime(6, false);
            prepared_statement.setBoolean(7, schedule.isStatus());
            prepared_statement.setInt(8, schedule.getSchedule_id());
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

    public void addSchedule(Schedule schedule) {
        sql = "INSERT INTO `schedule`\n"
                + "(`class_id`,\n"
                + "`slot_id`,\n"
                + "`room_id`,\n"
                + "`training_date`,\n"
                + "`from_time`,\n"
                + "`to_time`,\n"
                + "`status`,\n"
                + "`topic`)\n"
                + "VALUES\n"
                + "(?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?);";
        try {
            getConnection().setAutoCommit(false);
            prepared_statement = getConnection().prepareStatement(sql);
            prepared_statement.setInt(1, schedule.getClassId().getClass_id());
            prepared_statement.setInt(2, schedule.getSlot().getSetting_id());
            prepared_statement.setInt(3, schedule.getRoom().getSetting_id());
            prepared_statement.setDate(4, schedule.getDate());
            prepared_statement.setTime(5, schedule.getFrom_time());
            prepared_statement.setTime(6, schedule.getTo_time());
            prepared_statement.setBoolean(7, schedule.isStatus());
            prepared_statement.setString(8, schedule.getTopic());
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
