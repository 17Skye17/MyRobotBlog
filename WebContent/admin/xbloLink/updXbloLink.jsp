﻿<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="org.xblo.bean.*"%>
<%@ page import="org.xblo.dao.*"%>
<%@ page import="java.util.Iterator"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>管理界面</title>
<link href="<%=basePath%>/admin/style.css" rel="stylesheet"
	type="text/css" />
</head>

<%
	XbloLinkBean xbloLinkBean = (XbloLinkBean) request
			.getAttribute("xbloLinkBean");
%>

<body id="page">
<h2>修改文章</h2>
<form action="<%=basePath%>/ActionServlet?action=updXbloLink"
	method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<input type="hidden" name="updXbloLink" value="Y">
	</input>
	<input type="hidden" name="xbloLinkId"
		value="<%=xbloLinkBean.getXbloLinkId()%>">
	</input>
	<tr>
		<th>名称：</th>
		<td><input type="text" name="xbloLinkName" size="50"
			value="<%=xbloLinkBean.getXbloLinkName()%>"></input></td>
	</tr>
	<tr>
		<th>Url：</th>
		<td><input type="text" name="xbloLinkUrl" size="50"
			value="<%=xbloLinkBean.getXbloLinkUrl()%>"></input></td>
	</tr>

	<tr>
		<th>&nbsp;</th>
		<td><input type="submit" class="bt" value="提交"></input></td>
	</tr>
</table>
</form>
</body>
</html>
