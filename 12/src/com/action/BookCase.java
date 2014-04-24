package com.action;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.actionForm.BookCaseForm;
import com.dao.BookCaseDAO;

public class BookCase extends HttpServlet {
    private BookCaseDAO bookCaseDAO=null;
    public BookCase(){
        this.bookCaseDAO=new BookCaseDAO();
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
    String action =request.getParameter("action");
    System.out.println("\nbookCase*********************action="+action);
    if(action==null||"".equals(action)){
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }else if("bookCaseAdd".equals(action)){
        bookCaseAdd(request,response);
    }else if("bookCaseQuery".equals(action)){
        bookCaseQuery(request,response);
    }else if("bookCaseModifyQuery".equals(action)){
        bookCaseModifyQuery(request,response);
    }else if("bookCaseModify".equals(action)){
        bookCaseModify(request,response);
    }else if("bookCaseDel".equals(action)){
        bookCaseDel(request,response);
    }
    }
 /***********************添加书架信息**************************/
 private void bookCaseAdd(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	 BookCaseForm bookCaseForm=new BookCaseForm();
        bookCaseForm.setName(request.getParameter("name"));
        int a=bookCaseDAO.insert(bookCaseForm);
        if(a==0){
            request.setAttribute("error","书架信息添加失败！");
            request.getRequestDispatcher("error.jsp").forward(request, response);
      }else if(a==2){
          request.setAttribute("error","该书架信息已经添加！");
          request.getRequestDispatcher("error.jsp").forward(request, response);
      }else{
    	  request.getRequestDispatcher("bookcase_ok.jsp?para=1").forward(request, response);
     }
    }
    /***********************查询全部书架信息**************************/
    private void bookCaseQuery(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
    String str=null;
    request.setAttribute("bookcase",bookCaseDAO.query(str));
    request.getRequestDispatcher("bookcase.jsp").forward(request, response);
    }
     /***********************查询修改书架信息**************************/
     private void bookCaseModifyQuery(HttpServletRequest request, HttpServletResponse response)
 	throws ServletException, IOException {
    	 BookCaseForm bookCaseForm=new BookCaseForm();
         bookCaseForm.setId(Integer.valueOf(request.getParameter("ID")));
         request.setAttribute("bookCaseQueryif",bookCaseDAO.queryM(bookCaseForm));
         request.getRequestDispatcher("bookCase_Modify.jsp").forward(request, response);
     }
     /***********************修改书架信息**************************/
     private void bookCaseModify(HttpServletRequest request, HttpServletResponse response)
 	throws ServletException, IOException {
    	 BookCaseForm bookCaseForm=new BookCaseForm();
    	 bookCaseForm.setId(Integer.parseInt(request.getParameter("id")));
         bookCaseForm.setName(request.getParameter("name"));
         int ret=bookCaseDAO.update(bookCaseForm);
         if(ret==0){
             request.setAttribute("error","修改书架信息失败！");
             request.getRequestDispatcher("error.jsp").forward(request, response);
         }else{
        	 request.getRequestDispatcher("bookcase_ok.jsp?para=2").forward(request, response);
         }
     }
     /***********************删除书架信息**************************/
     private void bookCaseDel(HttpServletRequest request, HttpServletResponse response)
 	throws ServletException, IOException {
         BookCaseForm bookCaseForm=new BookCaseForm();
         bookCaseForm.setId(Integer.valueOf(request.getParameter("ID")));
         int ret=bookCaseDAO.delete(bookCaseForm);
         if(ret==0){
             request.setAttribute("error","删除书架信息失败！");
             request.getRequestDispatcher("error.jsp").forward(request, response);
         }else{
        	 request.getRequestDispatcher("bookcase_ok.jsp?para=3").forward(request, response);
         }
     }
 	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

doGet(request, response);
}
}
