package com.lyq.dao.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lyq.dao.DaoSupport;
import com.lyq.model.PageModel;
import com.lyq.model.product.ProductInfo;
@Repository("productDao")
@Transactional
public class ProductDaoImpl extends DaoSupport<ProductInfo> implements ProductDao {

	/**
	 * 查询点击排名前10个商品
	 */
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public List<ProductInfo> findClickcount() {
		Map<String, String> orderby = new HashMap<String, String>();
		orderby.put("clickcount", "desc");
		PageModel<ProductInfo> pageModel = find(1, 10, orderby);
		return pageModel.getList();
	}
	/**
	 * 查询推荐商品的前10件，按上架时间降序排序
	 */
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public List<ProductInfo> findCommend() {
		String where = "where commend=?";
		Object[] parames = {true};
		Map<String, String> orderby = new HashMap<String, String>();
		orderby.put("createTime", "desc");
		PageModel<ProductInfo> pageModel = find(where,parames ,orderby,1,10);
		return pageModel.getList();
	}
	/**
	 * 查询人气最好的前10件商品
	 */
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public List<ProductInfo> findSellCount() {
		Map<String, String> orderby = new HashMap<String, String>();
		orderby.put("sellCount", "desc");
		PageModel<ProductInfo> pageModel = find(1, 10, orderby);
		return pageModel.getList();
	}
}
