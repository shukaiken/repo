<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/general_path.jsp"%>
<!doctype>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-widht,minimun-scale=1.0,maximun-scale=1.0,user-scalable=no,initial-scale=1.0" >
		<title><c:if test="${type==1 }">创建</c:if><c:if test="${type==2 }">修改</c:if>菜单</title>
		<%@include file="/WEB-INF/views/admin/include_css.jsp" %>
	</head>
	<body>
		<div id="slider_content" class="content">
			<div class="content_div">
				<h1>
					<span class="action-span"><a href="javascript:void(0);" onclick="history.go(-1);">返回</a></span>
					<span class="action-span1">出版头条管理中心</span>
					<span class="action-span1 action-span2">-创建菜单</span>
				</h1>
				<form action="<%=path %>/admin/menu/addOrUpdateMenu" method="post" onsubmit="return checkForm();">
					<input type="hidden" name="springMVC.token" value="${TOKEN}">
					<input type="hidden" name="type" value="${type}">
                    <input type="hidden" name="id" value="${menu.id }"/>
				<div class="main-div">
					<table>
						<c:if test="${type==1 }">
					    	<tr>
								<td class="label">根菜单名称：</td>
								<td>出版头条（只作为标签的根菜单，不在前端展示）<span class="require-field">*</span></td>
							</tr>
					    </c:if>
					    <c:if test="${type==2 }">
					    	<tr>
								<td class="label">父菜单名称：</td>
								<td>${menu.pName }<span class="require-field">*</span></td>
							</tr>
					    </c:if>
						<tr>
							<td class="label">菜单名称</td>
							<td><input id="menu_name" name="menu_name"  type="text" value="${menu.menu_name }" class="input" /><span class="require-field">*</span></td>
						</tr>
						<tr>
							<td class="label">菜单url</td>
							<td><input id="url" name="url" type="text" value="${menu.url }" class="input" /><span class="require-field">*</span></td>
						</tr>
						<tr>
						    <td class="label">&nbsp;</td>
							<td>
								<button class="btn" type="submit">确定</button>
								<button class="btn" type="button" onclick="history.go(-1);" >取消</button>
							</td>
						</tr>
					</table>
				</div>
				</form>
			</div>
		</div>
		<%@include file="/WEB-INF/views/admin/include_js.jsp" %>
		<script type="text/javascript">
			//检查form
			function checkForm(){
				
				var name = $("#menu_name").val();
				var url = $("#url").val();
				if(isEmpty(name)){
					layer.tips('菜单名称不能为空！', '#menu_name', {
					    tips: 2,
					    time:4000
					});
					return false;
				}
				if(isEmpty(url)){
					layer.tips('url不能为空！', '#url', {
					    tips: 2,
					    time:4000
					});
					return false;
				}
			}
		</script>
		<c:if test="${not empty msg }">
			   <script>
				   layer.alert('${msg}', function(index){
					    //do something
					    window.location.href="<%=path %>/admin/menu/getMenuLs";
					    layer.close(index);
					});             
			   </script>
		    </c:if> 
	</body>
</html>