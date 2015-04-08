/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Form.BookForm;
import datesource.DBManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

/**
 *
 * @author JIAJUN XUE <nicoxue0324@gmail.com>
 */
public class BookDAO {

    private DBManager conn = new DBManager();

    //select data
    public Collection query(String str) {
        BookForm bookForm = null;
        Collection bookColl = new ArrayList();
        String sql = "";
        if (str != "all" && str != null && str != "") {
            sql = "select * from (select b.*,c.name as bookcaseName,p.pubname as publishing,t.typename from"
                    + " tb_bookinfo b left join tb_bookcase c on b.bookcase=c.id join tb_publishing p on b.ISBN=p.ISBN "
                    + "join tb_booktype t on b.typeid=t.id where b.del=0)  as book where book." + str + "'";
        } else {
            sql = "select b.*,c.name as bookcaseName,p.pubname as publishing,t.typename from tb_bookinfo b left join "
                    + "tb_bookcase c on b.bookcase=c.id join tb_publishing p on b.ISBN=p.ISBN "
                    + "join tb_booktype t on b.typeid=t.id where b.del=0";
        }
        System.out.println("SELECT BOOKS SQL：" + sql);
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                bookForm = new BookForm();
                bookForm.setBarcode(rs.getString(1));
                bookForm.setBookName(rs.getString(2));
                bookForm.setTypeId(rs.getInt(3));
                bookForm.setAuthor(rs.getString(4));
                bookForm.setTranslator(rs.getString(5));
                bookForm.setIsbn(rs.getString(6));
                bookForm.setPrice(Float.valueOf(rs.getString(7)));  //convert
                bookForm.setPage(rs.getInt(8));
                bookForm.setBookcaseid(rs.getInt(9));
                bookForm.setInTime(rs.getString(10));
                bookForm.setOperator(rs.getString(11));
                bookForm.setDel(rs.getInt(12));
                bookForm.setId(Integer.valueOf(rs.getString(13)));
                bookForm.setBookcaseName(rs.getString(14));
                bookForm.setPublishing(rs.getString(15));
                bookForm.setTypeName(rs.getString(16));
                bookColl.add(bookForm);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        conn.close();
        return bookColl;
    }

    //modify data
    public BookForm queryM(BookForm bookForm1) {
        BookForm bookForm = null;
        String sql = "select b.*,c.name as bookcaseName,p.pubname as publishing,t.typename from tb_bookinfo b "
                + "left join tb_bookcase c on b.bookcase=c.id join tb_publishing p on b.ISBN=p.ISBN "
                + "join tb_booktype t on b.typeid=t.id where b.id=" + bookForm1.getId() + "";
        System.out.println("MODIFY URL SQL：" + sql);
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                bookForm = new BookForm();
                bookForm.setBarcode(rs.getString(1));
                bookForm.setBookName(rs.getString(2));
                bookForm.setTypeId(rs.getInt(3));
                bookForm.setAuthor(rs.getString(4));
                bookForm.setTranslator(rs.getString(5));
                bookForm.setIsbn(rs.getString(6));
                bookForm.setPrice(Float.valueOf(rs.getString(7)));  //convert
                bookForm.setPage(rs.getInt(8));
                bookForm.setBookcaseid(rs.getInt(9));
                bookForm.setInTime(rs.getString(10));
                bookForm.setOperator(rs.getString(11));
                bookForm.setDel(rs.getInt(12));
                bookForm.setId(Integer.valueOf(rs.getString(13)));
                bookForm.setBookcaseName(rs.getString(14));
                bookForm.setPublishing(rs.getString(15));
                bookForm.setTypeName(rs.getString(16));
            }
        } catch (SQLException ex) {
        }
        conn.close();
        return bookForm;
    }

    //select borrow
    public BookForm queryB(String f, String key) {
        BookForm bookForm = null;
        String sql = "select b.*,c.name as bookcaseName,p.pubname as publishing,t.typename from tb_bookinfo b "
                + "left join tb_bookcase c on b.bookcase=c.id join tb_publishing p on b.ISBN=p.ISBN "
                + "join tb_booktype t on b.typeid=t.id where b." + f + "='" + key + "'";
        System.out.println("BORROW BOOKS SQL：" + sql);
        ResultSet rs = conn.executeQuery(sql);
        try {
            if (rs.next()) {
                bookForm = new BookForm();
                bookForm.setBarcode(rs.getString(1));
                bookForm.setBookName(rs.getString(2));
                bookForm.setTypeId(rs.getInt(3));
                bookForm.setAuthor(rs.getString(4));
                bookForm.setTranslator(rs.getString(5));
                bookForm.setIsbn(rs.getString(6));
                bookForm.setPrice(Float.valueOf(rs.getString(7)));  //convert
                bookForm.setPage(rs.getInt(8));
                bookForm.setBookcaseid(rs.getInt(9));
                bookForm.setInTime(rs.getString(10));
                bookForm.setOperator(rs.getString(11));
                bookForm.setDel(rs.getInt(12));
                bookForm.setId(Integer.valueOf(rs.getString(13)));
                bookForm.setBookcaseName(rs.getString(14));
                bookForm.setPublishing(rs.getString(15));
                bookForm.setTypeName(rs.getString(16));
            }
        } catch (SQLException ex) {
        }
        conn.close();
        return bookForm;
    }

    //add data
    public int insert(BookForm bookForm) {
        String sql1 = "SELECT * FROM tb_bookinfo WHERE barcode='" + bookForm.getBarcode() + "' or bookname='"
                + bookForm.getBookName() + "'";
        ResultSet rs = conn.executeQuery(sql1);
        String sql = "";
        int falg = 0;
        try {
            if (rs.next()) {
                falg = 2;
            } else {
                sql = "Insert into tb_bookinfo (barcode,bookname,typeid,author,translator,isbn,price,page,bookcase,inTime,"
                        + "operator) values('" + bookForm.getBarcode() + "','" + bookForm.getBookName()
                        + "'," + bookForm.getTypeId() + ",'" + bookForm.getAuthor() + "','" + bookForm.getTranslator()
                        + "','" + bookForm.getIsbn() + "'," + bookForm.getPrice() + "," + bookForm.getPage() + ","
                        + bookForm.getBookcaseid() + ",'" + bookForm.getInTime() + "','" + bookForm.getOperator() + "')";
                falg = conn.executeUpdate(sql);
                System.out.println("ADD BOOKS INFO SQL：" + sql);
                conn.close();
            }
        } catch (SQLException ex) {
            falg = 0;
        }
        System.out.println("falg:" + falg);
        return falg;
    }

    //update data
    public int update(BookForm bookForm) {
        String sql = "Update tb_bookinfo set typeid=" + bookForm.getTypeId() + ",author='" + bookForm.getAuthor()
                + "',translator='" + bookForm.getTranslator() + "',isbn='" + bookForm.getIsbn() + "',price="
                + bookForm.getPrice() + ",page=" + bookForm.getPage() + ",bookcase=" + bookForm.getBookcaseid()
                + " where id=" + bookForm.getId() + "";
        int falg = conn.executeUpdate(sql);
        System.out.println("UPDATE DATA SQL：" + sql);
        conn.close();
        return falg;
    }

    //delete data
    public int delete(BookForm bookForm) {
        String sql = "UPDATE tb_bookinfo SET del=1 where id=" + bookForm.getId() + "";
        int falg = conn.executeUpdate(sql);
        System.out.println("DELETE DATA SQL：" + sql);
        return falg;
    }

}
