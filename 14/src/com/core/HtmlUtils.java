package com.core;

public class HtmlUtils {

	/**
	 * spage :显示总页数 npage :显示当页数 bpage :显示前一页 lpage :显示后一页
	 * 
	 * @param step
	 *            :步长
	 * @param row
	 *            :总记录数
	 * @param page
	 *            :当前页数
	 * @return
	 */
	public static String table(int step, int row, int page, String http,
			String target) {
		int spage = 0, npage = 0, t = 0, bpage = 0, lpage = 0;
		t = row % step;
		if (t == 0) {
			spage = row / step;
		} else {
			spage = row / step + 1;
		}
		if (page <= 1) {
			npage = 1;
			bpage = 1;
			lpage = 2;
		} else if (page >= spage) {
			npage = spage;
			bpage = spage - 1;
			lpage = spage;
		} else {
			npage = page;
			bpage = page - 1;
			lpage = page + 1;
		}
		String str = "<table width=100% border=0 cellpadding=0 cellspacing=0 style='font-size:10pt;' bgcolor=#EEFAFF><tr align=center>";
		str += "<td width=120>共" + row + "条记录</td><td width=120>第" + npage
				+ "/" + spage + "页</td>";
		str += "<td width=160><a target='" + target + "' href='" + http
				+ "?page=" + 1 + "'>|&lt;</a>&nbsp;&nbsp;<a target='" + target
				+ "' href='" + http + "?page=" + bpage
				+ "'>&lt;&lt;</a>&nbsp;&nbsp;<a target='" + target + "' href='"
				+ http + "?page=" + lpage
				+ "'>&gt;&gt;</a>&nbsp;&nbsp;<a target='" + target + "' href='"
				+ http + "?page=" + spage
				+ "'>&gt;|</a></td><form method=post action='" + http + "'>";
		str += "<td width=160><input type=text name=page size=3 maxlength=10 style='font-size:9pt; border: 1px solid #999999;' align=center>";
		str += "<input type=submit style='font-size:9pt; border:1 solid #999999; FONT-STYLE: normal; FONT-VARIANT: normal; FONT-WEIGHT: normal; HEIGHT: 18px; LINE-HEIGHT: normal'  value='Go' ></td></form></tr></table>";
		return str;
	}

	public static String table(int row, int page, String http) {
		return table(FinalConstants.STEP, row, page, http, "_self");
	}
}
