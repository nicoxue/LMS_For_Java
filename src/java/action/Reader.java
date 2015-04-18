/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import DAO.ReaderDAO;
import Form.ReaderForm;
import java.util.Date;
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
public class Reader extends Action {

    private ReaderDAO readerDAO = null;

    public Reader() {
        this.readerDAO = new ReaderDAO();
    }

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        System.out.println("\nreader*********************action=" + action);
        if (action == null || "".equals(action)) {
            request.setAttribute("error", "Error Operation!");
            return mapping.findForward("error");
        } else if ("readerAdd".equals(action)) {
            return readerAdd(mapping, form, request, response);
        } else if ("readerQuery".equals(action)) {
            return readerQuery(mapping, form, request, response);
        } else if ("readerModifyQuery".equals(action)) {
            return readerModifyQuery(mapping, form, request, response);
        } else if ("readerModify".equals(action)) {
            return readerModify(mapping, form, request, response);
        } else if ("readerDel".equals(action)) {
            return readerDel(mapping, form, request, response);
        } else if ("readerDetail".equals(action)) {
            return readerDetail(mapping, form, request, response);
        }
        request.setAttribute("error", "Operation failed!");
        return mapping.findForward("error");
    }

    /**
     * *********************add reader info*************************
     */
    private ActionForward readerAdd(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) {
        ReaderForm readerForm = (ReaderForm) form;
        readerForm.setName(readerForm.getName());
        readerForm.setSex(readerForm.getSex());
        readerForm.setBarcode(readerForm.getBarcode());
        readerForm.setVocation(readerForm.getVocation());
        readerForm.setBirthday(readerForm.getBirthday());
        readerForm.setPaperType(readerForm.getPaperType());
        readerForm.setPaperNO(readerForm.getPaperNO());
        readerForm.setTel(readerForm.getTel());
        readerForm.setEmail(readerForm.getEmail());
        Date date1 = new Date();
        java.sql.Date date = new java.sql.Date(date1.getTime());
        readerForm.setCreateDate(date.toString());
        readerForm.setOperator(readerForm.getOperator());
        readerForm.setRemark(readerForm.getRemark());
        int a = readerDAO.insert(readerForm);
        if (a == 0) {
            request.setAttribute("error", "add reader info failed");
            return mapping.findForward("error");
        } else if (a == 2) {
            request.setAttribute("error", "this reader info has been added");
            return mapping.findForward("error");
        } else {
            return mapping.findForward("readerAdd");
        }
    }

    /**
     * *********************reader query*************************
     */
    private ActionForward readerQuery(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) {
        String str = null;
        request.setAttribute("reader", readerDAO.query(str));
        return mapping.findForward("readerQuery");
    }

    /**
     * *********************reader modify query*************************
     */
    private ActionForward readerModifyQuery(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) {
        ReaderForm readerForm = (ReaderForm) form;
        System.out.println("Modify & Query Reader:" + request.getParameter("ID"));
        readerForm.setId(Integer.valueOf(request.getParameter("ID")));
        request.setAttribute("readerQueryif", readerDAO.queryM(readerForm));
        return mapping.findForward("readerQueryModify");
    }

    /**
     * *********************reader detail*************************
     */
    private ActionForward readerDetail(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) {
        ReaderForm readerForm = (ReaderForm) form;
        readerForm.setId(Integer.valueOf(request.getParameter("ID")));
        request.setAttribute("readerDetail", readerDAO.queryM(readerForm));
        return mapping.findForward("readerDeatil");
    }

    /**
     * *********************modify reader*************************
     */
    private ActionForward readerModify(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) {
        ReaderForm readerForm = (ReaderForm) form;
        readerForm.setName(readerForm.getName());
        readerForm.setSex(readerForm.getSex());
        readerForm.setBarcode(readerForm.getBarcode());
        readerForm.setVocation(readerForm.getVocation());
        readerForm.setBirthday(readerForm.getBirthday());
        readerForm.setPaperType(readerForm.getPaperType());
        readerForm.setPaperNO(readerForm.getPaperNO());
        readerForm.setTel(readerForm.getTel());
        readerForm.setEmail(readerForm.getEmail());
        readerForm.setOperator(readerForm.getOperator());
        readerForm.setRemark(readerForm.getRemark());
        int ret = readerDAO.update(readerForm);
        if (ret == 0) {
            request.setAttribute("error", "modify reader info failed");
            return mapping.findForward("error");
        } else {
            return mapping.findForward("readerModify");
        }
    }

    /**
     * *********************delete reader info*************************
     */
    private ActionForward readerDel(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) {
        ReaderForm readerForm = (ReaderForm) form;
        readerForm.setId(Integer.valueOf(request.getParameter("ID")));
        int ret = readerDAO.delete(readerForm);
        if (ret == 0) {
            request.setAttribute("error", "delete reader info failed");
            return mapping.findForward("error");
        } else {
            return mapping.findForward("readerDel");
        }
    }
}
