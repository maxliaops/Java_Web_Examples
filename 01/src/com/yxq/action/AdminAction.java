package com.yxq.action;

import java.util.List;

import com.yxq.actionSuper.AdminSuperAction;
import com.yxq.dao.OpDB;
import com.yxq.model.CreatePage;

public class AdminAction extends AdminSuperAction {

	/** 功能：管理员操作-进行列表显示信息 */
	public String ListShow(){
		request.setAttribute("mainPage","../info/listshow.jsp");
		session.remove("adminOP");	
		
		int infoType=showType.getInfoType();
		String stateType=showType.getStateType();
		String payforType=showType.getPayforType();

		session.put("infoType",Integer.valueOf(infoType));  				//保存已选择的“信息类别”的选项
		session.put("payforType",payforType);								//保存已选择的“付费状态”的选项
		session.put("stateType",stateType);									//保存已选择的“审核状态”的选项		
		
		String sqlall="";
		String sqlsub="";
		Object[] params=null;
		String mark="";		
		int perR=8;
		
		if(!stateType.equals("all")&&!payforType.equals("all")){			//没有同时选择“付费状态”与“审核状态”中的“全部”选项
			mark="1";
			sqlall="SELECT * FROM tb_info WHERE (info_type=?) AND (info_state=?) AND (info_payfor=?) ORDER BY info_date DESC";
			sqlsub="SELECT TOP "+perR+" * FROM tb_info WHERE (info_type=?) AND (info_state=?) AND (info_payfor=?) ORDER BY info_date DESC";			
			params=new Object[3];
			params[0]=Integer.valueOf(infoType);
			params[1]=stateType;
			params[2]=payforType;					
		}else if(stateType.equals("all")&&payforType.equals("all")){		//同时选择了“付费状态”与“审核状态”中的“全部”选项
			mark="2";
			sqlall="SELECT * FROM tb_info WHERE (info_type=?) ORDER BY info_date DESC";
			sqlsub="SELECT TOP "+perR+" * FROM tb_info WHERE (info_type=?) ORDER BY info_date DESC";			
			params=new Object[1];
			params[0]=Integer.valueOf(infoType);
		}else if(payforType.equals("all")){									//选择了“付费状态”中的“全部”选项，“审核状态”选项任意
			mark="3";
			sqlall="SELECT * FROM tb_info WHERE (info_type=?) AND (info_state=?) ORDER BY info_date DESC";
			sqlsub="SELECT TOP "+perR+" * FROM tb_info WHERE (info_type=?) AND (info_state=?) ORDER BY info_date DESC";
			params=new Object[2];
			params[0]=Integer.valueOf(infoType);
			params[1]=stateType;
		}
		else if(stateType.equals("all")){  									//选择了“审核状态”中的“全部”选项，“付费状态”选项任意
			mark="4";
			sqlall="SELECT * FROM tb_info WHERE (info_type=?) AND (info_payfor=?) ORDER BY info_date DESC";
			sqlsub="SELECT TOP "+perR+" * FROM tb_info WHERE (info_type=?) AND (info_payfor=?) ORDER BY info_date DESC";
			params=new Object[2];
			params[0]=Integer.valueOf(infoType);
			params[1]=payforType;
		}		
		
		String strCurrentP=request.getParameter("showpage");
		String gowhich="admin_ListShow.action";
		
		OpDB myOp=new OpDB();
		CreatePage createPage=myOp.OpCreatePage(sqlall, params,perR,strCurrentP,gowhich);			//调用OpDB类中的OpCreatePage()方法计算出总记录数、总页数，并且设置当前页码，这些信息都封装到了createPage对象中
		
		int currentP=createPage.getCurrentP();		
		if(currentP>1){
			int top=(currentP-1)*perR;
			if(mark.equals("1")){
				sqlsub="SELECT TOP "+perR+" * FROM tb_info i WHERE (info_type = ?) AND (info_payfor = ?) AND (info_state = ?) AND (info_date < (SELECT MIN(info_date) FROM (SELECT TOP "+top+" (info_date) FROM tb_info WHERE (info_type = i.info_type) AND (info_payfor = i.info_payfor) AND (info_state = i.info_state) ORDER BY info_date DESC) AS mindate)) ORDER BY info_date DESC";
			}
			else if(mark.equals("2")){
				sqlsub="SELECT TOP "+perR+" * FROM tb_info i WHERE (info_type = ?) AND (info_date < (SELECT MIN(info_date) FROM (SELECT TOP "+top+" (info_date) FROM tb_info WHERE (info_type = i.info_type) ORDER BY info_date DESC) AS mindate)) ORDER BY info_date DESC";
			}
			else if(mark.equals("3")){
				sqlsub="SELECT TOP "+perR+" * FROM tb_info i WHERE (info_type = ?) AND (info_state = ?) AND (info_date < (SELECT MIN(info_date) FROM (SELECT TOP "+top+" (info_date) FROM tb_info WHERE (info_type = i.info_type) AND (info_state = i.info_state) ORDER BY info_date DESC) AS mindate)) ORDER BY info_date DESC";
			}
			else if(mark.equals("4")){
				sqlsub="SELECT TOP "+perR+" * FROM tb_info i WHERE (info_type = ?) AND (info_payfor = ?) AND (info_date < (SELECT MIN(info_date) FROM (SELECT TOP "+top+" (info_date) FROM tb_info WHERE (info_type = i.info_type) AND (info_payfor = i.info_payfor) ORDER BY info_date DESC) AS mindate)) ORDER BY info_date DESC";
			}				
		}

		List adminlistshow=myOp.OpListShow(sqlsub, params);
		request.setAttribute("adminlistshow",adminlistshow);
		request.setAttribute("createpage",createPage);
		return SUCCESS;
	}

	
	/** 功能：管理员操作-显示要审核的信息 */
	public String CheckShow(){
		request.setAttribute("mainPage","../info/checkshow.jsp");		
		comebackState();
		String sql="SELECT * FROM tb_info WHERE (id = ?)";
		String checkID=request.getParameter("checkID");
		if(checkID==null||checkID.equals(""))
			checkID="-1";
		Object[] params={checkID};
		OpDB myOp=new OpDB();
		infoSingle=myOp.OpSingleShow(sql, params);		
		if(infoSingle==null){			//信息不存在
			request.setAttribute("mainPage","/pages/error.jsp");
			addFieldError("AdminShowNoExist",getText("city.singleshow.no.exist"));
		}
		return SUCCESS;
	}
	
