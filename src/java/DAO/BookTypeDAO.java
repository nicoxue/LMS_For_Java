/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Form.BookTypeForm;
import datesource.DBManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

/**
 *
 * @author JIAJUN XUE <nicoxue0324@gmail.com>
 */
public class BookTypeDAO {

    private DBManager conn = new DBManager();

    //select data
    public Collection query(String str) {
        BookTypeForm bookTypeForm = null;
        Collection bookTypeColl = new ArrayList();
        String sql = "";
        if (str != "all" && str != null && str != "") {
            sql = "select * from tb_bookType where " + str + "";
        } else {
            sql = "select * from tb_bookType";
        }
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                bookTypeForm = new BookTypeForm();
                bookTypeForm.setId(Integer.valueOf(rs.getString(1)));
                bookTypeForm.setTypeName(rs.getString(2));
                bookTypeForm.setDays(rs.getInt(3));
                bookTypeColl.add(bookTypeForm);
                System.out.print(bookTypeForm.getTypeName());
            }
        } catch (SQLException ex) {
        }
        conn.close();
        return bookTypeColl;
    }

    //modify data
    public BookTypeForm queryM(BookTypeForm bookTypeForm) {
        BookTypeForm bookTypeForm1 = null;
        String sql = "select * from tb_bookType where id=" + bookTypeForm.getId() + "";
        System.out.println("MODIFY TYPE SQL：" + sql);
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                bookTypeForm1 = new BookTypeForm();
                bookTypeForm1.setId(Integer.valueOf(rs.getString(1)));
                bookTypeForm1.setTypeName(rs.getString(2));
                bookTypeForm1.setDays(rs.getInt(3));
            }
        } catch (SQLException ex) {
        }
        conn.close();
        return bookTypeForm1;
    }

    //add data
    public int insert(BookTypeForm bookTypeForm) {
        String sql1 = "SELECT * FROM tb_bookType WHERE typename='" + bookTypeForm.getTypeName() + "'";
        ResultSet rs = conn.executeQuery(sql1);
        String sql = "";
        int falg = 0;
        try {
            if (rs.next()) {
                falg = 2;
            } else {
                sql = "Insert into tb_bookType (typename,days) values('" + bookTypeForm.getTypeName() + "',"
                        + bookTypeForm.getDays() + ")";
                falg = conn.executeUpdate(sql);
                System.out.println("ADD BOOK TYPE SQL：" + sql);
                conn.close();
            }
        } catch (SQLException ex) {
            falg = 0;
        }
        System.out.println("falg:" + falg);
        return falg;
    }

    //update data
    public int update(BookTypeForm bookTypeForm) {
        String sql = "Update tb_bookType set typename='" + bookTypeForm.getTypeName() + "',days="
                + bookTypeForm.getDays() + " where id=" + bookTypeForm.getId() + "";
        int falg = conn.executeUpdate(sql);
        System.out.println("MODIFY SQL：" + sql);
        conn.close();
        return falg;
    }

    //delete data
    public int delete(BookTypeForm bookTypeForm) {
        String sql_1 = "SELECT * FROM tb_bookinfo WHERE typeid=" + bookTypeForm.getId() + "";
        ResultSet rs = conn.executeQuery(sql_1);
        int falg = 0;
        try {
            if (!rs.next()) {
                String sql = "Delete from tb_bookType where id=" + bookTypeForm.getId() + "";
                falg = conn.executeUpdate(sql);
                System.out.println("DELETE SQL：" + sql);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return falg;
    }
}
