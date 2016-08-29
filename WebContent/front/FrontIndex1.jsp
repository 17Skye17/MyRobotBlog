<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="org.xblo.bean.*"%>
<%@ page import="org.xblo.dao.*"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome to Humanoid Studio</title>
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

<div class="wrapper">
	<jsp:include page="/front/view/FrontHead1.jsp" />
	<p style="font-family: 'Amarante', cursive;font-size:3.0em; text-decoration:none;color:#ffffff;font-weight: bold;">Skye's blog</p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<p href="" style="font-size: 1.5em;color: red;font-weight: 700;text-indent: 3cm;line-height: 1cm;">A Great Robotics Enthusiast</p>
	<br><br>
    <div class="contentBody">
    <%
	List<ArticleBean> articleList = (List<ArticleBean>) request
			.getAttribute("articleList");
	if (articleList == null || articleList.size() == 0) {
	%>
    	<div class="post">
            <h2>当前类别下博主还未发表文章</h2>
            <span>2016/8/14</span>
            <p>
            	精彩即将来临...
            </p>
        </div>
 <%
	} else {
		int i = 0;
		ArticleCommentDao articleCommentDao = new ArticleCommentDao();
		XbloUserDao xbloUserDao = new XbloUserDao();
		ArticleTypeDao articleTypeDao = new ArticleTypeDao();

		String username = "";
		int commentCount = 0;
		while (i < articleList.size()) {
			ArticleBean articleBean = (ArticleBean) articleList.get(i);
			XbloUserBean xbloUserBean = xbloUserDao
					.queryByXbloUserId(articleBean.getCreateUserId());
			username = xbloUserBean.getXbloUsername();
			List<ArticleCommentBean> articleCommentList = articleCommentDao
					.queryByArticleId(articleBean.getArticleId());
			if (articleCommentList == null)
				commentCount = 0;
			else
				commentCount = articleCommentList.size();
			ArticleTypeBean articleTypeBean = articleTypeDao
					.query(articleBean.getArticleTypeId());
			String articleTypeName = null;
			if (articleTypeBean == null)
				articleTypeName = "未分类";
			else
				articleTypeName = articleTypeBean.getArticleTypeName();
%>       
        <div class="post">
            <h2>[<%=articleTypeName%>]<%=articleBean.getArticleTitle()%></h2>
            <span><%=username%> 发布于 <%=articleBean.getCreateDate()%>&nbsp;阅读 (<%=articleBean.getVisitCount()%>)</span>                               
            <p><%=articleBean.getArticleSummary()%></p>
            <p><a href="ActionServlet?action=viewArticle&articleId=<%=articleBean.getArticleId()%>">阅读全文&hellip;</a></p>
            <a href="ActionServlet?action=viewArticle&articleId=<%=articleBean.getArticleId()%>#FeedBack">评论
	(<%=commentCount%>)</a>
            <!-- <img src="images/pic2.jpg" alt="pic2"> -->
        </div>
        <%
	i++;
		}
	}
%>
    </div>

    </div> 
    <jsp:include page="/front/view/FrontLeft1.jsp" />
    <div class="clearfloat"></div>
	<jsp:include page="/front/view/FrontFoot1.jsp" />
</body>
</html>
