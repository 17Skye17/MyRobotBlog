<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="org.xblo.bean.*"%>
<%@ page import="org.xblo.dao.*"%>
<%@ page import="java.util.Iterator"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
	ArticleDao articleDao = new ArticleDao();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Left</title>
<link href='http://fonts.googleapis.com/css?family=Coda|Oranienbaum|Amarante' rel='stylesheet' type='text/css'>
<link href="<%=basePath%>/css/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.11.2.js"></script>
	<script>
	 // DOM ready
	 $(function() {
	   
      // Create the dropdown base
      $("<select />").appendTo("nav");
      
      // Create default option "Go to..."
      $("<option />", {
         "selected": "selected",
         "value"   : "",
         "text"    : "Select a page"
      }).appendTo("nav select");
      
      // Populate dropdown with menu items
      $("nav a").each(function() {
       var el = $(this);
       $("<option />", {
           "value"   : el.attr("href"),
           "text"    : el.text()
       }).appendTo("nav select");
      });
      
	   // To make dropdown actually work
      $("nav select").change(function() {
        window.location = $(this).find("option:selected").val();
      });
	 
	 });
	</script>
</head>
<body>
    <div class="sidebar">
        <div class="sBlock">
        	<h2>排行</h2>
            <ul>
            <%
			List<ArticleBean> articleListTop = articleDao
					.queryTopOnVisitCount(10);
			if (articleListTop.size() > 0) {
				for (int i = 0; i < articleListTop.size(); i++) {
					ArticleBean articleBean = (ArticleBean) articleListTop
							.get(i);
		%>
            	<li><a href="ActionServlet?action=viewArticle&articleId=<%=articleBean.getArticleId()%>">
            	<%=articleBean.getArticleTitle()%>(<%=articleBean.getVisitCount()%>)</a></li>
                <%
			}
			}
		%>
            </ul>
        </div>
        <div class="sBlock">
        	<h2>分类</h2>
            <ul>
            <%
			ArticleTypeDao articleTypeDao = new ArticleTypeDao();
			List<ArticleTypeBean> articleTypeList = articleTypeDao.queryAll();
			if (articleTypeList.size() > 0) {
				for (int i = 0; i < articleTypeList.size(); i++) {
					ArticleTypeBean articleTypeBean = (ArticleTypeBean) articleTypeList
							.get(i);
					List<ArticleBean> articleList = articleDao
							.queryByArticleTypeId(articleTypeBean
									.getArticleTypeId());
		%>
            	<li><a href="IndexServlet?articleTypeId=<%=articleTypeBean.getArticleTypeId()%>">
            	<%=articleTypeBean.getArticleTypeName()%>(<%=articleList.size()%>)</a></li>
         <%
			}
			}
		%>       
            </ul>
        </div>
        
        <div class="sBlock">
        <h2>链接</h2>
            <ul>
           <%
			XbloLinkDao xbloLinkDao = new XbloLinkDao();
			List<XbloLinkBean> xbloLinkList = xbloLinkDao.queryAll();
			if (xbloLinkList.size() > 0) {
				for (int i = 0; i < xbloLinkList.size(); i++) {
					XbloLinkBean xbloLinkBean = (XbloLinkBean) xbloLinkList
							.get(i);
		%>
            	<li><a href="http://<%=xbloLinkBean.getXbloLinkUrl()%>" target=_blank>
            	<%=xbloLinkBean.getXbloLinkName()%></a></li>
                <%
			}
			}
		%>
            </ul>
        </div>
           
      
    </div>
</body>
</html>
