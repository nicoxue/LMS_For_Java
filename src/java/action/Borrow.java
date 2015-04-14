/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import DAO.BookDAO;
import DAO.BorrowDAO;
import DAO.ReaderDAO;
import Form.BookForm;
import Form.BorrowForm;
import Form.ReaderForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author JIAJUN XUE <nicoxue0324@gmail.com>
 */
public class Borrow extends Action {

    private BorrowDAO borrowDAO = null;
    private ReaderDAO readerDAO = null;
    private BookDAO bookDAO = null;
    private ReaderForm readerForm = new ReaderForm();

    public Borrow() {
        this.borrowDAO = new BorrowDAO();
        this.readerDAO = new ReaderDAO();
        this.bookDAO = new BookDAO();
    }

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        BorrowForm borrowForm = (BorrowForm) form;
        String action = request.getParameter("action");
        if (action == null || "".equals(action)) {
            request.setAttribute("error", "Error Operation!");
            return mapping.findForward("error");
        } else if ("bookBorrowSort".equals(action)) {
            return bookBorrowSort(mapping, form, request, response);
        } else if ("bookborrow".equals(action)) {
            return bookborrow(mapping, form, request, response);  //book borrow
        } else if ("bookrenew".equals(action)) {
            return bookrenew(mapping, form, request, response);  //book borrow more
        } else if ("bookback".equals(action)) {
            return bookback(mapping, form, request, response);  //book return
        } else if ("Bremind".equals(action)) {
            return bremind(mapping, form, request, response);  //book due time remind
        } else if ("borrowQuery".equals(action)) {
            return borrowQuery(mapping, form, request, response);  //borrow info
        }
        request.setAttribute("error", "Operation");
        return mapping.findForward("error");
    }

    /**
     * *******************Borrowed Book Rank**********************
     */
    private ActionForward bookBorrowSort(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) {
        request.setAttribute("bookBorrowSort", borrowDAO.bookBorrowSort());
        return mapping.findForward("bookBorrowSort");

    }

    /**
     * ******************Borrowed Book Query**********************
     */
    private ActionForward borrowQuery(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) {
        String str = null;
        String flag[] = request.getParameterValues("flag");
        if (flag != null) {
            String aa = flag[0];
            if ("a".equals(aa)) {
                if (request.getParameter("f") != null) {
                    str = request.getParameter("f") + " like '%"
                            + request.getParameter("key") + "%'";
                }
            }
            if ("b".equals(aa)) {
                String sdate = request.getParameter("sdate");
                String edate = request.getParameter("edate");
                if (sdate != null && edate != null) {
                    str = "borrowTime between '" + sdate + "' and '" + edate
                            + "'";
                }
                System.out.println("Date" + str);
            }

            if (flag.length == 2) {
                if (request.getParameter("f") != null) {
                    str = request.getParameter("f") + " like '%"
                            + request.getParameter("key") + "%'";
                }
                System.out.println("Date and Condition");
                String sdate = request.getParameter("sdate");
                String edate = request.getParameter("edate");
                String str1 = null;
                if (sdate != null && edate != null) {
                    str1 = "borrowTime between '" + sdate + "' and '" + edate
                            + "'";
                }
                str = str + " and borr." + str1;
                System.out.println("Date and Condition：" + str);
            }
        }
        request.setAttribute("borrowQuery", borrowDAO.borrowQuery(str));
        System.out.print("Date and Condition str:" + str);
        return mapping.findForward("borrowQuery");
    }

    /**
     * *******************Due time Reminder**********************
     */
    private ActionForward bremind(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) {
        request.setAttribute("Bremind", borrowDAO.bremind());
        return mapping.findForward("Bremind");
    }

    /**
     * *******************Book Borrow**********************
     */
    private ActionForward bookborrow(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) {
        readerForm.setBarcode(request.getParameter("barcode"));
        ReaderForm reader = (ReaderForm) readerDAO.queryM(readerForm);
        request.setAttribute("readerinfo", reader);
        request.setAttribute("borrowinfo", borrowDAO.borrowinfo(request.getParameter("barcode")));
        String f = request.getParameter("f");
        String key = request.getParameter("inputkey");
        if (key != null && !key.equals("")) {
            String operator = request.getParameter("operator");
            BookForm bookForm = bookDAO.queryB(f, key);
            if (bookForm != null) {
                int ret = borrowDAO.insertBorrow(reader, bookDAO.queryB(f, key),
                        operator);
                if (ret == 1) {
                    request.setAttribute("bar", request.getParameter("barcode"));
                    return mapping.findForward("bookborrowok");

                } else {
                    request.setAttribute("error", "Add borrow info failed");
                    return mapping.findForward("error");
                }
            } else {
                request.setAttribute("error", "no this books");
                return mapping.findForward("error");
            }
        }
        return mapping.findForward("bookborrow");
    }

    /**
     * *******************borrow book more**********************
     */
    private ActionForward bookrenew(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) {
        readerForm.setBarcode(request.getParameter("barcode"));
        ReaderForm reader = (ReaderForm) readerDAO.queryM(readerForm);
        request.setAttribute("readerinfo", reader);
        request.setAttribute("borrowinfo", borrowDAO.borrowinfo(request.getParameter("barcode")));
        if (request.getParameter("id") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            if (id > 0) {
                int ret = borrowDAO.renew(id);
                if (ret == 0) {
                    request.setAttribute("error", "book renew failed");
                    return mapping.findForward("error");
                } else {
                    request.setAttribute("bar", request.getParameter("barcode"));
                    return mapping.findForward("bookrenewok");
                }
            }
        }
        return mapping.findForward("bookrenew");
    }

    /**
     * *******************book return**********************
     */
    private ActionForward bookback(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) {
        readerForm.setBarcode(request.getParameter("barcode"));
        ReaderForm reader = (ReaderForm) readerDAO.queryM(readerForm);
        request.setAttribute("readerinfo", reader);
        request.setAttribute("borrowinfo", borrowDAO.borrowinfo(request.getParameter("barcode")));
        if (request.getParameter("id") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            String operator = request.getParameter("operator");
            if (id > 0) {
                int ret = borrowDAO.back(id, operator);
                if (ret == 0) {
                    request.setAttribute("error", "book back failed!");
                    return mapping.findForward("error");
                } else {
                    request.setAttribute("bar", request.getParameter("barcode"));
                    return mapping.findForward("bookbackok");
                }
            }
        }
        return mapping.findForward("bookback");
    }
}
