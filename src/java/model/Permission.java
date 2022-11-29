/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Giang Dong PC
 */
public class Permission {
    private Setting setting;
    private boolean get_all_data = false;
    private boolean can_delete = false;
    private boolean can_add = false;
    private boolean can_edit = false;

    public Setting getSetting() {
        return setting;
    }

    public void setSetting(Setting setting) {
        this.setting = setting;
    }

    public boolean isGet_all_data() {
        return get_all_data;
    }

    public void setGet_all_data(boolean get_all_data) {
        this.get_all_data = get_all_data;
    }

    public boolean isCan_delete() {
        return can_delete;
    }

    public void setCan_delete(boolean can_detele) {
        this.can_delete = can_detele;
    }

    public boolean isCan_add() {
        return can_add;
    }

    public void setCan_add(boolean can_add) {
        this.can_add = can_add;
    }

    public boolean isCan_edit() {
        return can_edit;
    }

    public void setCan_edit(boolean can_edit) {
        this.can_edit = can_edit;
    }
    
}
