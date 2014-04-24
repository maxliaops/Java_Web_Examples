package com.mingri.info;

import com.mingri.dbconn.DBResult;
import java.sql.ResultSet;
import java.sql.SQLException;

public class QuestString {

	  private int curPage;           //当前页数
	  private int maxPage;          //最大页数
	  private int maxRowCount;     //总记录数(即从数据库中查出的所有记录)
	  private int pageSize=2;        //每页要显示的记录数
	  private DBResult db;         //记录集对象
	  private String httpFile;        //当前地址栏的文件，即具体的JSP文件
	  private String cif;            //选择的查询字段
	  private String ccif;           //选择的查询运算符
	  private String qvalue;         //查询关键字
	  private String countSql=null;      //用来存储select count (*) ……语句
	  private String topSql=null;        //用来存储 select top 2……语句
	  private String nowPage=null;      //初始化当前页curPage变量，即获取当前页的具体页号
	  private String str_parameter;      //在做翻页时，传递除pages以外的其他参数
	  private String andor;            //查询的与/或条件
	  private String sdate;            //查询起始时间，即从什么日期开始查询
	  private String edate;            //查询结束时间，即到什么日期结束
	  private String orderby;          //排序条件，即按什么排序
	  private String paixu;            //排序方法，即升序或降序
	  public QuestString(){           //构造方法，用来设置db为一个DBResult()对象
		pageSize = 2;
		countSql = null;
		topSql = null;
		nowPage = null;
		db = new DBResult();
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int i) {
		curPage = i;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int i) {
		maxPage = i;
	}

	public int getMaxRowCount() {
		return maxRowCount;
	}

	public void setMaxRowCount(int i) {
		maxRowCount = i;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int i) {
		pageSize = i;
	}

	public String getHttpFile() {
		return httpFile;
	}

	public void setHttpFile(String s) {
		httpFile = s;
	}

	public String getCcif() {
		return ccif;
	}

	public void setCcif(String s) {
		ccif = s;
	}

	public String getCif() {
		return cif;
	}

	public void setCif(String s) {
		cif = s;
	}

	public String getQValue() {
		return qvalue;
	}

	public void setQValue(String s) {
		qvalue = s;
	}

	public String getStr_parameter() {
		return str_parameter;
	}

	public void setStr_parameter(String s) {
		str_parameter = s;
	}

	public String getAndor() {
		return andor;
	}

	public void setAndor(String s) {
		andor = s;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String s) {
		sdate = s;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String s) {
		edate = s;
	}

	public String getOrderby() {
		return orderby;
	}

	public void setOrderby(String s) {
		orderby = s;
	}

	public String getPaixu() {
		return paixu;
	}

	public void setPaixu(String s) {
		paixu = s;
	}
	/**
	   * 通过参数传递来设置Bean中的属性
	   */
	public void setQuerySql(String s, String s1, String s2) {
		nowPage = s1;		//将表单提交过来的参数pages(第几页)的值传递给变量nowPage保存
		httpFile = s;    	//用来动态设置处理表单请求的JSP文件
		countSql = s2; 		//用来设置执行select count(*)……的SQL语句
		try {
			querySql(countSql);//调用querySql()方法，并将参数countSql传递到该方法中
		} catch (Exception exception) {
			exception.printStackTrace();
		}
	}
	  /**
	   * 执行SQL语句，获得分页显示时的各个属性
	   */
	public void querySql(String s) throws SQLException {
		if (nowPage == null || "".equals(nowPage)) {
			curPage = 1;
		} else {
			curPage = Integer.parseInt(nowPage);
			if (curPage < 1)
				curPage = 1;
		}
		ResultSet resultset = db.getResult(s);
		if (resultset.next())
			maxRowCount = resultset.getInt(1);
		maxPage = maxRowCount % pageSize != 0 ? maxRowCount / pageSize + 1
				: maxRowCount / pageSize;
		if (curPage > maxPage)
			curPage = maxPage;
		resultset.close();
	}
	  /**
	   * 一个字符串，用来动态的给出一个表单
	   * 该表单用来进行分页和统计页面间的跳转
	   */

