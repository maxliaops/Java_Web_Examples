package com.lyq.dao.product;

import java.util.List;

import com.lyq.dao.BaseDao;
import com.lyq.model.product.ProductInfo;

public interface ProductDao extends BaseDao<ProductInfo>{
	public List<ProductInfo> findCommend();
	public List<ProductInfo> findClickcount();
	public List<ProductInfo> findSellCount();
}
