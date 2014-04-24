package com.struts.filter;       		//将过滤器保存在com.struts.filter包下
import java.io.IOException;      		//导入java.io.IOException类
import javax.servlet.Filter;			//导入javax.servlet.Filter类
import javax.servlet.FilterChain;		//导入javax.servlet.FilterChain类
import javax.servlet.FilterConfig;		//导入avax.servlet.FilterConfig类
import javax.servlet.ServletException;	//导入avax.servlet.ServletException类
import javax.servlet.ServletRequest;	//导入javax.servlet.ServletRequest类
import javax.servlet.ServletResponse;	//导入javax.servlet.ServletResponse类
public class MyFilter implements Filter {
      			
		
   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	    request.setCharacterEncoding("gb2312");   	//设置request的编码格式
	    response.setCharacterEncoding("gb2312");  	//设置response的编码格式
	    chain.doFilter(request, response);			//调用FilterChain对象的doFilter()方法
		
	}
   public void init(FilterConfig arg0) throws ServletException {
   }                        //该方法体为空
   public void destroy() {
							//destroy()此方法体为空
	
  }
}
