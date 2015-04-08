/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Form.BookCaseForm;
import datesource.DBManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

/**
 *
 * @author JIAJUN XUE <nicoxue0324@gmail.com>
 */
public class BookCaseDAO {

    private DBManager conn = new DBManager();

    //select data
    public Collection query(String str) {
        BookCaseForm bookCaseForm1 = null;
        Collection bookcaseColl = new ArrayList();
        String sql = "";
        if (str != "all" && str != null && str != "") {
            sql = "select * from tb_bookcase where " + str + "";
        } else {
            sql = "select * from tb_bookcase";
        }
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                bookCaseForm1 = new BookCaseForm();
                bookCaseForm1.setId(Integer.valueOf(rs.getString(1)));
                bookCaseForm1.setName(rs.getString(2));
                bookcaseColl.add(bookCaseForm1);
            }
        } catch (SQLException ex) {
        }
        conn.close();
        return bookcaseColl;
    }

    //modify data
    public BookCaseForm queryM(BookCaseForm bookCaseForm) {
        BookCaseForm bookCaseForm1 = null;
        String sql = "select * from tb_bookcase where id=" + bookCaseForm.getId() + "";
        System.out.println("MODIFY SHELF SQL：" + sql);
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                bookCaseForm1 = new BookCaseForm();
                bookCaseForm1.setId(Integer.valueOf(rs.getString(1)));
                bookCaseForm1.setName(rs.getString(2));
            }
        } catch (SQLException ex) {
        }
        conn.close();
        return bookCaseForm1;
    }

    //add data
    public int insert(BookCaseForm bookCaseForm) {
        String sql1 = "SELECT * FROM tb_bookcase WHERE name='" + bookCaseForm.getName() + "'";
        ResultSet rs = conn.executeQuery(sql1);
        String sql = "";
        int falg = 0;
        try {
            if (rs.next()) {
                falg = 2;
            } else {
                sql = "Insert into tb_bookcase (name) values('" + bookCaseForm.getName() + "')";
                falg = conn.executeUpdate(sql);
                System.out.println("ADD SHELF INFO SQL：" + sql);
                conn.close();
            }
        } catch (SQLException ex) {
            falg = 0;
        }
        System.out.println("falg:" + falg);
        return falg;
    }

    //update data
    public int update(BookCaseForm bookCaseForm) {
        String sql = "Update tb_bookcase set name='" + bookCaseForm.getName() + "' where id=" + bookCaseForm.getId() + "";
        int falg = conn.executeUpdate(sql);
        System.out.println("UPDATE DATA SQL：" + sql);
        conn.close();
        return falg;
    }

    //delete data
    public int delete(BookCaseForm bookCaseForm) {
        String sql_1 = "SELECT * FROM tb_bookcase WHERE bookcase=" + bookCaseForm.getId() + "";
        ResultSet rs = conn.executeQuery(sql_1);
        int falg = 0;
        try {
            if (!rs.next()) {
                String sql = "Delete from tb_bookcase where id=" + bookCaseForm.getId() + "";
                falg = conn.executeUpdate(sql);
                System.out.println("DELETE DATA SQL：" + sql);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return falg;
    }
}
