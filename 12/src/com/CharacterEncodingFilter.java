package com;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter {

	protected String encoding = null;// 定义编码格式变量
	protected FilterConfig filterConfig = null;// 定义过滤器配置对象

	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig; // 初始化过滤器配置对象
		this.encoding = filterConfig.getInitParameter("encoding");// 获取配置文件中指定的编码格式
	}

	// 过滤器的接口方法，用于执行过滤业务
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		if (encoding != null) {
			request.setCharacterEncoding(encoding); // 设置请求的编码
			response.setContentType("text/html; charset=" + encoding);// 设置应答对象的内容类型（包括编码格式）
		}
		chain.doFilter(request, response); // 传递给下一个过滤器
	}

	public void destroy() {
		this.encoding = null;
		this.filterConfig = null;
	}
}
