/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package action;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForward;
import Form.BookForm;
import org.apache.struts.action.Action;
import DAO.BookDAO;
import java.util.Date;


/**
 *
 * @author JIAJUN XUE <nicoxue0324@gmail.com>
 */
public class Book extends Action{
    private BookDAO bookDAO = null;
    public Book() {
        this.bookDAO = new BookDAO();
    }

    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {
        String action =request.getParameter("action");
        System.out.println("\nbook*********************action="+action);
        if(action==null||"".equals(action)){
            request.setAttribute("error","operation failed!");
            return mapping.findForward("error");
        }else if("bookAdd".equals(action)){
            return bookAdd(mapping,form,request,response);
        }else if("bookQuery".equals(action)){
            return bookQuery(mapping,form,request,response);
        }else if("bookModifyQuery".equals(action)){
            return bookModifyQuery(mapping,form,request,response);
        }else if("bookModify".equals(action)){
            return bookModify(mapping,form,request,response);
        }else if("bookDel".equals(action)){
            return bookDel(mapping,form,request,response);
        }else if("bookDetail".equals(action)){
            return bookDetail(mapping,form,request,response);
        }else if("bookifQuery".equals(action)){
            return bookifQuery(mapping,form,request,response);
        }
        request.setAttribute("error","operation failed!");
        return mapping.findForward("error");
    }
    
    /***********************add books info**************************/
    private ActionForward bookAdd(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
           BookForm bookForm = (BookForm) form;
           bookForm.setBarcode(bookForm.getBarcode());
           bookForm.setBookName(bookForm.getBookName());
           bookForm.setTypeId(bookForm.getTypeId());
           bookForm.setAuthor(bookForm.getAuthor());
           bookForm.setTranslator(bookForm.getTranslator());
           bookForm.setIsbn(bookForm.getIsbn());
           bookForm.setPrice(bookForm.getPrice());
           bookForm.setPage(bookForm.getPage());
           bookForm.setBookcaseid(bookForm.getBookcaseid()); 
           Date date1=new Date();
           java.sql.Date date=new java.sql.Date(date1.getTime());
           bookForm.setInTime(date.toString());
           bookForm.setOperator(bookForm.getOperator());
           int a=bookDAO.insert(bookForm);
           if(a==1){
               return mapping.findForward("bookAdd");
         }else if(a==2){
             request.setAttribute("error","add book info successed!");
             return mapping.findForward("error");
         }else{
             request.setAttribute("error","add book info added failed!");
             return mapping.findForward("error");
        }
       }
    
       /***********************select all books info**************************/
       private ActionForward bookQuery(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response){
       String str=null;
       request.setAttribute("book",bookDAO.query(str));	
       return mapping.findForward("bookQuery");		
       }
       
       /***********************select books info**************************/
       private ActionForward bookifQuery(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response){
       String str=null;
       if(request.getParameter("f")!=null){
           str = request.getParameter("f") + " like '%" +
                        request.getParameter("key") + "%";
       }
       request.setAttribute("ifbook",bookDAO.query(str));
       System.out.print("select where str:"+str);
       return mapping.findForward("bookifQuery");
       }
        /***********************modify books info**************************/
        private ActionForward bookModifyQuery(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response){
            BookForm bookForm=(BookForm)form;
            System.out.println("modify books info："+request.getParameter("ID"));
            bookForm.setId(Integer.valueOf(request.getParameter("ID")));
            request.setAttribute("bookQueryif",bookDAO.queryM(bookForm));
            return mapping.findForward("bookQueryModify");
        }
        /***********************select books detail info***********************/
        private ActionForward bookDetail(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response){
            BookForm bookForm=(BookForm)form;
            bookForm.setId(Integer.valueOf(request.getParameter("ID")));
            request.setAttribute("bookDetail",bookDAO.queryM(bookForm));
            return mapping.findForward("bookDeatil");
        }
        /***********************modify books detail info**************************/
        private ActionForward bookModify(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response){
            BookForm bookForm=(BookForm)form;		
            bookForm.setBarcode(bookForm.getBarcode());	
            bookForm.setBookName(bookForm.getBookName());
            bookForm.setTypeId(bookForm.getTypeId());
            bookForm.setAuthor(bookForm.getAuthor());
            bookForm.setTranslator(bookForm.getTranslator());
            bookForm.setIsbn(bookForm.getIsbn());
            bookForm.setPrice(bookForm.getPrice());
            bookForm.setPage(bookForm.getPage());
            bookForm.setBookcaseid(bookForm.getBookcaseid());
            bookForm.setInTime(bookForm.getInTime());
            bookForm.setOperator(bookForm.getOperator());
            int ret=bookDAO.update(bookForm);			
            if(ret==0){
                request.setAttribute("error","modify books info failed!");
                return mapping.findForward("error");		
            }else{
                return mapping.findForward("bookModify");	
            }
        }
        /***********************delete books info**************************/
        private ActionForward bookDel(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response){
            BookForm bookForm=(BookForm)form;
            bookForm.setId(Integer.valueOf(request.getParameter("ID")));
            int ret=bookDAO.delete(bookForm);
            if(ret==0){
                request.setAttribute("error","delete books info failed!");
                return mapping.findForward("error");
            }else{
                return mapping.findForward("bookDel");
            }
        }    

//    @Override
//    public Object getValue(String key) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
//
//    @Override
//    public void putValue(String key, Object value) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
//
//    @Override
//    public void setEnabled(boolean b) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
//
//    @Override
//    public boolean isEnabled() {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
//
//    @Override
//    public void addPropertyChangeListener(PropertyChangeListener listener) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
//
//    @Override
//    public void removePropertyChangeListener(PropertyChangeListener listener) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
//
//    @Override
//    public void actionPerformed(ActionEvent e) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
}
