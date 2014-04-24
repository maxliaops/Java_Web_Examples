package com.action;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.void;
import com.dao.LibraryDAO;
import com.actionForm.LibraryForm;
import org.apache.struts.action.Action;

public class Library extends Action {
    LibraryDAO libraryDAO=null;
    public Library(){
        libraryDAO=new LibraryDAO();
    }
    public void execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {
        LibraryForm libraryForm=(LibraryForm) form;
        String str=request.getParameter("action");
        if("libraryQuery".equals(str)){
            return libraryModifyQuery(request,response);
        }else if("libraryModify".equals(str)){
            return libraryModify(request,response);
        }
        request.setAttribute("error","您的操作有误！");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
    private void libraryModify(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response
){
        LibraryForm libraryForm = (LibraryForm) form;
        libraryForm.setId(libraryForm.getId());
        libraryForm.setLibraryname(libraryForm.getLibraryname());
        libraryForm.setCurator(libraryForm.getCurator());
        libraryForm.setTel(libraryForm.getTel());
        libraryForm.setAddress(libraryForm.getAddress());
        libraryForm.setEmail(libraryForm.getEmail());
        libraryForm.setUrl(libraryForm.getUrl());
        libraryForm.setCreateDate(libraryForm.getCreateDate());
        libraryForm.setIntroduce(libraryForm.getIntroduce());
        int ret = libraryDAO.update(libraryForm);
        if (ret ==0) {
            request.setAttribute("error", "图书馆信息修改失败！");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } else {
            return mapping.findForward("librarymodify");
        }

    }
    private void libraryModifyQuery(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response
){
        request.setAttribute("libraryModifyif",libraryDAO.query());
        return mapping.findForward("librarymodifyQuery");
    }
}
