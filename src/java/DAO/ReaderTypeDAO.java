/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Form.ReaderTypeForm;
import datesource.DBManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

/**
 *
 * @author JIAJUN XUE <nicoxue0324@gmail.com>
 */
public class ReaderTypeDAO {

    private DBManager conn = new DBManager();

    //select data
    public Collection query(String strif) {
        ReaderTypeForm readerTypeForm = null;
        Collection readerTypeColl = new ArrayList();
        String sql = "";
        if (strif != "all" && strif != null && strif != "") {
            sql = "select * from tb_readerType where " + strif + "";
        } else {
            sql = "select * from tb_readerType";
        }
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                readerTypeForm = new ReaderTypeForm();
                readerTypeForm.setId(Integer.valueOf(rs.getString(1)));
                readerTypeForm.setName(rs.getString(2));
                readerTypeForm.setNumber(rs.getInt(3));
                readerTypeColl.add(readerTypeForm);
            }
        } catch (SQLException ex) {
        }
        conn.close();
        return readerTypeColl;
    }
    
    //modify
    public ReaderTypeForm queryM(ReaderTypeForm readerTypeForm) {
        ReaderTypeForm readerTypeForm1 = null;
        String sql = "select * from tb_readerType where id=" + readerTypeForm.getId() + "";
        System.out.println("Modify SQL：" + sql);
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                readerTypeForm1 = new ReaderTypeForm();
                readerTypeForm1.setId(Integer.valueOf(rs.getString(1)));
                readerTypeForm1.setName(rs.getString(2));
                readerTypeForm1.setNumber(rs.getInt(3));
                System.out.println(rs.getInt(3));
            }
        } catch (SQLException ex) {
        }
        conn.close();
        return readerTypeForm1;
    }
    
    //add
    public int insert(ReaderTypeForm readerTypeForm) {
        String sql1 = "SELECT * FROM tb_readerType WHERE name='" + readerTypeForm.getName() + "'";
        ResultSet rs = conn.executeQuery(sql1);
        String sql = "";
        int falg = 0;
        try {
            if (rs.next()) {
                falg = 2;
            } else {
                sql = "Insert into tb_readerType (name,number) values('" + readerTypeForm.getName() + "'," 
                        + readerTypeForm.getNumber() + ")";
                falg = conn.executeUpdate(sql);
                System.out.println("Add Reader Type SQL：" + sql);
                conn.close();
            }
        } catch (SQLException ex) {
            falg = 0;
        }
        System.out.println("falg:" + falg);
        return falg;
    }

    //update
    public int update(ReaderTypeForm readerTypeForm) {
        String sql = "Update tb_readerType set name='" + readerTypeForm.getName() + "',number=" 
                + readerTypeForm.getNumber() + " where id=" + readerTypeForm.getId() + "";
        int falg = conn.executeUpdate(sql);
        System.out.println("Update Reader Type SQL：" + sql);
        conn.close();
        return falg;
    }
    
    //delete
    public int delete(ReaderTypeForm readerTypeForm) {
        String sql_1 = "SELECT * FROM tb_reader WHERE typeid=" + readerTypeForm.getId() + "";
        ResultSet rs = conn.executeQuery(sql_1);
        int flag = 0;
        try {
            if (!rs.next()) {
                String sql = "Delete from tb_readerType where id=" + readerTypeForm.getId() + "";
                flag = conn.executeUpdate(sql);
                System.out.println("Delete Reader Type SQL：" + sql);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

}
