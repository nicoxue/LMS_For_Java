/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Form.BookForm;
import Form.BorrowForm;
import Form.ReaderForm;
import datesource.DBManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

/**
 *
 * @author JIAJUN XUE <nicoxue0324@gmail.com>
 */
public class BorrowDAO {

    private DBManager conn = new DBManager();

    public int insert() {
        String sql = "INSERT INTO tb_borrow (bookid) vlaues(1) ";
        int ret = conn.executeUpdate(sql);
        return ret;
    }

    //*****************************borrow books******************************
    public int insertBorrow(ReaderForm readerForm, BookForm bookForm) {
        Date dateU = new Date();
        java.sql.Date date = new java.sql.Date(dateU.getTime());
        String sql1 = "select days from tb_bookinfo where id=" + bookForm.getId() + "";
        ResultSet rs = conn.executeQuery(sql1);
        int days = 0;
        try {
            if (rs.next()) {
                days = rs.getInt(1);
            }
        } catch (SQLException ex) {
        }
        //caculator return time
        String date_str = String.valueOf(date);
        String dd = date_str.substring(8, 10);
        String DD = date_str.substring(0, 8) + String.valueOf(Integer.parseInt(dd) + days);
        java.sql.Date backTime = java.sql.Date.valueOf(DD);

        String sql = "Insert into tb_borrow (readerid,bookid,borrowTime,backTime) values("
                + readerForm.getId() + "," + bookForm.getId() + ",'" + date + "','" + backTime + "')";
        int falg = conn.executeUpdate(sql);
        System.out.println("Add Borrow Info SQL：" + sql);
        conn.close();
        return falg;
    }

    //*************************************borrow more*********************************
    public int renew(int id) {
        String sql0 = "SELECT bookid FROM tb_borrow WHERE id=" + id + "";
        ResultSet rs1 = conn.executeQuery(sql0);
        int flag = 0;
        try {
            if (rs1.next()) {
                Date dateU = new Date();
                java.sql.Date date = new java.sql.Date(dateU.getTime());
                String sql1 = "select days from tb_bookinfo where b.id=" + rs1.getInt(1) + "";
                ResultSet rs = conn.executeQuery(sql1);
                int days = 0;
                try {
                    if (rs.next()) {
                        days = rs.getInt(1);
                    }
                } catch (SQLException ex) {
                }
                //caculator return time
                String date_str = String.valueOf(date);
                String dd = date_str.substring(8, 10);
                String DD = date_str.substring(0, 8)
                        + String.valueOf(Integer.parseInt(dd) + days);
                java.sql.Date backTime = java.sql.Date.valueOf(DD);

                String sql = "UPDATE tb_borrow SET backtime='" + backTime
                        + "' where id=" + id + "";
                flag = conn.executeUpdate(sql);
            }
        } catch (Exception ex1) {
        }
        conn.close();
        return flag;
    }

    //*************************************book return*********************************
    public int back(int id) {
        String sql0 = "SELECT readerid,bookid FROM tb_borrow WHERE id=" + id + "";
        ResultSet rs1 = conn.executeQuery(sql0);
        int flag = 0;
        try {
            if (rs1.next()) {
                Date dateU = new Date();
                java.sql.Date date = new java.sql.Date(dateU.getTime());
                int readerid = rs1.getInt(1);
                int bookid = rs1.getInt(2);
                String sql1 = "INSERT INTO tb_giveback (readerid,bookid,backTime) VALUES("
                        + readerid + "," + bookid + ",'" + date + "')";
                int ret = conn.executeUpdate(sql1);
                if (ret == 1) {
                    String sql2 = "UPDATE tb_borrow SET ifback=1 where id=" + id
                            + "";
                    flag = conn.executeUpdate(sql2);
                } else {
                    flag = 0;
                }
            }
        } catch (Exception ex1) {
        }
        conn.close();
        return flag;
    }

    //*****************************borrow info***********************
    public Collection borrowinfo(String str) {
        String sql = "select borr.*,book.bookname,book.price,r.barcode "
                + "from tb_borrow as borr left join tb_bookinfo book on borr.bookid=book.id "
                + "join tb_reader r on borr.readerid=r.id where borr.ifback = 0 and r.barcode='" + str + "'";
        ResultSet rs = conn.executeQuery(sql);
        Collection coll = new ArrayList();
        BorrowForm form = null;
        try {
            while (rs.next()) {
                form = new BorrowForm();
                form.setId(Integer.valueOf(rs.getInt(1)));
                form.setBorrowTime(rs.getString(4));
                form.setBackTime(rs.getString(5));
                form.setBookName(rs.getString(8));
                form.setPrice(Float.valueOf(rs.getFloat(9)));
                coll.add(form);
            }
        } catch (SQLException ex) {
            System.out.println("Borrow Info：" + ex.getMessage());
        }
        conn.close();
        return coll;
    }

    //*************************borrow query******************************************
    public Collection borrowQuery(String strif) {
        String sql = "";
        if (strif != "all" && strif != null && strif != "") {
            sql = "select borr.borrowTime,borr.backTime,book.barcode,book.bookname,r.name readername,"
                    + "r.barcode readerbarcode,borr.ifback from tb_borrow borr join tb_bookinfo book "
                    + "on book.id=borr.bookid join tb_reader r on r.id=borr.readerid where borr." + strif + "";
        } else {
            sql = "select borr.borrowTime,borr.backTime,book.barcode,book.bookname,r.name readername,"
                    + "r.barcode readerbarcode,borr.ifback from tb_borrow borr join tb_bookinfo book "
                    + "on book.id=borr.bookid join tb_reader r on r.id=borr.readerid";
        }
        ResultSet rs = conn.executeQuery(sql);
        System.out.println("Borrow Query SQL：" + sql);
        Collection coll = new ArrayList();
        BorrowForm form = null;
        try {
            while (rs.next()) {
                form = new BorrowForm();
                form.setBorrowTime(rs.getString(1));
                form.setBackTime(rs.getString(2));
                form.setBookBarcode(rs.getString(3));
                form.setBookName(rs.getString(4));
                form.setReaderName(rs.getString(5));
                form.setReaderBarcode(rs.getString(6));
                form.setIfBack(rs.getInt(7));
                coll.add(form);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        conn.close();
        return coll;
    }
}
