package com.lyq.util;
/**
 * Òì³£
 * @author Li Yongqiang
 *
 */
public class AppException extends RuntimeException {
	private static final long serialVersionUID = 1L;
	private String message;
	private String[] args;
	private String defaultMessage;
	
	public AppException(String message){
		this.message = message;
	}
	public AppException(String message, String...args){
		this.message = message;
		if(args != null && args.length > 0){
			
		}
	}
	public AppException(String message, String[] args, String defaultMessage) {
		this.message = message;
		this.args = args;
		this.defaultMessage = defaultMessage;
	}
	public String getMessage() {
		return message;
	}
	public String[] getArgs() {
		return args;
	}
	public String getDefaultMessage() {
		return defaultMessage;
	}
}
