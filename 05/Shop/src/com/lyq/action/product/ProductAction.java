package com.lyq.action.product;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.lyq.action.BaseAction;
import com.lyq.model.PageModel;
import com.lyq.model.product.ProductCategory;
import com.lyq.model.product.ProductInfo;
import com.lyq.model.product.UploadFile;
import com.lyq.util.StringUitl;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 商品Action
 * @author Li Yongqiang
 */
@Scope("prototype")
@Controller("productAction")
public class ProductAction extends BaseAction implements ModelDriven<ProductInfo>{
	private static final long serialVersionUID = 1L;
	/**
	 * 根据id查看商品信息(查看后更新人气点击次数)
	 * @return String
	 * @throws Exception
	 */
	public String select() throws Exception {
		if(product.getId() != null && product.getId() > 0){
			product = productDao.get(product.getId());
			product.setClickcount(product.getClickcount() + 1);
			productDao.update(product);
		}
		return SELECT;
	}
	/**
	 * 根据类别id查询所有商品信息
	 * @return String
	 * @throws Exception
	 */
	public String getByCategoryId() throws Exception{
		if(product.getCategory().getId() != null){
			String where = "where category.id = ?";
			Object[] queryParams = {product.getCategory().getId()};
			pageModel = productDao.find(pageNo, pageSize, where, queryParams);
		}
		return LIST;
	}
	/**
	 * 新品上市
	 * @return
	 * @throws Exception
	 */
	public String findNewProduct() throws Exception{
		Map<String, String> orderby = new HashMap<String, String>();//定义Map集合
		orderby.put("createTime", "desc");//为Map集合赋值
		pageModel = productDao.find(1, 5, orderby );//执行查找方法
		image.put("url", "01.gif");//设置副标题图片
		return "list";//返回商品列表页面
	}
	/**
	 * 热销商品
	 * @return
	 * @throws Exception
	 */
	public String findSellProduct() throws Exception{
		Map<String, String> orderby = new HashMap<String, String>();//定义Map集合
		orderby.put("sellCount", "desc");//为Map集合赋值
		pageModel = productDao.find(1, 5, orderby );//执行查找方法
		image.put("url", "03.gif");
		return "list";//返回商品列表页面
	}
	/**
	 * 推荐商品
	 * @return
	 * @throws Exception
	 */
	public String findCommendProduct() throws Exception{
		Map<String, String> orderby = new HashMap<String, String>();//定义Map集合
		orderby.put("createTime", "desc");//为Map集合赋值
		String where = "where commend = ?";//设置条件语句
		Object[] queryParams = {true};//设置参数值
		pageModel = productDao.find(where, queryParams, orderby, 1, 5);//执行查询方法
		image.put("url", "06.gif");
		return "list";//返回商品列表页面
	}
	/**
	 * 人气商品
	 * @return
	 * @throws Exception
	 */
	public String findEnjoyProduct() throws Exception{
		Map<String, String> orderby = new HashMap<String, String>();//定义Map集合
		orderby.put("clickcount", "desc");//为Map集合赋值
		pageModel = productDao.find(1, 5, orderby );//执行查找方法
		image.put("url", "07.gif");
		return "list";//返回商品列表页面
	}
	/**
	 * 根据名称模糊查询
	 * @return String
	 * @throws Exception
	 */
	public String findByName() throws Exception {
		if(product.getName() != null){
			String where = "where name like ?";//查询的条件语句
			Object[] queryParams = {"%" + product.getName() + "%"};//为参数赋值
			pageModel = productDao.find(pageNo, pageSize, where, queryParams );//执行查询方法
		}
		image.put("url", "04.gif");
		return LIST;//返回列表首页
	}
	/**
	 * 按人气查询
	 * @return String
	 * @throws Exception
	 */
	public String findByClick() throws Exception{
		Map<String, String> orderby = new HashMap<String, String>();//定义Map集合
		orderby.put("clickcount", "desc");//为Map集合赋值
		pageModel = productDao.find(1, 8, orderby );//执行查找方法
		return "clickList";//返回product_click_list.jsp页面
	}
	/**
	 * 按推荐查询
	 * @return String
	 * @throws Exception
	 */
	public String findByCommend() throws Exception{
		Map<String, String> orderby = new HashMap<String, String>();//定义Map集合
		orderby.put("sellCount", "desc");//为Map集合赋值
		String where = "where commend = ?";//设置条件语句
		Object[] queryParams = {true};//设置参数值
		pageModel = productDao.find(where, queryParams, orderby, pageNo, pageSize);//执行查询方法
		return "findList";//返回product_find_list.jsp页面
	}
	/**
	 * 按销量查询
	 * @return String
	 * @throws Exception
	 */
	public String findBySellCount() throws Exception{
		Map<String, String> orderby = new HashMap<String, String>();//定义Map集合
		orderby.put("sellCount", "desc");//为Map集合赋值
		pageModel = productDao.find(1, 6, orderby );//执行查询方法
		return "findList";//返回热销商品列表
	}
	
	
	/**
	 * 添加商品
	 */
	@Override
	public String add() throws Exception {
		createCategoryTree();
		return INPUT;
	}
	/**
	 * 保存商品
	 * @return
	 * @throws Exception
	 */
	public String save() throws Exception{
		if(file != null ){//如果文件路径不为空
			//获取服务器的绝对路径
			String path = ServletActionContext.getServletContext().getRealPath("/upload");
			File dir = new File(path);
			if(!dir.exists()){//如果文件夹不存在
				dir.mkdir();//创建文件夹
			}
			String fileName = StringUitl.getStringTime() + ".jpg";//自定义图片名称
			FileInputStream fis = null;//输入流
			FileOutputStream fos = null;//输出流
			try {
				fis = new FileInputStream(file);//根据上传文件创建InputStream实例
				fos = new FileOutputStream(new File(dir,fileName)); //创建写入服务器地址的输出流对象
				byte[] bs = new byte[1024 * 4]; //创建字节数组实例
				int len = -1;
				while((len = fis.read(bs)) != -1){//循环读取文件
					fos.write(bs, 0, len);//向指定的文件夹中写数据
				}
				UploadFile uploadFile = new UploadFile();//实例化对象
				uploadFile.setPath(fileName);//设置文件名称
				product.setUploadFile(uploadFile);//设置上传路径
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				fos.flush();
				fos.close();
				fis.close();
			}
		}
		//如果商品类别和商品类别ID不为空，则保存商品类别信息
		if(product.getCategory() != null && product.getCategory().getId() != null){
			product.setCategory(categoryDao.load(product.getCategory().getId()));
		}
		//如果上传文件和上传文件ID不为空，则保存文件的上传路径信息
		if(product.getUploadFile() != null && product.getUploadFile().getId() != null){
			product.setUploadFile(uploadFileDao.load(product.getUploadFile().getId()));
		}
		productDao.saveOrUpdate(product);//保存商品信息
		return list();
	}
	/**
	 * 查询商品
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception{
		pageModel = productDao.find(pageNo, pageSize);//调用公共的查询方法
		return LIST;//返回后台商品列表页面
	}
	/**
	 * 编辑商品
	 * @return String
	 * @throws Exception
	 */
	public String edit() throws Exception{
		this.product = productDao.get(product.getId());//执行封装的查询方法
		createCategoryTree();//生成商品的类别树
		return EDIT;//返回商品信息编辑页面
	}
	/**
	 * 删除商品
	 * @return String
	 * @throws Exception
	 */
	public String del() throws Exception{
		productDao.delete(product.getId());//执行删除操作
		return list();//返回商品列表查找方法
	}
	/**
	 * 生成类别树
	 */
	private void createCategoryTree(){
		String where = "where level=1";//查询一级节点
		PageModel<ProductCategory> pageModel = categoryDao.find(-1, -1,where ,null);//执行查询方法
		List<ProductCategory> allCategorys = pageModel.getList();
		map = new LinkedHashMap<Integer, String>();//创建新的集合
		for(ProductCategory category : allCategorys){//遍历所有的一级节点
			setNodeMap(map,category,false);//将节点添加到Map集合中
		}
	}
	/**
	 * 将节点设置到Map中
	 * @param map 类别树Map
	 * @param node 类别
	 * @param flag 是否为末节点
	 */
	private void setNodeMap(Map<Integer, String> map,ProductCategory node,boolean flag){
		if (node == null) {//如果节点为空
			return;//返回空，结束程序运行
		}
		int level = node.getLevel();//获取节点级别
		StringBuffer sb = new StringBuffer();//定义字符串对象
		if (level > 1) {//如果不是根节点
			for (int i = 0; i < level; i++) {
				 sb.append("　");//添加空格
			}
			sb.append(flag ? "├" : "└");//如果为末节点添加"└"，反之添加"├"
		}
		map.put(node.getId(), sb.append(node.getName()).toString());//将节点添加的集合中
		Set<ProductCategory> children = node.getChildren();//获取其子节点	
		// 包含子类别
		if(children != null &&  children.size() > 0){//如果节点不为空
			int i = 0;
			// 遍历子类别
			for (ProductCategory child : children) {
				boolean b = true;
				if(i == children.size()-1){//如果子节点长度减1为i,说明为末节点
					b = false;//设置布尔常量为false
				}
				setNodeMap(map,child,b);//重新调用该方法
			}
		}
	}
	/**
	 * 验证商品信息是否有效
	 */
	public void validateSave() {
		if(!StringUitl.validateString(product.getName())){
			addFieldError("name", "商品名称不能为空！");
		}
		if(!StringUitl.validateFloat(product.getBaseprice())){
			addFieldError("baseprice", "采购价格填写有误！");
		}
		if(!StringUitl.validateFloat(product.getMarketprice())){
			addFieldError("marketprice", "市场价格填写有误！");
		}
		if(!StringUitl.validateFloat(product.getSellprice())){
			addFieldError("sellprice", "销售价格填写有误！");
		}
		if(!StringUitl.validateString(product.getDescription())){
			addFieldError("name", "商品说明不能为空！");
		}
		createCategoryTree();
	}


	// 商品对象
	private ProductInfo product = new ProductInfo();
	// 上传文件
	private File file;
	// 所有类别
	private Map<Integer, String> map;
	// 分页组件
	private PageModel<ProductInfo> pageModel;
	
	Map<String, String> image = new HashMap<String, String>();
	
	public Map<String, String> getImage() {
		return image;
	}
	public void setImage(Map<String, String> image) {
		this.image = image;
	}
	@Override
	public ProductInfo getModel() {
		return product;
	}
	public ProductInfo getProduct() {
		return product;
	}
	public void setProduct(ProductInfo product) {
		this.product = product;
	}
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public Map<Integer, String> getMap() {
		return map;
	}
	public void setMap(Map<Integer, String> map) {
		this.map = map;
	}
	public PageModel<ProductInfo> getPageModel() {
		return pageModel;
	}
	public void setPageModel(PageModel<ProductInfo> pageModel) {
		this.pageModel = pageModel;
	}
}
