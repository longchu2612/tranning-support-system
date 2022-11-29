/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ACER
 */
public class EvalCriteria {

    private int criteria_id;
    private Assignment ass_id;
    private MileStone milestone_id;
    private String criteria_name;
    private boolean is_team_eval;
    private int eval_weight;
    private int max_loc;
    private boolean status;
    private String description;

    public EvalCriteria() {
    }

    public Assignment getAss_id() {
        return ass_id;
    }

    public void setAss_id(Assignment ass_id) {
        this.ass_id = ass_id;
    }

    public EvalCriteria(int criteria_id, Assignment ass_id, MileStone milestone_id, String criteria_name, boolean is_team_eval, int eval_weight, int max_loc, boolean status, String description) {
        this.criteria_id = criteria_id;
        this.ass_id = ass_id;
        this.milestone_id = milestone_id;
        this.criteria_name = criteria_name;
        this.is_team_eval = is_team_eval;
        this.eval_weight = eval_weight;
        this.max_loc = max_loc;
        this.status = status;
        this.description = description;
    }

    

    

    public int getCriteria_id() {
        return criteria_id;
    }

    public void setCriteria_id(int criteria_id) {
        this.criteria_id = criteria_id;
    }

    public MileStone getMilestone_id() {
        return milestone_id;
    }

    public void setMilestone_id(MileStone milestone_id) {
        this.milestone_id = milestone_id;
    }

    

    

    public String getCriteria_name() {
        return criteria_name;
    }

    public void setCriteria_name(String criteria_name) {
        this.criteria_name = criteria_name;
    }

    public boolean isIs_team_eval() {
        return is_team_eval;
    }

    public void setIs_team_eval(boolean is_team_eval) {
        this.is_team_eval = is_team_eval;
    }

    public int getEval_weight() {
        return eval_weight;
    }

    public void setEval_weight(int eval_weight) {
        this.eval_weight = eval_weight;
    }

    public int getMax_loc() {
        return max_loc;
    }

    public void setMax_loc(int max_loc) {
        this.max_loc = max_loc;
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
