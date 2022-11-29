/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author NTA-PC
 */
public class Setting {

    private int setting_id;
    private int type_id;
    private String setting_value;
    private String display_order;
    private boolean status;
    private String description;
    private String setting_title;

    public Setting() {
    }

    public Setting(int setting_id, int type_id, String setting_value, String display_order, boolean status, String description, String setting_title) {
        this.setting_id = setting_id;
        this.type_id = type_id;
        this.setting_value = setting_value;
        this.display_order = display_order;
        this.status = status;
        this.description = description;
        this.setting_title = setting_title;
    }

    public int getSetting_id() {
        return setting_id;
    }

    public void setSetting_id(int setting_id) {
        this.setting_id = setting_id;
    }

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    public String getSetting_value() {
        return setting_value;
    }

    public void setSetting_value(String setting_value) {
        this.setting_value = setting_value;
    }

    public String getDisplay_order() {
        return display_order;
    }

    public void setDisplay_order(String display_order) {
        this.display_order = display_order;
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

    public String getSetting_title() {
        return setting_title;
    }

    public void setSetting_title(String setting_title) {
        this.setting_title = setting_title;
    }

}
