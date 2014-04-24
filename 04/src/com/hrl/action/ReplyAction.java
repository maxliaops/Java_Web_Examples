package com.hrl.action;

import java.util.Date;

import com.hrl.dao.IReplyDao;
import com.hrl.model.Reply;
import com.hrl.model.User;
import com.hrl.util.JSONKit;

public class ReplyAction extends DefaultAction {
	private IReplyDao replyDao = null;
	private Reply reply = null;
    /**
     * 添加回复，给客户端返回json格式的信息
     * @return
     */
	public String addReply() {
		User currUser = this.getCurrUser();
		if (currUser == null) {
			JSONKit.outJSONInfo("{success:false,msg:'你还没有登录,不能回复'}");
			return NONE;
		}
		this.reply.setReplyTime(new Date());
		this.replyDao.addReply(reply);
		JSONKit.outJSONInfo("{success:true,'userName':'"
				+ currUser.getUserName() + "','replyTime':'"
				+ this.getNowTime() + "','content':'"
				+ this.getReply().getContent() + "'}");
		return NONE;
	}

	public IReplyDao getReplyDao() {
		return replyDao;
	}

	public void setReplyDao(IReplyDao replyDao) {
		this.replyDao = replyDao;
	}

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

}
