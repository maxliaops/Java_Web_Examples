package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.actionForm.LibraryForm;
import com.dao.LibraryDAO;

public class Library extends HttpServlet {
    LibraryDAO libraryDAO=null;
    public Library(){
        libraryDAO=new LibraryDAO();
    }

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        String str=request.getParameter("action");
        if("libraryQuery".equals(str)){
            libraryModifyQuery(request,response);
        }else if("libraryModify".equals(str)){
            libraryModify(request,response);
        }
	} 
	

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
    

    private void libraryModify(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        LibraryForm libraryForm = new LibraryForm();
        libraryForm.setId(1);
        libraryForm.setLibraryname(request.getParameter("libraryname"));
        libraryForm.setCurator(request.getParameter("curator"));
        libraryForm.setTel(request.getParameter("tel"));
        libraryForm.setAddress(request.getParameter("address"));
        libraryForm.setEmail(request.getParameter("email"));
        libraryForm.setUrl(request.getParameter("url"));
        libraryForm.setCreateDate(request.getParameter("createDate"));
        libraryForm.setIntroduce(request.getParameter("introduce"));        
        int ret = libraryDAO.update(libraryForm);
        if (ret ==0) {
            request.setAttribute("error", "图书馆信息修改失败！");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } else {
        	request.getRequestDispatcher("library_ok.jsp?para=2").forward(request, response);
        }

    }
    private void libraryModifyQuery(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        request.setAttribute("libraryModifyif",libraryDAO.query());
        request.getRequestDispatcher("library_modify.jsp").forward(request, response);
    }
}
