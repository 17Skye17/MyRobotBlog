<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="org.xblo.bean.*"%>
<%@ page import="org.xblo.dao.*"%>
<%@ page import="java.util.Iterator"%>
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
<script type="text/javascript" src="<%=basePath%>/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="<%=basePath%>/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8" src="lang/zh-cn/zh-cn.js"></script>
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
    <div class="contentBody" style="background:none repeat scroll 0 0 rgba(44, 44, 44, 0.9);" >
    <%
	ArticleBean articleSingle = (ArticleBean) request
			.getAttribute("articleBean");
	XbloUserDao xbloUserDao = new XbloUserDao();
	ArticleCommentDao articleCommentDao = new ArticleCommentDao();
	String xbloUsername = "";
	int commentCount = 0;
	XbloUserBean xbloUserBean = xbloUserDao.queryByXbloUserId(articleSingle
			.getCreateUserId());
	/* xbloUsername = xbloUserBean.getXbloUsername(); */
	List<ArticleCommentBean> articleCommentList = articleCommentDao
			.queryByArticleId(articleSingle.getArticleId());
	commentCount = articleCommentList.size();
%>
        <div class="post">
            <h2><%=articleSingle.getArticleTitle()%></h2>
            <p><small><a href="#"><%=xbloUsername%></a> 发布于 <%=articleSingle.getCreateDate()%>
<b>&nbsp;|&nbsp;</b> 阅读 (<%=articleSingle.getVisitCount()%>) <b>&nbsp;|&nbsp;</b>
<a href="#FeedBack">评论 (<%=commentCount%>)</a></small></p>                             
            
        </div>
        <p><%=articleSingle.getArticleContent()%></p>
<div class="post"> <!-- 改一个样式 -->
<p>———————————————————————————————————————————————————————————————————————</p>
<%
	for (Iterator<ArticleCommentBean> iter = articleCommentList
			.iterator(); iter.hasNext();) {
		ArticleCommentBean articleCommentBean = (ArticleCommentBean) iter
				.next();
%>
<p class="title"><%=articleCommentBean.getArticleCommentUser()%>
发表于：<%=articleCommentBean.getArticleCommentDate()%></p>
<p><%=articleCommentBean.getCommentContent()%></p>
<p>———————————————————————————————————————————————————————————————————————</p>
<%
	}
%> <a name="FeedBack"></a>
<form
	action="ActionServlet?action=comment&articleId=<%=articleSingle.getArticleId()%>"
	method="post">
姓名：
<input type="text" name="articleCommentUser" size="50" value="Robotmaster"></input>
<br />
邮件：
<input type="text" name="articleCommentEmail" size="50"
	value="user@domain.com"></input>
<br />
内容：
<textarea id="articleCommentContent" name="articleCommentContent" rows="10" cols="55"></textarea>
 <script type="text/javascript">
    var ue = UE.getEditor('articleCommentContent');
    $(document).ready(function () {
        var value = $("#articleCommentContent").val();       //使用html格式
        UE.getEditor('articleCommentContent').setContent(value, false);  //false清空内容再插入
    });
    var SetValue = function () {
        var value = UE.getEditor('articleCommentContent').getAllHtml();
        $("#articleCommentContent").val(value);            
    };
    </script>
<br />
<input type="submit" value="提交" style="width: 160px;text-align: center;"></input>
<input type="reset" value="重置" style="width: 160px;text-align: center;"></input>
</form>
</div>
</div>
</div>

    <jsp:include page="/front/view/FrontLeft1.jsp" />
    <div class="clearfloat"></div>
	<jsp:include page="/front/view/FrontFoot1.jsp" />
</body>
</html>
