/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author ACER
 */
public class MileStone {

    private int milestone_id;
    private Assignment ass;
    private Class class_id;
    private Date from_date;
    private Date to_date;
    private String title;
    private String ass_body;
    private String description;
    private boolean status;

    public MileStone() {
    }

    public MileStone(int milestone_id, Assignment ass, Class class_id, Date from_date, Date to_date, String title, String ass_body, String description, boolean status) {
        this.milestone_id = milestone_id;
        this.ass = ass;
        this.class_id = class_id;
        this.from_date = from_date;
        this.to_date = to_date;
        this.title = title;
        this.ass_body = ass_body;
        this.description = description;
        this.status = status;
    }

    public int getMilestone_id() {
        return milestone_id;
    }

    public void setMilestone_id(int milestone_id) {
        this.milestone_id = milestone_id;
    }

    public Assignment getAss() {
        return ass;
    }

    public void setAss(Assignment ass) {
        this.ass = ass;
    }

    public Class getClass_id() {
        return class_id;
    }

    public void setClass_id(Class class_id) {
        this.class_id = class_id;
    }

    public Date getFrom_date() {
        return from_date;
    }

    public void setFrom_date(Date from_date) {
        this.from_date = from_date;
    }

    public Date getTo_date() {
        return to_date;
    }

    public void setTo_date(Date to_date) {
        this.to_date = to_date;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    
}
