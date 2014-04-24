<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="com.model.User"%>
<%@ page import="com.core.*"%>
<%@ page import="java.util.*"%>
<%
	if (!Crazyadept.UserIsOK(session, FinalConstants.STATUS_ADMIN))
		return;
%>
<html>
	<head>
		<title>view_user</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	</head>
	<link href="../css/admin.css" rel="stylesheet" type="text/css">
	<body>
		<table width="98%" border="0" align="center" cellpadding="0"
			cellspacing="1" class="tableNew">
			<tr align="center">
				<td colspan="4" class="TableTitle1">
					用户管理
				</td>
			</tr>
			<tr align="center">
				<td height="27" bgcolor="#FFFFFF">
					用户ID
				</td>
				<td bgcolor="#FFFFFF">
					注册时间
				</td>
				<td bgcolor="#FFFFFF">
					用户权根
				</td>
				<td bgcolor="#FFFFFF">
					用户状态
				</td>
			</tr>
			<%
				String uid = "", name = "", tel = "", qq = "", email = "", http = "", address = "", sql = "", age = "";
				int int_age = -1;
				String value = ParamUtils.getRequestString(request, "select");
				if ("uid".equals(value)) {
					uid = ParamUtils.getRequestString(request, "value");
				} else if ("name".equals(value)) {
					name = ParamUtils.getRequestString(request, "value");
				} else if ("tel".equals(value)) {
					tel = ParamUtils.getRequestString(request, "value");
				} else if ("qq".equals(value)) {
					qq = ParamUtils.getRequestString(request, "value");
				} else if ("email".equals(value)) {
					email = ParamUtils.getRequestString(request, "value");
				} else if ("http".equals(value)) {
					http = ParamUtils.getRequestString(request, "value");
				} else if ("address".equals(value)) {
					address = ParamUtils.getRequestString(request, "value");
				} else if ("age".equals(value)) {
					int_age = ParamUtils.getIntParameter(request, "value", -1);
				}
				uid = StringUtils.SqlToLink(uid);
				name = StringUtils.SqlToLink(name);
				tel = StringUtils.SqlToLink(tel);
				qq = StringUtils.SqlToLink(qq);
				email = StringUtils.SqlToLink(email);
				http = StringUtils.SqlToLink(http);
				address = StringUtils.SqlToLink(address);
				age = StringUtils.SqlToLink(int_age);
				String sex = StringUtils.SqlToLink(ParamUtils.getIntParameter(
						request, "sex", -1));
				String status = StringUtils.SqlToLink(ParamUtils.getIntParameter(
						request, "status", -1));
				String state = StringUtils.SqlToLink(ParamUtils.getIntParameter(
						request, "state", -1));
				String submit = ParamUtils.getRequestString(request, "submit");
				if (submit == null || "".equals(submit)) {
					try {
						sql = session.getAttribute("sqlsearch").toString();
					} catch (Exception e) {
					}
				} else {
					sql = " WHERE uid " + uid + " AND name " + name + " AND tel "
							+ tel + " AND qq " + qq + " AND email " + email
							+ " AND http " + http + " AND address " + address
							+ " AND age " + age + " AND sex " + sex
							+ " AND status " + status + " AND state " + state;
					session.setAttribute("sqlsearch", sql);
				}
				BasetableFactory bf = BasetableFactory.getInstance();
				int submit_page = ParamUtils.getIntParameter(request, "page");
				Collection coll = bf.ListUser(submit_page, sql);
				if (coll == null || coll.size() <= 0) {
			%>
			<tr align="center">
				<td height="27" colspan="4" bgcolor="#FFFFFF">
					当前用户记录为空
				</td>
			</tr>
			<%
				} else {
					Iterator it = coll.iterator();
					while (it.hasNext()) {
						User user = (User) it.next();
			%>
			<tr align="center">
				<td height="27" bgcolor="#FFFFFF">
					<a target="_self" href="info_user.jsp?uid=<%=user.getUid()%>"><%=user.getUid()%></a>
				</td>
				<td bgcolor="#FFFFFF"><%=user.getRegtime()%></td>
				<form method="post" action="modify_user.jsp">
				<td bgcolor="#FFFFFF">
					<input name="status" type="radio" class="noborder"
						onChange="Jscript:submit();" value="1"
						<%=user.getStatus() == FinalConstants.STATUS_ADMIN ? "checked"
									: ""%>>
					管理员
					<%
						if (!"mr".equals(user.getUid())) {
					%>
					<input name="status" type="radio" class="noborder"
						onChange="Jscript:submit();" value="0"
						<%=user.getStatus() == FinalConstants.STATUS_USER ? "checked"
										: ""%>>
					普通用户
					<%
						}
					%>
					<input type="hidden" name="uid" value="<%=user.getUid()%>">
				</td>
				</form>
				<form method="post" action="modify_user.jsp">
				<td bgcolor="#FFFFFF">
					<input name="state" type="radio" class="noborder"
						onChange="Jscript:submit();" value="0"
						<%=user.getState() == FinalConstants.STATE_FREE ? "checked"
									: ""%>>
					正常
					<%
						if (!"mr".equals(user.getUid())) {
					%>
					<input name="state" type="radio" class="noborder"
						onChange="Jscript:submit();" value="1"
						<%=user.getState() == FinalConstants.STATE_FREEZE ? "checked"
										: ""%>>
					冻结
					<%
						}
					%>
					<input type="hidden" name="uid" value="<%=user.getUid()%>">
				</td>
				</form>
			</tr>
			<%
				}
			%>
			<tr align="right">

				<td height="27" colspan="4" bgcolor="#E9F2F6"><%=HtmlUtils.table(bf.getRow("user" + sql), submit_page,
								"manage_user.jsp")%></td>
			</tr>
			<%
				}
			%>
		</table>
	</body>
</html>
