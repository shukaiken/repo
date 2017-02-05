<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/general_path.jsp"%>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-widht,minimun-scale=1.0,maximun-scale=1.0,user-scalable=no,initial-scale=1.0" >
		<title>提取反馈信息需求点</title>
		<%@include file="/WEB-INF/views/admin/include_css.jsp" %>
	</head>
	<body>
		<div id="slider_content" class="content">
			<div class="content_div">
				<h1>
					<span class="action-span"><a href="javascript:void(0);" onclick="history.go(-1);">返回</a></span>
					<span class="action-span1">出版头条管理中心</span>
					<span class="action-span1 action-span2">-反馈信息分组</span>
				</h1>
				<form action="<%=path %>/admin/feed/updateBackFeedWithType" method="post" onsubmit="return checkForm();">
                    <input type="hidden" name="id" value="${backFeed.id }"/>
                    <input type="hidden" name="type" value="${type }"/>
					<div class="main-div">
						<table>
						 <tr>
								<td class="label">分组名称：</td>
								<td>
									${backFeed.feed_type_name}
					   			</td>
						   </tr>
						   <tr>
								<td class="label">反馈人：</td>
								<td>${backFeed.user_name}</td>
						   </tr>
						   <tr>
								<td class="label">联系方式：</td>
								<td>${backFeed.contact}</td>
						   </tr>
						   <tr>
								<td class="label">系统：</td>
								<td>${backFeed.system}</td>
						   </tr>
						   <tr>
								<td class="label">机型：</td>
								<td>${backFeed.model}</td>
						   </tr>
						   <tr>
								<td class="label">版本：</td>
								<td>${backFeed.version}</td>
						   </tr>
						   <tr>
								<td class="label">反馈时间：</td>
								<td><fmt:formatDate value="${backFeed.create_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						   </tr>
						   <tr>
								<td class="label">内容：</td>
								<td>
									<textarea class="input-textarea">${backFeed.content }</textarea>
								</td>
						   </tr>
						   <tr>
								<td class="label">需求点：</td>
								<td>
								   <textarea class="input-textarea">${backFeed.demand_point }</textarea>
								</td>
						   </tr>
						   <tr>
								<td class="label">状态：</td>
								<td>
									<select name="feed_type_id"  class="input">
										<option value="2">通过处理</option>
									</select>
									<span class="require-field">*</span>若反馈信息已处理，请点击下方的确定按钮，通过处理
					   			</td>
						   </tr>
						   <tr>
							    <td class="label">
							   	 &nbsp;
							    </td>
								<td>
									<button class="btn" type="submit">确定</button>
									<button class="btn" type="button" onclick="history.go(-1);">取消</button>
								</td>
						   </tr>
						</table>
					</div>
				</form>
			</div>
		</div>
		<%@include file="/WEB-INF/views/admin/include_js.jsp" %>
	</body>
</html>