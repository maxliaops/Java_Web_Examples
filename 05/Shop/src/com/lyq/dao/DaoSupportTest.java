package com.lyq.dao;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.Map;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.lyq.model.PageModel;
import com.lyq.model.order.Order;
/**
 * 测试类
 * @author CHUNBIN
 *
 */
public class DaoSupportTest {
	private DaoSupport<Order> daoSupport;//DAO
	@Before
	public void setUp() throws Exception {//初始化方法，最先执行的方法
		daoSupport = new DaoSupport<Order>();
	}
	@After
	public void tearDown() throws Exception {//清理方法，最后执行的方法
		daoSupport=null;//销毁对象
	}
	@Test
	public void testFindIntInt() {
		Map<String, String> orderby = new HashMap<String, String>(1);//定义Map集合
		orderby.put("createTime", "desc");//设置按创建时间倒序排列
		PageModel<Order> pageModel = daoSupport.find(1, 3);//执行查询方法
		assertNotNull("无法获取数据！",pageModel);//判断find()方法是否成功查询到值
	}
}
