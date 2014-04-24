package com.yxq.actionSuper;

import com.yxq.model.AdminShowType;
import com.yxq.model.InfoSingle;

public class AdminSuperAction extends MySuperAction{
	protected AdminShowType showType;
	protected InfoSingle infoSingle;
	
	public AdminSuperAction(){

		showType=new AdminShowType();
		infoSingle=new InfoSingle();
	}
	public AdminShowType getShowType() {
		return showType;
	}
	
	public void setShowType(AdminShowType showType) {
		this.showType = showType;
	}

	public InfoSingle getInfoSingle() {
		return infoSingle;
	}

	public void setInfoSingle(InfoSingle infoSingle) {
		this.infoSingle = infoSingle;
	}	
}
