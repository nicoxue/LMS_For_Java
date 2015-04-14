/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import DAO.ReaderTypeDAO;
import Form.ReaderTypeForm;
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
public class ReaderType extends Action {

    private ReaderTypeDAO readerTypeDAO = null;

    public ReaderType() {
        this.readerTypeDAO = new ReaderTypeDAO();
    }

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) {
        String action = request.getParameter("action");
        System.out.println("\nreaderType*********************action=" + action);
        if (action == null || "".equals(action)) {
            request.setAttribute("error", "Error Operation!");
            return mapping.findForward("error");
        } else if ("readerTypeAdd".equals(action)) {
            return readerTypeAdd(mapping, form, request, response);
        } else if ("readerTypeQuery".equals(action)) {
            return readerTypeQuery(mapping, form, request, response);
        } else if ("readerTypeModifyQuery".equals(action)) {
            return readerTypeModifyQuery(mapping, form, request, response);
        } else if ("readerTypeModify".equals(action)) {
            return readerTypeModify(mapping, form, request, response);
        } else if ("readerTypeDel".equals(action)) {
            return readerTypeDel(mapping, form, request, response);
        }
        request.setAttribute("error", "Operation Failed!");
        return mapping.findForward("error");
    }

    /**
     * *********************add reader type*************************
     */
    private ActionForward readerTypeAdd(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) {
        ReaderTypeForm readerTypeForm = (ReaderTypeForm) form;
        System.out.println("servlet:" + request.getParameter("name"));
        readerTypeForm.setName(readerTypeForm.getName());
        int a = readerTypeDAO.insert(readerTypeForm);
        if (a == 0) {
            request.setAttribute("error", "add reader type failed");
            return mapping.findForward("error");
        } else if (a == 2) {
            request.setAttribute("error", "the reader type has been added!");
            return mapping.findForward("error");
        } else {
            return mapping.findForward("readerTypeAdd");
        }
    }

    /**
     * *********************reader type query*************************
     */
    private ActionForward readerTypeQuery(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) {
        String str = null;
        request.setAttribute("readerType", readerTypeDAO.query(str));
        return mapping.findForward("readerTypeQuery");
    }

    /**
     * *********************reader type modify query*************************
     */
    private ActionForward readerTypeModifyQuery(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) {
        ReaderTypeForm readerTypeForm = (ReaderTypeForm) form;
        readerTypeForm.setId(Integer.valueOf(request.getParameter("ID")));
        request.setAttribute("readerTypeQueryif", readerTypeDAO.queryM(readerTypeForm));
        return mapping.findForward("readerTypeQueryModify");
    }

    /**
     * *********************modify reader type*************************
     */
    private ActionForward readerTypeModify(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) {
        ReaderTypeForm readerTypeForm = (ReaderTypeForm) form;
        readerTypeForm.setName(readerTypeForm.getName());
        readerTypeForm.setNumber(readerTypeForm.getNumber());
        int ret = readerTypeDAO.update(readerTypeForm);
        if (ret == 0) {
            request.setAttribute("error", "modify reader type failed");
            return mapping.findForward("error");
        } else {
            return mapping.findForward("readerTypeModify");
        }
    }

    /**
     * *********************delete reader type*************************
     */
    private ActionForward readerTypeDel(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) {
        ReaderTypeForm readerTypeForm = (ReaderTypeForm) form;
        readerTypeForm.setId(Integer.valueOf(request.getParameter("ID")));
        int ret = readerTypeDAO.delete(readerTypeForm);
        if (ret == 0) {
            request.setAttribute("error", "delete reader type failed");
            return mapping.findForward("error");
        } else {
            return mapping.findForward("readerTypeDel");
        }
    }
}
