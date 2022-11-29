/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author Giang Dong PC
 */
public class Schedule {

    private int schedule_id;
    private Class classId;
    private Setting slot;
    private Setting room;
    private Date date;
    private Time from_time;
    private Time to_time;
    private String topic;
    private boolean status;

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    public int getSchedule_id() {
        return schedule_id;
    }

    public void setSchedule_id(int schedule_id) {
        this.schedule_id = schedule_id;
    }

    public Class getClass_() {
        return classId;
    }

    public void setClass_(Class class_) {
        this.classId = class_;
    }

    public Class getClassId() {
        return classId;
    }

    public void setClassId(Class classId) {
        this.classId = classId;
    }

    public Setting getSlot() {
        return slot;
    }

    public void setSlot(Setting slot) {
        this.slot = slot;
    }

    public Setting getRoom() {
        return room;
    }

    public void setRoom(Setting room) {
        this.room = room;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getFrom_time() {
        return from_time;
    }

    public void setFrom_time(Time from_time) {
        this.from_time = from_time;
    }

    public Time getTo_time() {
        return to_time;
    }

    public void setTo_time(Time to_time) {
        this.to_time = to_time;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

}