	/** 功能：管理员操作-审核信息(更新数据库) */
	public String Check(){
		session.put("adminOP","Check");			//记录当前操作为“审核信息”			
		
		String checkID=request.getParameter("checkID");
		String sql="UPDATE tb_info SET info_state = 1 WHERE (id = ?)";
		Object[] params={checkID};
		
		OpDB myOp=new OpDB();
		int i=myOp.OpUpdate(sql, params);
		if(i>0){								//审核信息成功			
			return "checkSuccess";			
		}
		else{									//审核信息失败
			comebackState();
			addFieldError("AdminCheckUnSuccess",getText("city.admin.check.no.success"));			
			request.setAttribute("mainPage","/pages/error.jsp");
			return "UnSuccess";
		}
	}
	
	/** 功能：管理员操作-删除信息(更新数据库) */
	public String Delete(){
		session.put("adminOP","Delete");		//记录当前操作为“删除信息”			
		
		String deleteID=request.getParameter("deleteID");
		String sql="DELETE tb_info WHERE (id = ?)";
		Object[] params={deleteID};
		
		OpDB myOp=new OpDB();
		int i=myOp.OpUpdate(sql, params);
		if(i>0){								//删除信息成功			
			return "deleteSuccess";			
		}
		else{									//删除信息失败
			comebackState();
			addFieldError("AdminDeleteUnSuccess",getText("city.admin.delete.no.success"));			
			request.setAttribute("mainPage","/pages/error.jsp");
			return "UnSuccess";
		}
	}
	
	/** 功能：管理员操作-显示要进行付费设置的信息 */
	public String SetMoneyShow(){
		request.setAttribute("mainPage","../info/moneyshow.jsp");		
		
		String moneyID=request.getParameter("moneyID");
		if(moneyID==null||moneyID.equals(""))
			moneyID="-1";
		
		String sql="SELECT * FROM tb_info WHERE (id = ?)";
		Object[] params={moneyID};
		
		OpDB myOp=new OpDB();
		infoSingle=myOp.OpSingleShow(sql, params);		
		if(infoSingle==null){			//信息不存在
			request.setAttribute("mainPage","/pages/error.jsp");
			addFieldError("AdminShowNoExist",getText("city.singleshow.no.exist"));
		}
		return SUCCESS;
	}
	
