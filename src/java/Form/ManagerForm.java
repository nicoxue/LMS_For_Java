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
public class ManagerForm extends ActionForm {

    private Integer id = new Integer(-1);  //manager id
    private String name = "";   //manager name
    private String pwd = "";  //manager password
    private int sysset = 0;  //system set
    private int readerset = 0;   //reader set
    private int bookset = 0;   //book set
    private int borrowback = 0;   //borrowback set 
    private int sysquery = 0;    //set query

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setSysset(int sysset) {
        this.sysset = sysset;
    }

    public int getSysset() {
        return sysset;
    }

    public int getReaderset() {
        return readerset;
    }

    public void setReaderset(int readerset) {
        this.readerset = readerset;
    }

    public void setBookset(int bookset) {
        this.bookset = bookset;
    }

    public int getBookset() {
        return bookset;
    }

    public void setBorrowback(int borrowback) {
        this.borrowback = borrowback;
    }

    public int getBorrowback() {
        return borrowback;
    }

    public void setSysquery(int sysquery) {
        this.sysquery = sysquery;
    }

    public int getSysquery() {
        return sysquery;
    }
}