	public String pageFooter() {
		//创建一个表单
		String s = "<form action=" + httpFile + " name=formBean methord=post>";
		int i = curPage - 1;//向前翻页，即当前页减1
		int j = curPage + 1;//向后翻页，即当前页加1
		s = s + "<font style='font-size: 10pt'>总计<font color='red'>"
				+ getMaxRowCount() + "</font>条记录," + "【共<font  color='red'>"
				+ getMaxPage() + "</font>页】";
		s = s + "【 <font color='red'>" + pageSize
				+ "</font>条/页】 当前第<font color='red'>" + getCurPage()
				+ "</font>页 &nbsp; ";
		if (curPage > 1)
			s = s + " <A href=" + httpFile + "?pages=1" + str_parameter
					+ ">首页</A> ";
		else
			s = s + " 首页 ";
		if (curPage > 1)
			s = s + " <A href=" + httpFile + "?pages=" + i + str_parameter
					+ ">上一页</A> ";
		else
			s = s + " 上一页 ";
		if (curPage < maxPage)
			s = s + " <A href=" + httpFile + "?pages=" + j + str_parameter
					+ ">下一页</A> ";
		else
			s = s + " 下一页 ";
		if (maxPage > 1 && curPage != maxPage)
			s = s + " <A href=" + httpFile + "?pages=" + maxPage
					+ str_parameter + ">尾页</A>";
		else
			s = s + " 尾页</font>";//在页面跳转间设置隐藏表单，来保存不同的请求
		s = s + "转到<input type ='text' name='pages' size='2'>页"
				+ "<input type='hidden' name='ccif' value='" + ccif
				+ "'><input type ='hidden' name='cif' value='" + cif
				+ "'><input type ='hidden' name='qvalue' value='" + qvalue
				+ "'><input type ='hidden' name='andor' value='" + andor
				+ "'><input type ='hidden' name='sdate' value='" + sdate
				+ "'><input type ='hidden' name='edate' value='" + edate
				+ "'><input type ='hidden' name='orderby' value='" + orderby
				+ "'><input type ='hidden' name='paixu' value='" + paixu
				+ "'><input type='submit' name='sumbmit' value='go'></form>";
		return s;
	}
	  /**
	   * 根据不同条件来获取不同的查询前N条记录的SQL语句
	   */
	public String getString(String s) {
		if (ccif.equals("=")) {
			String s1 = "select top " + pageSize * curPage + " * from " + s
					+ " where" + " " + cif + "=" + "'" + qvalue + "'";
			return s1;
		}
		if (ccif.equals("LIKE")) {
			String s2 = "select top " + pageSize * curPage + " * from " + s
					+ " where" + " " + cif + " " + "like" + " " + "'%" + qvalue
					+ "%'";
			return s2;
		}
		if (ccif.equals("ALL")) {
			String s3 = "select top " + pageSize * curPage + " * from " + s;
			return s3;
		}
		if (ccif.equals("<")) {
			String s4 = "select top " + pageSize * curPage + " * from " + s
					+ " where " + cif + " < '" + qvalue + "'";
			return s4;
		} else {
			return null;
		}
	}
	public String getXSString(String s) {
		if (ccif.equals("=")) {
			String s1 = "select top " + pageSize * curPage + " * from " + s
					+ " where" + " " + cif + "=" + "'" + qvalue
					+ "' and whether='否'";
			return s1;
		}
		if (ccif.equals("LIKE")) {
			String s2 = "select top " + pageSize * curPage + " * from " + s
					+ " where" + " " + cif + " " + "like" + " " + "'%" + qvalue
					+ "%'and whether='否'";
			return s2;
		} else {
			return null;
		}
	}
	 /**
	  * 根据不同条件来获得不同的计算记录总数的SQL语句
	  */
	public String getCount(String s) {
		if (ccif.equals("=")) {
			String s1 = "select count(*) from " + s + " where" + " " + cif
					+ "=" + "'" + qvalue + "'";
			return s1;
		}
		if (ccif.equals("LIKE")) {
			String s2 = "select count(*) from " + s + " where" + " " + cif
					+ " " + "like" + " " + "'%" + qvalue + "%'";
			return s2;
		}
		if (ccif.equals("ALL")) {
			String s3 = "select count(*) from " + s;
			return s3;
		}
		if (ccif.equals("<")) {
			String s4 = "select count(*) from " + s + " where " + cif + " < '"
					+ qvalue + "'";
			return s4;
		} else {
			return null;
		}
	}

