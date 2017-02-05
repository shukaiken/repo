<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/general_path.jsp"%>
<!doctype>
<html>
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="<%=path %>/back/css/head.css">
	    <link rel="stylesheet" type="text/css" href="<%=path %>/back/css/reset.css">
	</head>
	<body>
		<header>
			<div class="header-top">
				<div class="logo_div">天梯头条管理系统</div>
				<div class="submenu_div">
					<ul>
						<li><a href="<%=path %>/logout"><img src="<%=path %>/back/images/topmune_01.png" /><span>退出</span></a></li>
						<li><a href="javascript:void(0);"><img src="<%=path %>/back/images/topmune_02.png" /><span>帮助</span></a></li>
					<%--<li><a href="<%=path %>/admin/help" target="_blank"><img src="<%=path %>/back/images/topmune_02.png" /><span>帮助</span></a></li> --%>
						<li><a href="<%=path %>/admin/index" target="main"><img src="<%=path %>/back/images/topmune_03.png" /><span>首页</span></a></li>
						<li style="width:120px;border:none;line-height:80px;"><a href="javascript:void(0);">${sessionScope.systemUser.name }，<b id="time"></b></a></li>
					</ul>
				</div>
			</div>
		</header>
		<script type="text/javascript" src="<%=request.getContextPath() %>/back/js/libs/jquery-1.11.1.min.js"></script>
		<script type="text/javascript">
		       $(function(){
		       	  var d = new Date();
		       	  var h = d.getHours(); 
		       	
		       	  if(h<12){
		       		  $("#time").text("上午好");
		       	  }
		       	  
		       	  if(h==12){
		       		  $("#time").text("中午好");
		       	  }
		       	  
		       	  if(h>12 && h<18){
		       		  $("#time").text("下午好");
		       	  }
		       	  
		       	  if(h>=18){
		       		  $("#time").text("晚上好");
		       	  }
		       });
		</script>
	</body>
</html>
