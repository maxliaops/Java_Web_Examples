package com.tools;

import java.util.ArrayList;
import java.util.List;

public class MyPagination {
	public List<Object> list=null;
	private int recordCount=0;
	private int pagesize=0;
	private int maxPage=0;

	public List getInitPage(List list,int Page,int pagesize){
		List<Object> newList=new ArrayList<Object>();
		this.list=list;
		recordCount=list.size();
		this.pagesize=pagesize;
		this.maxPage=getMaxPage();
		try{
		for(int i=(Page-1)*pagesize;i<=Page*pagesize-1;i++){
			try{
				if(i>=recordCount){break;}
			}catch(Exception e){}
			newList.add((Object)list.get(i));
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return newList;
	}

	public List<Object> getAppointPage(int Page){
		List<Object> newList=new ArrayList<Object>();
		try{
			for(int i=(Page-1)*pagesize;i<=Page*pagesize-1;i++){
				try{
					if(i>=recordCount){break;}
				}catch(Exception e){}
				newList.add((Object)list.get(i));
			}
			}catch(Exception e){
				e.printStackTrace();
			}
			return newList;
	}

	public int getMaxPage(){
		int maxPage=(recordCount%pagesize==0)?(recordCount/pagesize):(recordCount/pagesize+1);
		return maxPage;
	}

	public int getRecordSize(){
		return recordCount;
	}
	

	public int getPage(String str){		
		if(str==null){
			str="0";
		}
		int Page=Integer.parseInt(str);
		if(Page<1){
			Page=1;
		}else{
			if(((Page-1)*pagesize+1)>recordCount){
				Page=maxPage;
			}
		}
		return Page;
	}

	


	public String printCtrl(int Page){
		String strHtml="<table width='370'  border='0' cellspacing='0' cellpadding='0'><tr> <td height='24' align='right'>当前页数：["+Page+"/"+maxPage+"]&nbsp;&nbsp;";
		try{
		if(Page>1){
			strHtml=strHtml+"<a href='?&Page=1'>第一页</a>　";
			strHtml=strHtml+"&nbsp;&nbsp;<a href='?Page="+(Page-1)+"'>上一页</a>";
		}
		if(Page<maxPage){
			strHtml=strHtml+"&nbsp;&nbsp;<a href='?Page="+(Page+1)+"'>下一页</a>&nbsp;&nbsp;　<a href='?Page="+maxPage+"'>最后一页&nbsp;</a>";
		}
		strHtml=strHtml+"</td> </tr>	</table>";
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return strHtml;
	}
	
	
	
}
