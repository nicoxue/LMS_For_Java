/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Form.ReaderForm;
import datesource.DBManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

/**
 *
 * @author JIAJUN XUE <nicoxue0324@gmail.com>
 */
public class ReaderDAO {

    private DBManager conn = new DBManager();

    //select data
    public Collection query(String strif) {
        ReaderForm readerForm = null;
        Collection readerColl = new ArrayList();
        String sql = "";
        if (strif != "all" && strif != null && strif != "") {
            sql = "select * from tb_reader where " + strif + "";
        } else {
            sql = "select * from tb_reader";
        }
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                readerForm = new ReaderForm();
                readerForm.setId(Integer.valueOf(rs.getString(1)));
                readerForm.setName(rs.getString(2));
                readerForm.setSex(rs.getString(3));
                readerForm.setBarcode(rs.getString(4));
                readerForm.setVocation(rs.getString(5));
                readerForm.setBirthday(rs.getString(6));
                readerForm.setPaperType(rs.getString(7));
                readerForm.setPaperNO(rs.getString(8));
                readerForm.setTel(rs.getString(9));
                readerForm.setEmail(rs.getString(10));
                readerForm.setCreateDate(rs.getString(11));
                readerForm.setRemark(rs.getString(12));
                readerColl.add(readerForm);
            }
        } catch (SQLException ex) {
        }
        conn.close();
        return readerColl;
    }

    //modify
    public ReaderForm queryM(ReaderForm readerForm) {
        ReaderForm readerForm1 = null;
        String sql = "";
        if (readerForm.getId() != null) {
            sql = "select * from tb_reader where id=" + readerForm.getId() + "";
        } else if (readerForm.getBarcode() != null) {
            sql = "select * from tb_reader where barcode=" + readerForm.getBarcode() + "";
        }
        System.out.println("Modify Reader Info SQL：" + sql);
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                readerForm1 = new ReaderForm();
                readerForm1.setId(Integer.valueOf(rs.getString(1)));
                readerForm1.setName(rs.getString(2));
                readerForm1.setSex(rs.getString(3));
                readerForm1.setBarcode(rs.getString(4));
                readerForm1.setVocation(rs.getString(5));
                readerForm1.setBirthday(rs.getString(6));
                readerForm1.setPaperType(rs.getString(7));
                readerForm1.setPaperNO(rs.getString(8));
                readerForm1.setTel(rs.getString(9));
                readerForm1.setEmail(rs.getString(10));
                readerForm1.setCreateDate(rs.getString(11));
                readerForm1.setRemark(rs.getString(12));
                System.out.println(rs.getString(2));
            }
        } catch (SQLException ex) {
        }
        conn.close();
        return readerForm1;
    }

    //add Data
    public int insert(ReaderForm readerForm) {
        String sql1 = "SELECT * FROM tb_reader WHERE barcode='" + readerForm.getBarcode() + "'";
        ResultSet rs = conn.executeQuery(sql1);
        String sql = "";
        int falg = 0;
        try {
            if (rs.next()) {
                falg = 2;
            } else {
                sql = "Insert into tb_reader (name,sex,barcode,vocation,birthday,paperType,paperNO,tel,email,"
                        + "createDate,remark) values('" + readerForm.getName() + "','"
                        + readerForm.getSex() + "','" + readerForm.getBarcode() + "','" + readerForm.getVocation()
                        + "','" + readerForm.getBirthday() + "','" + readerForm.getPaperType() + "','"
                        + readerForm.getPaperNO() + "','" + readerForm.getTel() + "','" + readerForm.getEmail()
                        + "','" + readerForm.getCreateDate() + "','" + readerForm.getRemark() + "'," + ")";
                falg = conn.executeUpdate(sql);
                System.out.println("Add Reader Info SQL：" + sql);
                conn.close();
            }
        } catch (SQLException ex) {
            falg = 0;
        }
        System.out.println("falg:" + falg);
        return falg;
    }

    //update
    public int update(ReaderForm readerForm) {
        String sql = "Update tb_reader set sex='" + readerForm.getSex() + "',barcode='" + readerForm.getBarcode()
                + "',vocation='" + readerForm.getVocation() + "',birthday='" + readerForm.getBirthday()
                + "',paperType='" + readerForm.getPaperType() + "',paperNO='" + readerForm.getPaperNO()
                + "',tel='" + readerForm.getTel() + "',email='" + readerForm.getEmail() + "',remark='"
                + readerForm.getRemark() + " where id=" + readerForm.getId() + "";
        int falg = conn.executeUpdate(sql);
        System.out.println("Update Reader Info SQL：" + sql);
        conn.close();
        return falg;
    }

    //delete
    public int delete(ReaderForm readerForm) {
        String sql = "Delete from tb_reader where id=" + readerForm.getId() + "";
        int falg = conn.executeUpdate(sql);
        System.out.println("Delete Reader Info SQL：" + sql);
        return falg;
    }
}
