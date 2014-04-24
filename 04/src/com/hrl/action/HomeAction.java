package com.hrl.action;

import com.hrl.model.User;

public class HomeAction extends DefaultAction {

	public String index() {
		User user = this.getCurrUser();
		return "index";
	}

}
