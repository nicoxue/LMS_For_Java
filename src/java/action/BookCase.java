/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import DAO.BookCaseDAO;
import Form.BookCaseForm;
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
public class BookCase extends Action {

    private BookCaseDAO bookCaseDAO = null;

    public BookCase() {
        this.bookCaseDAO = new BookCaseDAO();
    }

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) {
        String action = request.getParameter("action");
        System.out.println("\nbookCase*********************action=" + action);
        if (action == null || "".equals(action)) {
            return mapping.findForward("error");
        } else if ("bookCaseAdd".equals(action)) {
            return bookCaseAdd(mapping, form, request, response);
        } else if ("bookCaseQuery".equals(action)) {
            return bookCaseQuery(mapping, form, request, response);
        } else if ("bookCaseModifyQuery".equals(action)) {
            return bookCaseModifyQuery(mapping, form, request, response);
        } else if ("bookCaseModify".equals(action)) {
            return bookCaseModify(mapping, form, request, response);
        } else if ("bookCaseDel".equals(action)) {
            return bookCaseDel(mapping, form, request, response);
        }
        request.setAttribute("error", "operation failed!");
        return mapping.findForward("error");
    }

    /**
     * *********************add shelf info*************************
     */
    private ActionForward bookCaseAdd(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) {
        BookCaseForm bookCaseForm = (BookCaseForm) form;
        System.out.println("servlet:" + request.getParameter("name"));
        bookCaseForm.setName(bookCaseForm.getName());
        int a = bookCaseDAO.insert(bookCaseForm);
        if (a == 0) {
            request.setAttribute("error", "add shelf info failed!");
            return mapping.findForward("error");
        } else if (a == 2) {
            request.setAttribute("error", "shelf info added success");
            return mapping.findForward("error");
        } else {
            return mapping.findForward("bookcaseAdd");
        }
    }

    /**
     * *********************select all shelves info*************************
     */
    private ActionForward bookCaseQuery(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) {
        String str = null;
        request.setAttribute("bookcase", bookCaseDAO.query(str));
        return mapping.findForward("bookcaseQuery");
    }

    /**
     * *********************select and modify shelf
     * info*************************
     */
    private ActionForward bookCaseModifyQuery(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) {
        BookCaseForm bookCaseForm = (BookCaseForm) form;
        bookCaseForm.setId(Integer.valueOf(request.getParameter("ID")));
        request.setAttribute("bookCaseQueryif", bookCaseDAO.queryM(bookCaseForm));
        return mapping.findForward("bookCaseQueryModify");
    }

    /**
     * *********************modify shelf info*************************
     */
    private ActionForward bookCaseModify(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) {
        BookCaseForm bookCaseForm = (BookCaseForm) form;
        bookCaseForm.setName(request.getParameter("name"));
        int ret = bookCaseDAO.update(bookCaseForm);
        if (ret == 0) {
            request.setAttribute("error", "modify shelf info failed!");
            return mapping.findForward("error");
        } else {
            return mapping.findForward("bookCaseModify");
        }
    }

    /**
     * *********************delete shelf info*************************
     */
    private ActionForward bookCaseDel(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response
    ) {
        BookCaseForm bookCaseForm = (BookCaseForm) form;
        bookCaseForm.setId(Integer.valueOf(request.getParameter("ID")));
        int ret = bookCaseDAO.delete(bookCaseForm);
        if (ret == 0) {
            request.setAttribute("error", "delete shelf info");
            return mapping.findForward("error");
        } else {
            return mapping.findForward("bookCaseDel");
        }
    }
}
