<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link href="js/bootstrap.css" rel="stylesheet">
 <link href="js/bootstrap-responsive.css" rel="stylesheet">
 <!--[if lt IE 9]>
         <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
         <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
      <![endif]-->
</head>
<style>
body{
background:pink;
}
@media (min-width:767px) and (max-width:979px){body{background:blue;}}
</style>
<script src="js/jquery-1.11.2.js"></script>
<script src="js/bootstrap.js"></script>
<body>
	<div class="container-fluid">
			<h1>布局<small> 测试的内容</small></h1>
			<p><abbr title="Content Management System" class="initialism">cms</abbr>爱的色放额外额
			<strong>撒地方第三方第三方地方</strong>我发额我发为分为氛围
			<em>哇恶法士大夫大师傅</em>访问为分为f维稳费
			</p>
			<blockquote class="pull-right"><p>选择比努力更重要</p><small>来自<cite>飞哥</cite></small></blockquote>
		<div class="row-fluid">
			<div class="span4 visible-desktop" >
				<h2>测试1</h2>
				<p>额外额我发额我发为分为氛围访问为分为f维稳费</p>
			</div>
			<div class="span4 hidden-phone">
					<h2>测试2</h2>
					<p>额外额我发额我发为分为氛围访问为分为f维稳费</p>
				<div class="row-fluid">
					<div class="span6">wowqowqow</div>
					<div class="span6">121w111w1w</div>
				</div>
			</div>
			<div class="span4 hidden-tablet">
				<h2>测试3</h2>
				<p>额外额我发额我发为分为氛围访问为分为f维稳费</p>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span3">
				<ul class="breadcrumb">
					<li> <a href="#">首页</a> <span class="divider">/</span></li>
		 			<li> <a href="#">类库</a> <span class="divider">/</span></li>
		 			<li  class="active">数据</li>
				</ul>
				<ul class="unstyled">
					<li>以打印日志为荣 , 以单步跟踪为;</li>
					<li>以空格缩进为荣 , 以制表缩进为;</li>
					<li>以单元测试为荣 , 以人工测试为;</li>
				</ul>
			</div>
			<div class="span3">
				<ul>
					<li>UnitTest很不错 </li>
					<li>Nose也很好用  </li>
					<li>配合Profile很爽  </li>
					<li>配合pdb也不错  </li>
				</ul>
			</div>
			<div class="span3">
				<ol>
					<li>模块复用为荣 ,以复制粘贴为耻; </li>
					<li>多态应用为荣 ,以分支判断为耻; </li>
					<li>Pythonic为荣 ,以冗余拖沓为耻; </li>
					<li>总结分享为荣 ,以跪求其解为耻;</li>
				</ol>
			</div>
			<div class="span3">
				<dl>
					<dd>多态应用为荣 ,以分支判断为耻;</dd>
					<del>模块复用为荣 ,以复制粘贴为耻; </del>
					<dt>多态应用为荣 ,以分支判断为耻;</dt>	
					<ins>总结分享为荣 ,以跪求其解为耻;</ins>	
				</dl>
				<!--  <dl class="dl-horizontal">
					<dd>多态应用为荣 ,以分支判断为耻;</dd>
					<del>模块复用为荣 ,以复制粘贴为耻; </del>
				</dl>-->
			</div>
		</div>
	
		<div class="row">
			<code>
				Java是由Sun Microsystems公司推出的Java面向对象程序设计语言（以下简称Java语言）和Java平台的总称。Java
				由James Gosling和同事们共同研发，并在1995年正式推出。Java最初被称为Oak，是1991年为消费类电子产品的嵌
			</code> 
			<pre>
				&lt;p&gt;示范文本&lt;/p&gt;
			</pre>
		</div>
	
	<!-- 表格......................................... -->
	<div class="row-fluid">
		<table class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th>#</th>
					<th>电视剧</th>
					<th>类型</th>
					<th>年代</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>爱情公寓</td>
					<td>都市爱情喜剧</td>
					<td>2010</td>
				</tr>
				<tr>
					<td>2</td>
					<td>邪恶力量</td>
					<td>悬疑魔幻</td>
					<td>2005</td>
				</tr>
				<tr>
					<td>3</td>
					<td>神探伽俐略</td>
					<td>推理探案</td>
					<td>2008</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<!-- 表单......................................... -->
	<div class="row-fluid">
		<div class="span3"></div>
		<div class="span6">
			<form action="" method="post" class="well form-search"><!-- well可去掉，则该表单无背景显示 -->
				<fieldset>
					<legend>完善资料</legend>
					<div class="control-group">	<!-- control-group 标记包括的范围 , control-label 要做标记的标签 ,controls 被标记的事物 -->
						<label class="control-label" for="input01">用户名</label>
						<div class="controls">
							<input type="text" class="span5 input-xlarge" id="input01" placeholder="请输入文字...">
							<span class="help-inline">相关提示信息</span>
							<p class="help-block">块状帮助文字...</p>
						</div>
					</div>
				</fieldset>
				<fieldset class="control-group error">
						<label class="control-label" for="input02">密码</label>
						<div class="controls">
								<input type="text" class="span5 input-xlarge" id="input02" placeholder="请输入密码...">
						</div>
				</fieldset>
						<label class="checkbox">	<!-- 使用label罗列复选框和单选框 -->
							<input type="checkbox">可选
							<input type="checkbox" disabled="disabled">不可选
						</label>
						<div>
							<input type="checkbox">可选
							<input type="checkbox" disabled="disabled">不可选
						</div>
						<div>
							<input type="submit" class="btn btn-info" value="input submit">
						    <button type="submit" class="btn btn-primary" disabled="disabled">Button submit</button>
						    <a href="" class="btn btn-danger">a标签尝试</a>
						    <button type="button" class="btn btn-inverse">Button button</button>
				    	</div>
			    
			</form>
		</div>
	</div>
	
	</div>
</body>
</html>