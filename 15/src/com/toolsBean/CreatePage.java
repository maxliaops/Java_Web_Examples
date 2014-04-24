package com.toolsBean;

public class CreatePage {
	private int currentP;			//当前页码
	private int allP;				//总页数
	private int allR;				//总记录数
	private int perR;				//每页显示记录数
	private String pageLink;		//分页导航栏信息
	private String pageInfo;		//分页状态显示信息
	
	public CreatePage(){
		currentP=1;
		allP=1;
		allR=0;
		perR=3;
		pageLink="";
		pageInfo="";
	}
	
	/** 设置每页显示记录数 */
	public void setPerR(int perR){
		this.perR=perR;
	}
	
	/** 设置总记录数 */
	public void setAllR(int allR){
		this.allR=allR;
	}
	/** 计算总页数 */
	public void setAllP(){
		allP=(allR%perR==0)?(allR/perR):(allR/perR+1);
	}
	
	/** 设置当前页码 */
	public void setCurrentP(String currentP) {		
		if(currentP==null||currentP.equals(""))
			currentP="1";
		try{
			this.currentP=Integer.parseInt(currentP);
		}catch(NumberFormatException e){
			this.currentP=1;
			e.printStackTrace();
		}
		if(this.currentP<1)
			this.currentP=1;
		if(this.currentP>allP)
			this.currentP=allP;		
	}

	/** 设置分页状态显示信息 */
	public void setPageInfo(){
		if(allP>=1){
			pageInfo="<table border='0' cellpadding='3'><tr><td>";
			pageInfo+="每页显示："+perR+"/"+allR+" 条记录！";
			pageInfo+="&nbsp;&nbsp;&nbsp;&nbsp;";
			pageInfo+="当前页："+currentP+"/"+allP+" 页！";
			pageInfo+="</td></tr></table>";			
		}				
	}
	
    /** 设置分页导航栏信息 */
	public void setPageLink(String goWhich){
		if(goWhich==null)
			goWhich="";
		if(goWhich.indexOf("?")>=0)
			goWhich+="&";
		else
			goWhich+="?";
		if(allP>1){
			pageLink="<table border='0' cellpadding='3'><tr><td>";
			if(currentP>1){
				pageLink+="<a href='"+goWhich+"showPage=1'>首页</a>&nbsp;&nbsp;";
				pageLink+="<a href='"+goWhich+"showPage="+(currentP-1)+"'>上一页</a>&nbsp;&nbsp;";
			}
			if(currentP<allP){
				pageLink+="<a href='"+goWhich+"showPage="+(currentP+1)+"'>下一页</a>&nbsp;&nbsp;";
				pageLink+="<a href='"+goWhich+"showPage="+allP+"'>尾页</a>";
			}
			pageLink+="</td></tr></table>";			
		}		
	}
	
	
	/** 返回每页记录数 */
	public int getPerR(){
		return perR;
	}
	
	/** 返回总记录数 */
	public int getAllR() {
		return allR;
	}	
	
    /** 返回总页数 */
	public int getAllP() {		
		return allP;
	}

	/** 返回当前页码 */
	public int getCurrentP() {
		return currentP;
	}
	
	/** 返回分页状态显示信息 */
	public String getPageInfo(){
		return pageInfo;
	}

	/** 返回分页导航栏信息 */
	public String getPageLink(){
		return pageLink;
	}
}