	/** 功能：管理员操作-设置已付费信息(更新数据库) */
	public String SetMoney(){		
		String moneyID=request.getParameter("moneyID");
		if(moneyID==null||moneyID.equals(""))
			moneyID="-1";
		String sql="UPDATE tb_info SET info_payfor=1 WHERE (id = ?)";
		Object[] params={Integer.valueOf(moneyID)};
		
		OpDB myOp=new OpDB();
		int i=myOp.OpUpdate(sql, params);
		if(i>0){								//信息付费设置成功			
			addFieldError("AdminSetMoneySuccess",getText("city.admin.setmoney.success"));			
			request.setAttribute("mainPage","/pages/error.jsp");
			return "setMoneySuccess";			
		}
		else{									//信息付费设置失败
			addFieldError("AdminSetMoneyUnSuccess",getText("city.admin.setmoney.no.success"));			
			request.setAttribute("mainPage","/pages/error.jsp");
			return "UnSuccess";
		}
	}
	
	/** 功能：验证操作-后台进行列表显示信息时，验证是否选择了一种显示方式及信息类别 */
	public void validateListShow(){
		request.setAttribute("mainPage","/pages/error.jsp");
		
		String adminOP=(String)session.get("adminOP");
		if(adminOP==null)
			adminOP="";
		if(adminOP.equals("Check")||adminOP.equals("Delete"))    //如果是进行了“通过审核”或“删除信息”操作后，再来调用ListShow()方法显示信息列表，则需要恢复之前选择的“显示方式”和“信息类别”状态，从而重新在ListShow()方法中查询出符合条件的记录
			comebackState();			
		else{
			int getInfoType=showType.getInfoType();			
			String getPayforType=showType.getPayforType();
			String getStateType=showType.getStateType();
			
			if(getInfoType<=0){
				if(session.get("infoType")!=null){
					getInfoType=(Integer)session.get("infoType");
					showType.setInfoType(getInfoType);
				}
			}			
			if(getPayforType==null||getPayforType.equals("")){
				getPayforType=(String)session.get("payforType");
				showType.setPayforType(getPayforType);
			}
            if(getStateType==null||getStateType.equals("")){
            	getStateType=(String)session.get("stateType");
            	showType.setStateType(getStateType);
			}			
			
			if(getInfoType<=0){						//没有选择“信息类别”
				addFieldError("AdminListNoType",getText("city.admin.list.no.infoType"));
			}
			else{
				if(getPayforType==null||getPayforType.equals("")){		//没有选择“付费状态”选项
					addFieldError("AdminListNoPayForType",getText("city.admin.list.no.payforType"));
				}
				if(getStateType==null||getStateType.equals("")){			//没有选择“审核状态”选项
					addFieldError("AdminListNoStateType",getText("city.admin.list.no.stateType"));
				}
			}			
		}
	}
	
	/** 功能：验证操作-后台进行信息的付费设置操作时，验证是否输入了信息ID值和输入的ID值是否为数字格式 */
	public void validateSetMoneyShow() {
		request.setAttribute("mainPage","/pages/error.jsp");
		
		String moneyID=request.getParameter("moneyID");		
		if(moneyID==null||moneyID.equals("")){				//没有输入信息ID值
			addFieldError("moneyIDError",getText("city.admin.setMoney.no.moneyID"));
		}
		else{												//验证输入的信息ID值是否为数字格式			
			try{
				int id=Integer.parseInt(moneyID);
				if(id<0)									//若ID为负数
					addFieldError("moneyIDError",getText("city.admin.setMoney.moneyID.0"));
			}catch(NumberFormatException e){
				addFieldError("moneyIDError",getText("city.admin.setMoney.format.moneyID"));
				e.printStackTrace();
			}
		}
	}
	
	/** 功能：恢复在“显示方式”中的选择状态 */
	private void comebackState(){
		/* 获取session中保存的选择状态。
		 * 将选择状态保存在session中，
		 * 是在管理员单击“显示”按钮请求列表显示时，
		 * 在ListShow()方法中实现的
		 */
		Integer getInfoType=(Integer)session.get("infoType");
		String getPayForType=(String)session.get("payforType");
		String getStateType=(String)session.get("stateType");
		
		/* 恢复选择的状态 */
		if(getPayForType!=null&&getStateType!=null&&getInfoType!=null){			
			showType.setInfoType(getInfoType.intValue());	
			showType.setPayforType(getPayForType);
			showType.setStateType(getStateType);			
		}
	}
}
