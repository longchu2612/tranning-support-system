/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ACER
 */
public class Assignment {
    private int ass_id;
    private String title;
    private String ass_body;
    private Subject subject_id;
    private boolean is_team_work;
    private boolean is_ongoing;
    private boolean status;

    public Assignment() {
    }

    public Assignment(int ass_id, String title, String ass_body, Subject subject_id, boolean is_team_work, boolean is_ongoing, boolean status) {
        this.ass_id = ass_id;
        this.title = title;
        this.ass_body = ass_body;
        this.subject_id = subject_id;
        this.is_team_work = is_team_work;
        this.is_ongoing = is_ongoing;
        this.status = status;
    }

    public int getAss_id() {
        return ass_id;
    }

    public void setAss_id(int ass_id) {
        this.ass_id = ass_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAss_body() {
        return ass_body;
    }

    public void setAss_body(String ass_body) {
        this.ass_body = ass_body;
    }

    public Subject getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(Subject subject_id) {
        this.subject_id = subject_id;
    }

    public boolean isIs_team_work() {
        return is_team_work;
    }

    public void setIs_team_work(boolean is_team_work) {
        this.is_team_work = is_team_work;
    }

    public boolean isIs_ongoing() {
        return is_ongoing;
    }

    public void setIs_ongoing(boolean is_ongoing) {
        this.is_ongoing = is_ongoing;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    
    
    
}
