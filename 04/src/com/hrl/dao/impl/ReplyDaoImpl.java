package com.hrl.dao.impl;

import java.util.List;

import com.hrl.dao.IReplyDao;
import com.hrl.dao.IUserDao;
import com.hrl.model.Article;
import com.hrl.model.Reply;
import com.hrl.model.User;

public class ReplyDaoImpl extends DefaultDaoImpl implements IReplyDao {
/**
 * 添加回复
 */
	public void addReply(Reply reply) {
        this.save(reply);
	}
}
