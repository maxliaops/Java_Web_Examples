package com.dao;

import com.model.Goods;

public interface GoodsDao {
	public int insert(Goods g);

	public int update(Goods g);

	public int delete(Goods g);
}
