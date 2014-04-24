package com.action;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.void;
import com.actionForm.BookCaseForm;
import org.apache.struts.action.Action;
import com.dao.BookCaseDAO;

public class BookCase extends Action {
    private BookCaseDAO bookCaseDAO=null;
    public BookCase(){
        this.bookCaseDAO=new BookCaseDAO();
    }
    public void execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {
    String action =request.getParameter("action");
    System.out.println("\nbookCase*********************action="+action);
    if(action==null||"".equals(action)){
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }else if("bookCaseAdd".equals(action)){
        return bookCaseAdd(request,response);
    }else if("bookCaseQuery".equals(action)){
        return bookCaseQuery(request,response);
    }else if("bookCaseModifyQuery".equals(action)){
        return bookCaseModifyQuery(request,response);
    }else if("bookCaseModify".equals(action)){
        return bookCaseModify(request,response);
    }else if("bookCaseDel".equals(action)){
        return bookCaseDel(request,response);
    }
        request.setAttribute("error","操作失败！");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
 /***********************添加书架信息**************************/
 private void bookCaseAdd(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
        BookCaseForm bookCaseForm = (BookCaseForm) form;
        System.out.println("servlet:"+request.getParameter("name"));
        bookCaseForm.setName(bookCaseForm.getName());
        int a=bookCaseDAO.insert(bookCaseForm);
        if(a==0){
            request.setAttribute("error","书架信息添加失败！");
            request.getRequestDispatcher("error.jsp").forward(request, response);
      }else if(a==2){
          request.setAttribute("error","该书架信息已经添加！");
          request.getRequestDispatcher("error.jsp").forward(request, response);
      }else{
          return mapping.findForward("bookcaseAdd");
     }
    }
    /***********************查询全部书架信息**************************/
    private void bookCaseQuery(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
    String str=null;
    request.setAttribute("bookcase",bookCaseDAO.query(str));
    return mapping.findForward("bookcaseQuery");
    }
     /***********************查询修改书架信息**************************/
     private void bookCaseModifyQuery(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
         BookCaseForm bookCaseForm=(BookCaseForm)form;
         bookCaseForm.setId(Integer.valueOf(request.getParameter("ID")));
         request.setAttribute("bookCaseQueryif",bookCaseDAO.queryM(bookCaseForm));
         return mapping.findForward("bookCaseQueryModify");
     }
     /***********************修改书架信息**************************/
     private void bookCaseModify(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
         BookCaseForm bookCaseForm=(BookCaseForm)form;
         bookCaseForm.setName(request.getParameter("name"));
         int ret=bookCaseDAO.update(bookCaseForm);
         if(ret==0){
             request.setAttribute("error","修改书架信息失败！");
             request.getRequestDispatcher("error.jsp").forward(request, response);
         }else{
             return mapping.findForward("bookCaseModify");
         }
     }
     /***********************删除书架信息**************************/
     private void bookCaseDel(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response
){
         BookCaseForm bookCaseForm=(BookCaseForm)form;
         bookCaseForm.setId(Integer.valueOf(request.getParameter("ID")));
         int ret=bookCaseDAO.delete(bookCaseForm);
         if(ret==0){
             request.setAttribute("error","删除书架信息失败！");
             request.getRequestDispatcher("error.jsp").forward(request, response);
         }else{
             return mapping.findForward("bookCaseDel");
         }
     }
}
