package com.hrl.util;

public class PageUtil {
	private Integer pageSize = 10;// 一页显示条数
	private Integer recordCount = 0;// 总条数
	private Integer index = 0;// 索引下标
	private Integer currPage = 1;// 当前页数

	/**
	 * 获取总的页数
	 * 
	 * @return
	 */
	public Integer getPageCount() {
		Integer size = this.recordCount / this.pageSize;
		Integer mod = recordCount % pageSize;
		if (mod != 0) {
			size++;
		}
		return this.recordCount == 0 ? 1 : size;
	}

	/**
	 * 是否有上一页
	 * 
	 * @return
	 */
	public boolean isHasPrevious() {
		//不是第一页
		if (this.currPage != 1) {
			return true;
		}
		return false;
	}

	/**
	 * 是否有下一页
	 * 
	 * @return
	 */
	public boolean isHasNext() {
		//不是最后一页
		if (this.currPage != this.getPageCount()) {
			return true;
		}
		return false;
	}

	public Integer getNextIndex() {
		return this.currPage * this.pageSize;
	}

	public Integer getPreviousIndex() {
		return (this.currPage - 2) * this.pageSize;
	}

	/**
	 * 得到索引
	 * 
	 * @return
	 */
	public Integer getIndex() {
		return this.index;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(Integer recordCount) {
		this.recordCount = recordCount;
	}

	/**
	 * 得到当前页
	 * 
	 * @return
	 */
	public Integer getCurrPage() {
		Integer c = index / pageSize;
		if ((index + 1) % pageSize != 0) {
			c++;
		}
		return c == 0 ? 1 : c;
	}

	/**
	 * 得到末页的索引
	 * 
	 * @return
	 */
	public Integer getLastIndex() {
		return this.getPageCount()*this.pageSize;
	}

	public void setIndex(Integer index) {
		this.index = index;
	}

	public void setCurrPage(Integer currPage) {
		this.currPage = currPage;
	}

}
