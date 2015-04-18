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
public class BookForm extends ActionForm {

    private String author;
    private String barcode;
    private String bookName;
    private int days;
    private int del;
    private Integer id;
    private int page;
    private Float price;
    private String translator;
    private String isbn;

    public BookForm() {
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setDel(int del) {
        this.del = del;
    }

    public void setDays(int days) {
        this.days = days;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    public String getBarcode() {
        return barcode;
    }

    public String getBookName() {
        return bookName;
    }

    public int getDays() {
        return days;
    }

    public int getDel() {
        return del;
    }

    public Integer getId() {
        return id;
    }

    public int getPage() {
        return page;
    }

    public Float getPrice() {
        return price;
    }

    public String getTranslator() {
        return translator;
    }

    public void setTranslator(String translator) {
        this.translator = translator;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }
}
