package com.lyq.action.product;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.lyq.action.BaseAction;
import com.lyq.model.PageModel;
import com.lyq.model.product.ProductCategory;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 商品类别Action对象
 * @author Li Yongqiang
 *
 */
@Scope("prototype")
@Controller("productCategoryAction")
public class ProductCategoryAction extends BaseAction implements ModelDriven<ProductCategory>{
	private static final long serialVersionUID = 1L;
	private ProductCategory category = new ProductCategory();
	@Override
	public ProductCategory getModel() {
		return category;
	}
	
	@Override
	public String add() throws Exception {
		if(pid != null && pid > 0 ){
			ProductCategory parent = categoryDao.load(pid);
			// 层次加1
			category.setLevel(parent.getLevel() + 1);
		}
		return INPUT;
	}
	/**
	 * 添加类别
	 * @return
	 * @throws Exception
	 */
	public String save() throws Exception{
		if(pid != null && pid > 0 ){//如果有父节点
			category.setParent(categoryDao.load(pid));//设置其父节点
		}
		categoryDao.saveOrUpdate(category);//添加类别信息
		return list();//返回类别列表的查找方法
	}
	/**
	 * 查询类别
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception{
		Object[] params = null;//对象数组为空
		String where;//查询条件变量
		if(pid != null && pid > 0 ){//如果有父节点
			where = "where parent.id =?";//执行查询条件
			params = new Integer[]{pid};//设置参数值
		}else{
			where = "where parent is null";//查询根节点
		}
		pageModel = categoryDao.find(pageNo,pageSize,where,params);//执行封装的查询方法
		return LIST;//返回后台类别列表页面
	}
	/**
	 * 编辑类别
	 * @return String
	 * @throws Exception
	 */
	public String edit() throws Exception{
		if(category.getId() != null && category.getId() > 0){
			this.category = categoryDao.get(category.getId());
		}
		return EDIT;
	}
	/**
	 * 删除类别
	 * @return String
	 * @throws Exception
	 */
	public String del() throws Exception{
		if(category.getId() != null && category.getId() > 0){//判断是否获得ID参数
			categoryDao.delete(category.getId());//执行删除操作
		}
		return list();//返回商品类别列表的查找方法
	}
	// 父类别id
	private Integer pid;
	// 所有类别
	private PageModel<ProductCategory> pageModel;
	
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public PageModel<ProductCategory> getPageModel() {
		return pageModel;
	}
	public ProductCategory getCategory() {
		return category;
	}
	public void setCategory(ProductCategory category) {
		this.category = category;
	}
}
