package com.action;

import org.apache.struts.action.*;
import javax.servlet.http.*;
import com.dao.*;
import com.actionForm.*;

public class Borrow extends Action {
	/******************在构造方法中实例化Borrow类中应用的持久层类的对象**************************/
	   private BorrowDAO borrowDAO = null;
	   private ReaderDAO readerDAO=null;
	   private BookDAO bookDAO=null;
	   private ReaderForm readerForm=new ReaderForm();
	   public Borrow() {
	       this.borrowDAO = new BorrowDAO();
	       this.readerDAO=new ReaderDAO();
	       this.bookDAO=new BookDAO();
	   }
	/******************************************************************************************/
	    public void execute(ActionMapping mapping, ActionForm form,
	                                 HttpServletRequest request, HttpServletResponse response) {
	        BorrowForm borrowForm = (BorrowForm) form;
	        String action =request.getParameter("action");
	        if(action==null||"".equals(action)){
	            request.setAttribute("error","您的操作有误！");
	            request.getRequestDispatcher("error.jsp").forward(request, response);
	        }else if("bookBorrowSort".equals(action)){
	            return bookBorrowSort(request,response); 
	        }else if("bookborrow".equals(action)){
	            return bookborrow(request,response);  //图书借阅
	        }else if("bookrenew".equals(action)){
	            return bookrenew(request,response);  //图书续借
	        }else if("bookback".equals(action)){
	            return bookback(request,response);  //图书归还
	        }else if("Bremind".equals(action)){
	            return bremind(request,response);  //借阅到期提醒
	        }else if("borrowQuery".equals(action)){
	            return borrowQuery(request,response);  //借阅信息查询
	        }
	        request.setAttribute("error","操作失败！");
	        request.getRequestDispatcher("error.jsp").forward(request, response);
	    }
    /*********************图书借阅排行***********************/
    private void bookBorrowSort(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response){
        request.setAttribute("bookBorrowSort",borrowDAO.bookBorrowSort());
        return mapping.findForward("bookBorrowSort");

    }
 /*********************图书借阅查询***********************/
    private void borrowQuery(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response){
        String str=null;
        String flag[]=request.getParameterValues("flag");
        if (flag!=null){
            String aa = flag[0];
            if ("a".equals(aa)) {
                if (request.getParameter("f") != null) {
                    str = request.getParameter("f") + " like '%" +
                          request.getParameter("key") + "%'";
                }
            }
            if ("b".equals(aa)) {
                String sdate = request.getParameter("sdate");
                String edate = request.getParameter("edate");
                if (sdate != null && edate != null) {
                    str = "borrowTime between '" + sdate + "' and '" + edate +
                          "'";
                }
                System.out.println("日期" + str);
            }
            //同时选择日期和条件进行查询
            if (flag.length == 2) {
                if (request.getParameter("f") != null) {
                    str = request.getParameter("f") + " like '%" +
                          request.getParameter("key") + "%'";
                }
                System.out.println("日期和条件");
                String sdate = request.getParameter("sdate");
                String edate = request.getParameter("edate");
                String str1 = null;
                if (sdate != null && edate != null) {
                    str1 = "borrowTime between '" + sdate + "' and '" + edate +
                           "'";
                }
                str = str + " and borr." + str1;
                System.out.println("条件和日期：" + str);
            }
        }
        request.setAttribute("borrowQuery",borrowDAO.borrowQuery(str));
       System.out.print("条件查询图书借阅信息时的str:"+str);
        return mapping.findForward("borrowQuery");
    }
    /*********************到期提醒***********************/
    private void bremind(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response){
        request.setAttribute("Bremind",borrowDAO.bremind());
        return mapping.findForward("Bremind");
    }

    /*********************图书借阅***********************/
    private void bookborrow(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response){
        //查询读者信息
        //ReaderForm readerForm=(ReaderForm)form;  //此处一定不能使用该语句进行转换
        readerForm.setBarcode(request.getParameter("barcode"));
        ReaderForm reader = (ReaderForm) readerDAO.queryM(readerForm);
        request.setAttribute("readerinfo", reader);
        //查询读者的借阅信息
        request.setAttribute("borrowinfo",borrowDAO.borrowinfo(request.getParameter("barcode")));
        //完成借阅
        String f = request.getParameter("f");
        String key = request.getParameter("inputkey");
        if (key != null && !key.equals("")) {
            String operator = request.getParameter("operator");
            BookForm bookForm=bookDAO.queryB(f, key);
            if (bookForm!=null){
                int ret = borrowDAO.insertBorrow(reader, bookDAO.queryB(f, key),
                                                 operator);
                if (ret == 1) {
                    request.setAttribute("bar", request.getParameter("barcode"));
                    return mapping.findForward("bookborrowok");

                } else {
                    request.setAttribute("error", "添加借阅信息失败!");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            }else{
                request.setAttribute("error", "没有该图书!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        }
        return mapping.findForward("bookborrow");
    }
    /*********************图书继借***********************/
    private void bookrenew(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response){
        //查询读者信息
        readerForm.setBarcode(request.getParameter("barcode"));
        ReaderForm reader = (ReaderForm) readerDAO.queryM(readerForm);
        request.setAttribute("readerinfo", reader);
        //查询读者的借阅信息
        request.setAttribute("borrowinfo",borrowDAO.borrowinfo(request.getParameter("barcode")));
         if(request.getParameter("id")!=null){
             int id = Integer.parseInt(request.getParameter("id"));
             if (id > 0) { //执行继借操作
                 int ret = borrowDAO.renew(id);
                 if (ret == 0) {
                     request.setAttribute("error", "图书继借失败!");
                     request.getRequestDispatcher("error.jsp").forward(request, response);
                 } else {
                     request.setAttribute("bar", request.getParameter("barcode"));
                     return mapping.findForward("bookrenewok");
                 }
             }
         }
        return mapping.findForward("bookrenew");
    }
    /*********************图书归还***********************/
    private void bookback(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response){
        //查询读者信息
        readerForm.setBarcode(request.getParameter("barcode"));
        ReaderForm reader = (ReaderForm) readerDAO.queryM(readerForm);
        request.setAttribute("readerinfo", reader);
        //查询读者的借阅信息
        request.setAttribute("borrowinfo",borrowDAO.borrowinfo(request.getParameter("barcode")));
         if(request.getParameter("id")!=null){
             int id = Integer.parseInt(request.getParameter("id"));
             String operator=request.getParameter("operator");
             if (id > 0) { //执行归还操作
                 int ret = borrowDAO.back(id,operator);
                 if (ret == 0) {
                     request.setAttribute("error", "图书归还失败!");
                     request.getRequestDispatcher("error.jsp").forward(request, response);
                 } else {
                     request.setAttribute("bar", request.getParameter("barcode"));
                     return mapping.findForward("bookbackok");
                 }
             }
         }
        return mapping.findForward("bookback");
    }
}
