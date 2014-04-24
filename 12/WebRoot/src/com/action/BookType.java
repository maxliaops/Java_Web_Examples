package com.action;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.void;
import com.actionForm.BookTypeForm;
import org.apache.struts.action.Action;
import com.dao.BookTypeDAO;

public class BookType extends Action {
    private BookTypeDAO bookTypeDAO = null;
    public BookType() {
        this.bookTypeDAO = new BookTypeDAO();
    }
    public void execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {

        String action =request.getParameter("action");
        System.out.println("\nbookType*********************action="+action);
        if(action==null||"".equals(action)){
            request.setAttribute("error","您的操作有误！");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }else if("bookTypeAdd".equals(action)){
            return bookTypeAdd(request,response);
        }else if("bookTypeQuery".equals(action)){
            return bookTypeQuery(request,response);
        }else if("bookTypeModifyQuery".equals(action)){
            return bookTypeModifyQuery(request,response);
        }else if("bookTypeModify".equals(action)){
            return bookTypeModify(request,response);
        }else if("bookTypeDel".equals(action)){
            return bookTypeDel(request,response);
        }
        request.setAttribute("error","操作失败！");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
    /***********************添加图书类型信息**************************/
    private void bookTypeAdd(ActionMapping mapping, ActionForm form,
                           HttpServletRequest request,
                           HttpServletResponse response){
           BookTypeForm bookTypeForm = (BookTypeForm) form;
           System.out.println("servlet:"+bookTypeForm.getTypeName());
           bookTypeForm.setTypeName(bookTypeForm.getTypeName());
           int a=bookTypeDAO.insert(bookTypeForm);
           if(a==0){
               request.setAttribute("error","图书类型信息添加失败！");
               request.getRequestDispatcher("error.jsp").forward(request, response);
         }else if(a==2){
             request.setAttribute("error","该图书类型信息已经添加！");
             request.getRequestDispatcher("error.jsp").forward(request, response);
         }else{
             return mapping.findForward("bookTypeAdd");
        }
       }
       /***********************查询全部图书类型信息**************************/
       private void bookTypeQuery(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
       String str=null;
       request.setAttribute("bookType",bookTypeDAO.query(str));
       return mapping.findForward("bookTypeQuery");
       }
        /***********************查询修改图书类型信息**************************/
        private void bookTypeModifyQuery(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
            BookTypeForm bookTypeForm=(BookTypeForm)form;
            bookTypeForm.setId(Integer.valueOf(request.getParameter("ID")));
            request.setAttribute("bookTypeQueryif",bookTypeDAO.queryM(bookTypeForm));
            return mapping.findForward("bookTypeQueryModify");
        }
        /***********************修改图书类型信息**************************/
        private void bookTypeModify(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
            BookTypeForm bookTypeForm=(BookTypeForm)form;
            bookTypeForm.setTypeName(bookTypeForm.getTypeName());
            bookTypeForm.setDays(bookTypeForm.getDays());
            int ret=bookTypeDAO.update(bookTypeForm);
            if(ret==0){
                request.setAttribute("error","修改图书类型信息失败！");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }else{
                return mapping.findForward("bookTypeModify");
            }
        }
        /***********************删除图书类型信息**************************/
        private void bookTypeDel(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
            BookTypeForm bookTypeForm=(BookTypeForm)form;
            bookTypeForm.setId(Integer.valueOf(request.getParameter("ID")));
            int ret=bookTypeDAO.delete(bookTypeForm);
            if(ret==0){
                request.setAttribute("error","删除图书类型信息失败！");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }else{
                return mapping.findForward("bookTypeDel");
            }
        }
}