	public String getXSCount(String s) {
		if (ccif.equals("=")) {
			String s1 = "select count(*) from " + s + " where" + " " + cif
					+ "=" + "'" + qvalue + "' and whether='否'";
			return s1;
		}
		if (ccif.equals("LIKE")) {
			String s2 = "select count(*) from " + s + " where" + " " + cif
					+ " " + "like" + " " + "'%" + qvalue + "%' and whether='否'";
			return s2;
		} else {
			return null;
		}
	}

	/**
	 * 根据不同条件和不同的起始日期和结束日期来获得不同的计算记录总数的SQL语句
	 */
	public String getDateCount(String s, String s1) {
		if (ccif.equals("=")) {		//在sdate到edate时间段中进行精确查询
			String s2 = "select count(*) from " + s + " where " + cif + " = '"
					+ qvalue + "'" + andor + " " + s1 + " between '" + sdate
					+ "' and '" + edate + "'";
			return s2;
		}
		if (ccif.equals("LIKE")) {//在sdate到edate时间段中进行模糊查询
			String s3 = "select count(*) from " + s + " where " + cif
					+ " like '%" + qvalue + "%'" + andor + " " + s1
					+ " between '" + sdate + "' and '" + edate + "'";
			return s3;
		}
		if (ccif.equals("ALL")) {//取出表中所有记录
			String s4 = "select count(*) from " + s;
			return s4;
		} else {
			return null;
		}
	}

	/**
	 * 根据不同条件和不同的起始日期和结束日期来获得不同的查询，前N条的SQL语句
	 */
	public String getDateString(String s, String s1) {
		if (ccif.equals("=")) {
			String s2 = "select top " + pageSize * curPage + " * from " + s
					+ " where " + cif + " = '" + qvalue + "'" + andor + " "
					+ s1 + " between '" + sdate + "' and '" + edate + "'";
			return s2;
		}
		if (ccif.equals("LIKE")) {
			String s3 = "select top " + pageSize * curPage + " * from " + s
					+ " where " + cif + " like '%" + qvalue + "%'" + andor
					+ " " + s1 + " between '" + sdate + "' and '" + edate + "'";
			return s3;
		}
		if (ccif.equals("ALL")) {
			String s4 = "select top " + pageSize * curPage + " * from " + s;
			return s4;
		} else {
			return null;
		}
	}

	/**
	 * 子查询中得到从起始日期到结束日期这段时间所有不重复的spid(商品id)，并返回不重复的spid的总数
	 */

	public String getOrderCount(String s, String s1) {
		String s2 = "select count(*) from (select spid from " + s + " where "
				+ s1 + " between '" + sdate + "' and '" + edate
				+ "' group by spid) as aa";
		return s2;
	}

	/**
	 * 联合查询查询出某一表中从起始到结束日期间所有不重复的spid(商品id)
	 * 并且将所有相同spid下的sl(数量)和je(金额)求和，即计算出某一商品在 某一时间段内的总销售数量和销售总额
	 * 最后通过联合查询在tb_brand表(商品信息表)中将该spid所对应商品的其他一些信息查询出来
	 */

	public String getOrderString(String s, String s1) {
		String s2 = "select top "
				+ pageSize
				* curPage
				+ "* from tb_brand a inner join (select spid,sum(sl) as sl,sum(je) as je"
				+ " from " + s + " where " + s1 + " between '" + sdate
				+ "' and '" + edate + "' group by spid ) as b"
				+ " on a.id=b.spid order by " + orderby + " " + paixu;
		return s2;
	}
}
