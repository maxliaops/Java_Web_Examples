package com.lyq.dao.product;

import org.springframework.stereotype.Repository;

import com.lyq.dao.DaoSupport;
import com.lyq.model.product.ProductCategory;
@Repository("productCategoryDao")
public class ProductCategoryDaoImpl extends DaoSupport<ProductCategory> implements ProductCategoryDao {

}
