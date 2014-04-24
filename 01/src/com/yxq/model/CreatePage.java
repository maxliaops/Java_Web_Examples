package com.yxq.model;

public class CreatePage {
	private int CurrentP;			//当前页码
	private int AllP;				//总页数
	private int AllR;				//总记录数
	private int PerR;				//每页显示记录数
	private String PageLink;		//分页导航栏信息
	private String PageInfo;		//分页状态显示信息
	
	public CreatePage(){
		CurrentP=1;
		AllP=1;
		AllR=0;
		PerR=3;
		PageLink="";
		PageInfo="";
	}
	
	/** 设置每页显示记录数 */
	public void setPerR(int PerR){
		this.PerR=PerR;
	}
	
	/** 设置总记录数 */
	public void setAllR(int AllR){
		this.AllR=AllR;
	}
	/** 计算总页数 */
	public void setAllP(){
		AllP=(AllR%PerR==0)?(AllR/PerR):(AllR/PerR+1);
	}
	
	/** 设置当前页码 */
	public void setCurrentP(String currentP) {		
		if(currentP==null||currentP.equals(""))
			currentP="1";
		try{
			CurrentP=Integer.parseInt(currentP);
		}catch(NumberFormatException e){
			CurrentP=1;
			e.printStackTrace();
		}
		if(CurrentP<1)
			CurrentP=1;
		if(CurrentP>AllP)
			CurrentP=AllP;		
	}

	/** 设置分页状态显示信息 */
	public void setPageInfo(){
		if(AllP>1){
			PageInfo="<table border='0' cellpadding='3'><tr><td>";
			PageInfo+="每页显示："+PerR+"/"+AllR+" 条记录！";
			PageInfo+="当前页："+CurrentP+"/"+AllP+" 页！";
			PageInfo+="</td></tr></table>";			
		}				
	}
	
    /** 设置分页导航栏信息 */
	public void setPageLink(String gowhich){
		if(gowhich==null)
			gowhich="";
		if(gowhich.indexOf("?")>=0)
			gowhich+="&";
		else
			gowhich+="?";
		if(AllP>1){
			PageLink="<table border='0' cellpadding='3'><tr><td>";
			if(CurrentP>1){
				PageLink+="<a href='"+gowhich+"showpage=1'>首页</a>&nbsp;";
				PageLink+="<a href='"+gowhich+"showpage="+(CurrentP-1)+"'>上一页</a>&nbsp;";
			}
			if(CurrentP<AllP){
				PageLink+="<a href='"+gowhich+"showpage="+(CurrentP+1)+"'>下一页</a>&nbsp;";
				PageLink+="<a href='"+gowhich+"showpage="+AllP+"'>尾页</a>";
			}
			PageLink+="</td></tr></table>";			
		}		
	}
	
	/** 返回每页记录数 */
	public int getPerR(){
		return PerR;
	}
	
	/** 返回总记录数 */
	public int getAllR() {
		return AllR;
	}	
	
    /** 返回总页数 */
	public int getAllP() {		
		return AllP;
	}

	/** 返回当前页码 */
	public int getCurrentP() {
		return CurrentP;
	}
	
	/** 返回分页状态显示信息 */
	public String getPageInfo(){
		return PageInfo;
	}

	/** 返回分页导航栏信息 */
	public String getPageLink(){
		return PageLink;
	}
}
