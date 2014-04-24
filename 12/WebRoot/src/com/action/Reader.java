package com.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.actionForm.ReaderForm;
import org.apache.struts.action.*;
import com.dao.ReaderDAO;
import java.util.Date;

public class Reader extends Action {
    private ReaderDAO readerDAO = null;
    public Reader() {
        this.readerDAO = new ReaderDAO();
    }

    public void execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {
        String action =request.getParameter("action");
        System.out.println("\nreader*********************action="+action);
        if(action==null||"".equals(action)){
            request.setAttribute("error","您的操作有误！");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }else if("readerAdd".equals(action)){
            return readerAdd(request,response);
        }else if("readerQuery".equals(action)){
            return readerQuery(request,response);
        }else if("readerModifyQuery".equals(action)){
            return readerModifyQuery(request,response);
        }else if("readerModify".equals(action)){
            return readerModify(request,response);
        }else if("readerDel".equals(action)){
            return readerDel(request,response);
        }else if("readerDetail".equals(action)){
            return readerDetail(request,response);
        }
        request.setAttribute("error","操作失败！");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
    /***********************添加读者信息**************************/
    private void readerAdd(ActionMapping mapping, ActionForm form,
                           HttpServletRequest request,
                           HttpServletResponse response){
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
           //获取系统日期
           Date date1=new Date();
           java.sql.Date date=new java.sql.Date(date1.getTime());
           readerForm.setCreateDate(date.toString());
           readerForm.setOperator(readerForm.getOperator());
           readerForm.setRemark(readerForm.getRemark());
           readerForm.setTypeid(readerForm.getTypeid());
           int a=readerDAO.insert(readerForm);
           if(a==0){
               request.setAttribute("error","读者信息添加失败！");
               request.getRequestDispatcher("error.jsp").forward(request, response);
         }else if(a==2){
             request.setAttribute("error","该读者信息已经添加！");
             request.getRequestDispatcher("error.jsp").forward(request, response);
         }else{
             return mapping.findForward("readerAdd");
        }
       }
       /***********************查询全部读者信息**************************/
       private void readerQuery(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
       String str=null;
       request.setAttribute("reader",readerDAO.query(str));
       return mapping.findForward("readerQuery");
       }
        /***********************查询修改读者信息**************************/
        private void readerModifyQuery(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
            ReaderForm readerForm=(ReaderForm)form;
            System.out.println("查询修改读者信息："+request.getParameter("ID"));
            readerForm.setId(Integer.valueOf(request.getParameter("ID")));
            request.setAttribute("readerQueryif",readerDAO.queryM(readerForm));
            return mapping.findForward("readerQueryModify");
        }
        /***********************查询读者详细信息**************************/
        private void readerDetail(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
            ReaderForm readerForm=(ReaderForm)form;
            readerForm.setId(Integer.valueOf(request.getParameter("ID")));
            request.setAttribute("readerDetail",readerDAO.queryM(readerForm));
            return mapping.findForward("readerDeatil");
        }
        /***********************修改读者信息**************************/
        private void readerModify(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
            ReaderForm readerForm=(ReaderForm)form;
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
            readerForm.setTypeid(readerForm.getTypeid());
            int ret=readerDAO.update(readerForm);
            if(ret==0){
                request.setAttribute("error","修改读者信息失败！");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }else{
                return mapping.findForward("readerModify");
            }
        }
        /***********************删除读者信息**************************/
        private void readerDel(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
            ReaderForm readerForm=(ReaderForm)form;
            readerForm.setId(Integer.valueOf(request.getParameter("ID")));
            int ret=readerDAO.delete(readerForm);
            if(ret==0){
                request.setAttribute("error","删除读者信息失败！");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }else{
                return mapping.findForward("readerDel");
            }
        }
}
