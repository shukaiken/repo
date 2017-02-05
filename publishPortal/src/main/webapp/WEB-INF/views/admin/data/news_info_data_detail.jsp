<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/general_path.jsp"%>
<!doctype>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-widht,minimun-scale=1.0,maximun-scale=1.0,user-scalable=no,initial-scale=1.0" >
		<title>创建数据来源</title>
		<%@include file="/WEB-INF/views/admin/include_css.jsp" %>
	</head>
	<body>
		<div id="slider_content" class="content">
			<div class="content_div">
				<h1>
					<span class="action-span"><a href="javascript:void(0);" onclick="history.go(-1);">返回</a></span>
					<span class="action-span1">管理中心</span>
					<span class="action-span1 action-span2">-创建数据源</span>
				</h1>
				<form id="id_source_form_id" action="<%=path %>/admin/data/addNewInfoCrawlConfig" method="post">
					<input type="hidden" name="springMVC.token" value="${TOKEN}">
					<input type="hidden" name="id" id="id_src_id" value="${source.id }">
				<div class="main-div">
				<fieldset>
					<legend>数据源配置</legend>
					<div class="list_table">
					<table>
							<tr>
								<td class="label">抓取网站名称：</td>
								<td>${source.siteName }</td>
							</tr>
							<tr>
								<td class="label">抓取网站地址：</td>
								<td>${source.siteUrl }</td>
							</tr>
							<tr>
								<td class="label">抓取网站开始地址：</td>
								<td>${source.startUrl }</td>
							</tr>
							<tr>
							
								<td class="label">抓取开始页数</td>
								<td>
								页数替换字符串:${source.resv4 }&nbsp;&nbsp;&nbsp;
								开始页:${source.resv2 }&nbsp;&nbsp;&nbsp;
								结束页:${source.resv3 }&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
							<tr>
								<td class="label">网站分类：</td>
								<td>
									${source.siteType}
								</td>
							</tr>
							<tr>
								<td class="label">展示类别</td>
								<td>
									${labelName }
									<%-- <select name="labelId">
										<option value="">--选择抓取资讯展示类别</option>
										<c:forEach items="${labelList }" var="label" varStatus="labelStatus">
											<option value="${label.id }" <c:if test="${source.labelId==label.id }">selected="selected"</c:if>>${label.label_name } </option>
										</c:forEach>
									</select> --%>
								</td>
							</tr>
							<tr>
								<td class="label">是否处理文本：</td>
								<td>
									<c:choose>
										<c:when test="${source.isWrapB=='0' }">是</c:when>
										<c:when test="${source.isWrapB=='1' }">否</c:when>
									</c:choose>
							</tr>
							<%-- <tr>
								<td class="label">抓取开始时间：</td>
								<td><fmt:formatDate value="${source.crawlBeginTime }" pattern="yyyy-MM-dd"/></td>
							</tr>
							<tr>
								<td class="label">抓取结束时间：</td>
								<td><fmt:formatDate value="${source.crawlEndTime }" pattern="yyyy-MM-dd"/></td>
							</tr> --%>
						</table>
						</div>
				</fieldset>
				<fieldset>
					<legend>抓取字段配置</legend>
					<div class="list_table">
						<table cellspacing="1" cellpadding="3">
						<thead>
							<tr>
								<th>抓取字段</th>
								<th>保存字段</th>
								<th>选择器</th>
								<th>备用选择器</th>
								<th>截取正则表达式</th>
								<th>是否保留HTML标签</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="label">标题：<input type="hidden" name="infoConfigs[0].id" value="${source.infoConfigs[1].id }"></td>
								<td>${source.infoConfigs[0].prop}</td>
								<td>
									${source.infoConfigs[0].selector }
								</td>
								<td>
									${source.infoConfigs[0].orSelector }
								</td>
								<td>
									${source.infoConfigs[0].subReg }
								</td>
								<td>
									<c:choose>
										<c:when test="${source.infoConfigs[0].isResvHtml=='0' }">是</c:when>
										<c:when test="${source.infoConfigs[0].isResvHtml=='1' }">否</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td class="label">副标题：<input type="hidden" name="infoConfigs[1].id" value="${source.infoConfigs[1].id }"></td>
								<td>${source.infoConfigs[1].prop}</td>
								<td>
									${source.infoConfigs[1].selector }
								</td>
								<td>
									${source.infoConfigs[1].orSelector }
								</td>
								<td>
									${source.infoConfigs[1].subReg }
								</td>
								<td>
									<c:choose>
										<c:when test="${source.infoConfigs[1].isResvHtml=='0' }">是</c:when>
										<c:when test="${source.infoConfigs[1].isResvHtml=='1' }">否</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td class="label">发表时间：<input type="hidden" name="infoConfigs[2].id" value="${source.infoConfigs[2].id }"></td>
								<td>${source.infoConfigs[2].prop}</td>
								<td>
									${source.infoConfigs[2].selector }
								</td>
								<td>
									${source.infoConfigs[2].orSelector }
								</td>
								<td>
									${source.infoConfigs[2].subReg }
								</td>
								<td>
									<c:choose>
										<c:when test="${source.infoConfigs[2].isResvHtml=='0' }">是</c:when>
										<c:when test="${source.infoConfigs[2].isResvHtml=='1' }">否</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td class="label">作者：<input type="hidden" name="infoConfigs[3].id" value="${source.infoConfigs[3].id }"></td>
								<td>${source.infoConfigs[3].prop}</td>
								<td>
									${source.infoConfigs[3].selector }
								</td>
								<td>
									${source.infoConfigs[3].orSelector }
								</td>
								<td>
									${source.infoConfigs[3].subReg }
								</td>
								<td>
									<c:choose>
										<c:when test="${source.infoConfigs[3].isResvHtml=='0' }">是</c:when>
										<c:when test="${source.infoConfigs[3].isResvHtml=='1' }">否</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td class="label">新闻类别：<input type="hidden" name="infoConfigs[4].id" value="${source.infoConfigs[4].id }"></td>
								<td>${source.infoConfigs[4].prop}</td>
								<td>
									${source.infoConfigs[4].selector }
								</td>
								<td>
									${source.infoConfigs[4].orSelector }
								</td>
								<td>
									${source.infoConfigs[4].subReg }
								</td>
								<td>
									<c:choose>
										<c:when test="${source.infoConfigs[4].isResvHtml=='0' }">是</c:when>
										<c:when test="${source.infoConfigs[4].isResvHtml=='1' }">否</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td class="label">内容：<input type="hidden" name="infoConfigs[5].id" value="${source.infoConfigs[5].id }"></td>
								<td>${source.infoConfigs[5].prop}</td>
								<td>
									${source.infoConfigs[5].selector }
								</td>
								<td>
									${source.infoConfigs[5].orSelector }
								</td>
								<td>
									${source.infoConfigs[5].subReg }
								</td>
								<td>
									<c:choose>
										<c:when test="${source.infoConfigs[5].isResvHtml=='0' }">是</c:when>
										<c:when test="${source.infoConfigs[5].isResvHtml=='1' }">否</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td class="label">附件：<input type="hidden" name="infoConfigs[6].id" value="${source.infoConfigs[6].id }"></td>
								<td>${source.infoConfigs[6].prop}</td>
								<td>
									${source.infoConfigs[6].selector }
								</td>
								<td>
									${source.infoConfigs[6].orSelector }
								</td>
								<td>
									${source.infoConfigs[6].subReg }
								</td>
								<td>
									<c:choose>
										<c:when test="${source.infoConfigs[6].isResvHtml=='0' }">是</c:when>
										<c:when test="${source.infoConfigs[6].isResvHtml=='1' }">否</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td class="label">浏览次数：<input type="hidden" name="infoConfigs[7].id" value="${source.infoConfigs[7].id }"></td>
								<td>${source.infoConfigs[7].prop}</td>
								<td>
									${source.infoConfigs[7].selector }
								</td>
								<td>
									${source.infoConfigs[7].orSelector }
								</td>
								<td>
									${source.infoConfigs[7].subReg }
								</td>
								<td>
									<c:choose>
										<c:when test="${source.infoConfigs[7].isResvHtml=='0' }">是</c:when>
										<c:when test="${source.infoConfigs[7].isResvHtml=='1' }">否</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td class="label">新闻来源：<input type="hidden" name="infoConfigs[8].id" value="${source.infoConfigs[8].id }"></td>
								<td>${source.infoConfigs[8].prop}</td>
								<td>
									${source.infoConfigs[8].selector }
								</td>
								<td>
									${source.infoConfigs[8].orSelector }
								</td>
								<td>
									${source.infoConfigs[8].subReg }
								</td>
								<td>
									<c:choose>
										<c:when test="${source.infoConfigs[8].isResvHtml=='0' }">是</c:when>
										<c:when test="${source.infoConfigs[8].isResvHtml=='1' }">否</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td class="label">索引号：<input type="hidden" name="infoConfigs[9].id" value="${source.infoConfigs[9].id }"></td>
								<td>${source.infoConfigs[9].prop}</td>
								<td>
									${source.infoConfigs[9].selector }
								</td>
								<td>
									${source.infoConfigs[9].orSelector }
								</td>
								<td>
									${source.infoConfigs[9].subReg }
								</td>
								<td>
									<c:choose>
										<c:when test="${source.infoConfigs[9].isResvHtml=='0' }">是</c:when>
										<c:when test="${source.infoConfigs[9].isResvHtml=='1' }">否</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td class="label">主题分类：<input type="hidden" name="infoConfigs[10].id" value="${source.infoConfigs[10].id }"></td>
								<td>${source.infoConfigs[10].prop}</td>
								<td>
									${source.infoConfigs[10].selector }
								</td>
								<td>
									${source.infoConfigs[10].orSelector }
								</td>
								<td>
									${source.infoConfigs[10].subReg }
								</td>
								<td>
									<c:choose>
										<c:when test="${source.infoConfigs[10].isResvHtml=='0' }">是</c:when>
										<c:when test="${source.infoConfigs[10].isResvHtml=='1' }">否</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td class="label">发布机关：<input type="hidden" name="infoConfigs[11].id" value="${source.infoConfigs[11].id }"></td>
								<td>${source.infoConfigs[11].prop}</td>
								<td>
									${source.infoConfigs[11].selector }
								</td>
								<td>
									${source.infoConfigs[11].orSelector }
								</td>
								<td>
									${source.infoConfigs[11].subReg }
								</td>
								<td>
									<c:choose>
										<c:when test="${source.infoConfigs[11].isResvHtml=='0' }">是</c:when>
										<c:when test="${source.infoConfigs[11].isResvHtml=='1' }">否</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td class="label">发布日期：<input type="hidden" name="infoConfigs[12].id" value="${source.infoConfigs[12].id }"></td>
								<td>${source.infoConfigs[12].prop}</td>
								<td>
									${source.infoConfigs[12].selector }
								</td>
								<td>
									${source.infoConfigs[12].orSelector }
								</td>
								<td>
									${source.infoConfigs[12].subReg }
								</td>
								<td>
									<c:choose>
										<c:when test="${source.infoConfigs[12].isResvHtml=='0' }">是</c:when>
										<c:when test="${source.infoConfigs[12].isResvHtml=='1' }">否</c:when>
									</c:choose>
								</td>
							</tr>
						<tr>
							<td class="label">名称：<input type="hidden" name="infoConfigs[13].id" value="${source.infoConfigs[13].id }"></td>
							<td>${source.infoConfigs[13].prop}</td>
							<td>
								${source.infoConfigs[13].selector }
							</td>
							<td>
								${source.infoConfigs[13].orSelector }
							</td>
							<td>
								${source.infoConfigs[13].subReg }
							</td>
							<td>
								<c:choose>
									<c:when test="${source.infoConfigs[13].isResvHtml=='0' }">是</c:when>
									<c:when test="${source.infoConfigs[13].isResvHtml=='1' }">否</c:when>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td class="label">主题词：<input type="hidden" name="infoConfigs[14].id" value="${source.infoConfigs[14].id }"></td>
							<td>${source.infoConfigs[14].prop}</td>
							<td>
								${source.infoConfigs[14].selector }
							</td>
							<td>
								${source.infoConfigs[14].orSelector }
							</td>
							<td>
								${source.infoConfigs[14].subReg }
							</td>
							<td>
								<c:choose>
									<c:when test="${source.infoConfigs[14].isResvHtml=='0' }">是</c:when>
									<c:when test="${source.infoConfigs[14].isResvHtml=='1' }">否</c:when>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td class="label">文号：<input type="hidden" name="infoConfigs[15].id" value="${source.infoConfigs[15].id }"></td>
							<td>${source.infoConfigs[15].prop}</td>
							<td>
								${source.infoConfigs[15].selector }
							</td>
							<td>
								${source.infoConfigs[15].orSelector }
							</td>
							<td>
								${source.infoConfigs[15].subReg }
							</td>
							<td>
								<c:choose>
									<c:when test="${source.infoConfigs[15].isResvHtml=='0' }">是</c:when>
									<c:when test="${source.infoConfigs[15].isResvHtml=='1' }">否</c:when>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td class="label">来文单位：<input type="hidden" name="infoConfigs[16].id" value="${source.infoConfigs[16].id }"></td>
							<td>${source.infoConfigs[16].prop}</td>
							<td>
								${source.infoConfigs[16].selector }
							</td>
							<td>
								${source.infoConfigs[16].orSelector }
							</td>
							<td>
								${source.infoConfigs[16].subReg }
							</td>
							<td>
								<c:choose>
									<c:when test="${source.infoConfigs[16].isResvHtml=='0' }">是</c:when>
									<c:when test="${source.infoConfigs[16].isResvHtml=='1' }">否</c:when>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td class="label">审批文件名称：<input type="hidden" name="infoConfigs[17].id" value="${source.infoConfigs[17].id }"></td>
							<td>${source.infoConfigs[17].prop}</td>
							<td>
								${source.infoConfigs[17].selector }
							</td>
							<td>
								${source.infoConfigs[17].orSelector }
							</td>
							<td>
								${source.infoConfigs[17].subReg }
							</td>
							<td>
								<c:choose>
									<c:when test="${source.infoConfigs[17].isResvHtml=='0' }">是</c:when>
									<c:when test="${source.infoConfigs[17].isResvHtml=='1' }">否</c:when>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td class="label">审批文号：<input type="hidden" name="infoConfigs[18].id" value="${source.infoConfigs[18].id }"></td>
							<td>${source.infoConfigs[18].prop}</td>
							<td>
								${source.infoConfigs[18].selector }
							</td>
							<td>
								${source.infoConfigs[18].orSelector }
							</td>
							<td>
								${source.infoConfigs[18].subReg }
							</td>
							<td>
								<c:choose>
									<c:when test="${source.infoConfigs[18].isResvHtml=='0' }">是</c:when>
									<c:when test="${source.infoConfigs[18].isResvHtml=='1' }">否</c:when>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td class="label">审批时间：<input type="hidden" name="infoConfigs[19].id" value="${source.infoConfigs[19].id }"></td>
							<td>${source.infoConfigs[19].prop}</td>
							<td>
								${source.infoConfigs[19].selector }
							</td>
							<td>
								${source.infoConfigs[19].orSelector }
							</td>
							<td>
								${source.infoConfigs[19].subReg }
							</td>
							<td>
								<c:choose>
									<c:when test="${source.infoConfigs[19].isResvHtml=='0' }">是</c:when>
									<c:when test="${source.infoConfigs[19].isResvHtml=='1' }">否</c:when>
								</c:choose>
							</td>
						</tr>
						</tbody>
					</table>
					</div>
				</fieldset>
						
				</div>
				</form>
			</div>
		</div>
		<%@include file="/WEB-INF/views/admin/include_js.jsp" %>
		<script type="text/javascript" src="<%=path %>/back/js/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript">
			//检查form
			function checkForm(){
				
				var siteName = $("#siteName").val();
				var siteUrl = $("#siteUrl").val();
				var startUrl = $("#startUrl").val();
				if(isEmpty(siteName)){
					layer.tips('数据源名称不能为空！', '#siteName', {
					    tips: 2,
					    time:4000
					});
					return false;
				}
				if(isEmpty(siteUrl)){
					layer.tips('数据源地址不能为空！', '#siteUrl', {
					    tips: 2,
					    time:4000
					});
					return false;
				}
				if(isEmpty(startUrl)){
					layer.tips('开始抓取地址不能为空！', '#startUrl', {
					    tips: 2,
					    time:4000
					});
					return false;
				}
				return true;
			}
			
			function modifySource(){
				if(!checkForm){
					return ;
				}
				var srcId = $("#id_src_id").val();
				$.ajax({
					type:'POST',
					url:'<%=path%>/admin/data/modifyInfoCrawlConfig',
					data:$("#id_source_form_id").serializeArray(),
					dataType:'json',
					success:function(msg){
						if(msg.success=='true'){
								layer.alert(msg.message,{icon: 6, closeBtn:2,title:'数据源管理'},function(index){
									window.location.href="<%=path%>/admin/data/viewNewsSource?sourceId="+srcId+"&from=1";
									layer.close(index);
								});
							
						}else if(msg.fail=='true'){
							layer.alert(msg.message,{icon: 5, closeBtn:2,title:'数据源管理'});
						}
					},
					error: function(data) {
						layer.msg(data.message,4,{type:1});
	                }
				});
				
			}
		</script>
	</body>
</html>