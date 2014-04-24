package com.yxq.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.TreeMap;

import com.yxq.actionSuper.MySuperAction;
import com.yxq.dao.OpDB;

public class IndexAction extends MySuperAction {	
	public static TreeMap typeMap;					
	public static TreeMap searchMap;				

	public String execute() throws Exception {
		/* 查询所有收费信息，按发布时间降序排列 */
		OpDB myOp=new OpDB();
		String sql1="select * from tb_info where (info_state='1') and (info_payfor = '1') order by info_date desc";
		List payforlist=myOp.OpListShow(sql1,null);
		request.setAttribute("payforlist",payforlist);		

		/* 查询免费信息，按发布时间降序排列 */
		List allsublist=new ArrayList();
		if(typeMap!=null&&typeMap.size()!=0){
			Iterator itype=typeMap.keySet().iterator();			
			String sql2="SELECT TOP 5 * FROM tb_info WHERE (info_type = ?) AND (info_state='1') AND (info_payfor = '0') ORDER BY info_date DESC";			
			while(itype.hasNext()){
				Integer sign=(Integer)itype.next();
				Object[] params={sign};
				List onesublist=myOp.OpListShow(sql2, params);
				allsublist.add(onesublist);				
			}
			
		}
		request.setAttribute("allsublist",allsublist);
		session.put("typeMap",typeMap);
		session.put("searchMap",searchMap);		
		
		return SUCCESS;
	}
	
	static{
		OpDB myOp=new OpDB();
		
		/* 获取所有信息类别 */
		String sql="select * from tb_type order by type_sign";
		typeMap=myOp.OpGetListBox(sql,null);
		if(typeMap==null)
			typeMap=new TreeMap();

		/* 初始化搜索功能的下拉列表 */
		searchMap=new TreeMap();
		searchMap.put("ID值","id");
		searchMap.put("信息标题","info_title");
		searchMap.put("信息内容","info_content");
		searchMap.put("联系人","info_linkman");
		searchMap.put("联系电话","info_phone");
		searchMap.put("E-mail地址","info_email");
	}
}
