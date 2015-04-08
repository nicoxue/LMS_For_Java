/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Form;

import org.apache.struts.action.ActionForm;

/**
 *
 * @author JIAJUN XUE <nicoxue0324@gmail.com>
 */
public class BookTypeForm extends ActionForm {

    private int days;
    private Integer id;
    private String typeName;

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setDays(int days) {
        this.days = days;
    }

    public int getDays() {
        return days;
    }

    public Integer getId() {
        return id;
    }

    public String getTypeName() {
        return typeName;
    }

}
