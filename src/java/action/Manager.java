/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import DAO.ManagerDAO;
import Form.ManagerForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author JIAJUN XUE <nicoxue0324@gmail.com>
 */
public class Manager extends Action {

    private ManagerDAO managerDAO = null;

    public Manager() {
        this.managerDAO = new ManagerDAO();
    }

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        System.out.println("get selection：" + action);
        if (action == null || "".equals(action)) {
            return mapping.findForward("error");
        } else if ("login".equals(action)) {
            return managerLogin(mapping, form, request, response);
        } else if ("managerAdd".equals(action)) {
            return managerAdd(mapping, form, request, response);
        } else if ("managerQuery".equals(action)) {
            return managerQuery(mapping, form, request, response);
        } else if ("managerModifyQuery".equals(action)) {
            return managerModifyQuery(mapping, form, request, response);
        } else if ("managerModify".equals(action)) {
            return managerModify(mapping, form, request, response);
        } else if ("managerDel".equals(action)) {
            return managerDel(mapping, form, request, response);
        } else if ("querypwd".equals(action)) {
            return pwdQuery(mapping, form, request, response);
        } else if ("modifypwd".equals(action)) {
            return modifypwd(mapping, form, request, response);
        }
        request.setAttribute("error", "Operation Failed!");
        return mapping.findForward("error");
    }

	// manager login
    public ActionForward managerLogin(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        ManagerForm managerForm = (ManagerForm) form;
        managerForm.setName(managerForm.getName());
        managerForm.setPwd(managerForm.getPwd());
        int ret = managerDAO.checkManager(managerForm);
        System.out.print("return check:" + ret);
        if (ret == 1) {
            HttpSession session = request.getSession();
            session.setAttribute("manager", managerForm.getName());
            return mapping.findForward("managerLoginok");
        } else {
            request.setAttribute("error", "incorrect manager id or password");
            return mapping.findForward("error");
        }
    }

    // manager query
    private ActionForward managerQuery(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        String str = null;
        request.setAttribute("managerQuery", managerDAO.query(str));
        return mapping.findForward("managerQuery");
    }

    // add manager
    private ActionForward managerAdd(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        ManagerForm managerForm = (ManagerForm) form;
        managerForm.setName(managerForm.getName()); 
        managerForm.setPwd(managerForm.getPwd()); 
        int ret = managerDAO.insert(managerForm); 
        if (ret == 1) {
            return mapping.findForward("managerAdd"); 
        } else if (ret == 2) {
            request.setAttribute("error", "manager info has already exists"); 
            return mapping.findForward("error"); 
        } else {
            request.setAttribute("error", "add manager failed"); 
            return mapping.findForward("error"); 
        }
    }

    // manager modify query
    private ActionForward managerModifyQuery(ActionMapping mapping,
            ActionForm form, HttpServletRequest request,
            HttpServletResponse response) {
        ManagerForm managerForm = (ManagerForm) form;
        managerForm.setId(Integer.valueOf(request.getParameter("id")));
        System.out.print("selected id:" + request.getParameter("id"));
        request.setAttribute("managerQueryif", managerDAO
                .query_update(managerForm));
        return mapping.findForward("managerQueryModify");			
    }

    // password query
    private ActionForward pwdQuery(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        ManagerForm managerForm = (ManagerForm) form;
        HttpSession session = request.getSession();
        String manager = (String) session.getAttribute("manager");
        managerForm.setName(manager);
        System.out.print("query manager:" + manager);
        request.setAttribute("pwdQueryif", managerDAO.query_pwd(managerForm));
        return mapping.findForward("pwdQueryModify");
    }

    // manager modify
    private ActionForward managerModify(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        ManagerForm managerForm = (ManagerForm) form;
        managerForm.setId(managerForm.getId());				
        managerForm.setName(managerForm.getName());			
        managerForm.setPwd(managerForm.getPwd());			
        managerForm.setSysset(managerForm.getSysset());			
        managerForm.setReaderset(managerForm.getReaderset());		
        managerForm.setBookset(managerForm.getBookset());		
        managerForm.setBorrowback(managerForm.getBorrowback());	
        managerForm.setSysquery(managerForm.getSysquery());		
        int ret = managerDAO.update(managerForm);				
        if (ret == 0) {
            request.setAttribute("error", "manager set failed");	
            return mapping.findForward("error");				
        } else {
            return mapping.findForward("managerModify");		
        }
    }

    // delete
    private ActionForward managerDel(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        ManagerForm managerForm = (ManagerForm) form;
        managerForm.setId(Integer.valueOf(request.getParameter("id")));	
        int ret = managerDAO.delete(managerForm);		
        if (ret == 0) {
            request.setAttribute("error", "delete manager failed");	
            return mapping.findForward("error");	
        } else {
            return mapping.findForward("managerDel");	
        }
    }

    // modify password
    private ActionForward modifypwd(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        ManagerForm managerForm = (ManagerForm) form;
        managerForm.setName(managerForm.getName());
        managerForm.setPwd(managerForm.getPwd());
        int ret = managerDAO.updatePwd(managerForm);
        if (ret == 0) {
            request.setAttribute("error", "change password failed");
            return mapping.findForward("error");
        } else {
            return mapping.findForward("pwdModify");
        }
    }
}
