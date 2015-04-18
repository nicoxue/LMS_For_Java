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
public class BorrowForm extends ActionForm {

    private String backTime;
    private String bookBarcode;
    private int bookId;
    private String bookName;
    private String borrowTime;
    private Integer id;
    private int ifBack;
    private Float price;
    private String readerBarcode;
    private int readerId;
    private int degree;
    private String author;    
    private String readerName;
    private String sex;
    private String birthday;
    private String paperType;
    private String paperNo;
    private String tel;

    public String getBackTime() {
        return backTime;
    }

    public void setBackTime(String backTime) {
        this.backTime = backTime;
    }

    public void setReaderId(int readerId) {
        this.readerId = readerId;
    }

    public void setReaderBarcode(String readerBarcode) {
        this.readerBarcode = readerBarcode;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public void setIfBack(int ifBack) {
        this.ifBack = ifBack;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setBorrowTime(String borrowTime) {
        this.borrowTime = borrowTime;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public void setBookBarcode(String bookBarcode) {
        this.bookBarcode = bookBarcode;
    }

    public void setDegree(int degree) {
        this.degree = degree;
    }

    public String getBookBarcode() {
        return bookBarcode;
    }

    public int getBookId() {
        return bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public String getBorrowTime() {
        return borrowTime;
    }

    public Integer getId() {
        return id;
    }

    public int getIfBack() {
        return ifBack;
    }

    public Float getPrice() {
        return price;
    }

    public String getReaderBarcode() {
        return readerBarcode;
    }

    public int getReaderId() {
        return readerId;
    }

    public int getDegree() {
        return degree;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getAuthor() {
        return author;
    }

    public void setReaderName(String readerName) {
        this.readerName = readerName;
    }

    public String getReaderName() {
        return readerName;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getSex() {
        return sex;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setPaperType(String paperType) {
        this.paperType = paperType;
    }

    public String getPaperType() {
        return paperType;
    }

    public void setPaperNo(String paperNo) {
        this.paperNo = paperNo;
    }

    public String getPaperNo() {
        return paperNo;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getTel() {
        return tel;
    }
}
