/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Giang Dong PC
 */
public class Class {
    private int class_id;
    private Subject subject;
    private String class_code;
    private int combo_id;
    private User trainer;
    private int term_id;
    private boolean status;
    private String description;

    public int getClass_id() {
        return class_id;
    }

    public Class(int class_id, Subject subject, String class_code, int combo_id, User trainer, int term_id, boolean status, String description) {
        this.class_id = class_id;
        this.subject = subject;
        this.class_code = class_code;
        this.combo_id = combo_id;
        this.trainer = trainer;
        this.term_id = term_id;
        this.status = status;
        this.description = description;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    

    public Class() {
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    public String getClass_code() {
        return class_code;
    }

    public void setClass_code(String class_code) {
        this.class_code = class_code;
    }

    public int getCombo_id() {
        return combo_id;
    }

    public void setCombo_id(int combo_id) {
        this.combo_id = combo_id;
    }

    public User getTrainer() {
        return trainer;
    }

    public void setTrainer(User trainer) {
        this.trainer = trainer;
    }

    public int getTerm_id() {
        return term_id;
    }

    public void setTerm_id(int term_id) {
        this.term_id = term_id;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
}
