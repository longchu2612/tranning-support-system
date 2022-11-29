/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author NTA-PC
 */
public class ClassUser {

    private Class class_id;
    private User user_id;
    private boolean status;
    private String note;
    private Date dropout_date;
    private String ongoing_eval;
    private String final_eval;
    private String topic_eval;

    public ClassUser() {
    }

    public Class getClass_id() {
        return class_id;
    }

    public void setClass_id(Class class_id) {
        this.class_id = class_id;
    }

    public User getUser_id() {
        return user_id;
    }

    public void setUser_id(User user_id) {
        this.user_id = user_id;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Date getDropout_date() {
        return dropout_date;
    }

    public void setDropout_date(Date dropout_date) {
        this.dropout_date = dropout_date;
    }

    public String getOngoing_eval() {
        return ongoing_eval;
    }

    public void setOngoing_eval(String ongoing_eval) {
        this.ongoing_eval = ongoing_eval;
    }

    public String getFinal_eval() {
        return final_eval;
    }

    public void setFinal_eval(String final_eval) {
        this.final_eval = final_eval;
    }

    public String getTopic_eval() {
        return topic_eval;
    }

    public void setTopic_eval(String topic_eval) {
        this.topic_eval = topic_eval;
    }

}
