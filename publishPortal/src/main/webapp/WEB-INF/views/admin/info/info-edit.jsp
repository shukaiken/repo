﻿<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/general_path.jsp"%>
<!DOCTYPE>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-widht,minimun-scale=1.0,maximun-scale=1.0,user-scalable=no,initial-scale=1.0" >
		<title>资讯修改</title>
		<%@include file="/WEB-INF/views/admin/include_css.jsp" %>
		<link rel="stylesheet" href="<%=path%>/back/kindeditor-4.1.10/themes/default/default.css" />
		<link rel="stylesheet" href="<%=path %>/back/zTree/css/demo.css" type="text/css">
		<link rel="stylesheet" href="<%=path %>/back/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
		<style type="text/css">
	.file-name{ line-height: 30px;}
	#file-list .file-li{
	float:left;
	}
</style>
	</head>
	<body>
			<div id="slider_content" class="content">
			<form action='<%=path %>/admin/info/modifyInfo' id="id_form_add_news" method="post" enctype="multipart/form-data">
				<div class="content_div">
					<h1>
						<span class="action-span"><a href="javascript:void(0);" onclick="history.go(-1);">返回</a></span>
						<span class="action-span1">管理中心</span>
						<span class="action-span1 action-span2">-资讯管理</span>
					</h1>
					<div class="main-div">
						<input type="hidden" name="infoId" id="id_news_id" value="${info.infoId }">
						<input type="hidden" name="springMVC.token" value="${TOKEN}">
						<input type="hidden" name="imageSize" value="0" id="id_files_length"/>
						<input type="hidden" name="status" value="${info.status }" id="id_info_status_id">
						<!--初始为空,如果有过修改，置为2 -->
						<input type="hidden" name="ischangeImage" value="0" id="id_isChangeImage_id">
						<input type="hidden" name="bannerIds" value="" id="id_bannerIds_id">
						<input type="hidden" name="infoContent.contentId" value="${info.infoContent.contentId }">
						<table>
							<tr>
								<td class="label"><span class="require-field">*</span>标题</td>
								<td><input type="text" class="input" id="id_news_title" name="infoContent.title" value="${fn:escapeXml(info.infoContent.title) }" style="width:80%" /><span id="err_mark_title"></span></td>
							</tr>
							<tr>
								<td class="label">标签</td>
								<td>
								<!-- 分类ID -->
									<input type="hidden" id="id_hidden_labelId" name="tagId" value="${info.tagId }">
									<input type="hidden" id="id_hidden_tag_id" name="tagIds" value="${tagIds }">
									<div class="zTreeDemoBackground" id="id_tag_div_id">
										<ul id="treeDemo" class="ztree"></ul>
									 </div>
								</td>
							</tr>
							<tr>
								<td class="label">
									二级标签
								</td>
								<td>
									<div>
										<c:forEach items="${info.searchWords }" var="word" varStatus="wordStatus">
											<input type="text" id="id_search_word" name="searchWords[${wordStatus.index }].word" value="${word.word }" style="width:10%">
										</c:forEach>
										<button type="button" id="id_add_search_word">+</button>
									</div>
									
								</td>
							</tr>
							<tr>
								<td class="label"><span class="require-field">*</span>摘要</td>
								<td><input type="text" class="input" id="id_news_brief" name="infoContent.brief" value="${fn:escapeXml(info.infoContent.brief) }" style="width:80%" /><span id="err_mark_brief"></span></td>
							</tr>
							<tr>
								<td class="label"><span class="require-field">*</span>内容</td>
								<td id="id_hidden_content">
									<span>已输入<span id="input_count_id" style="font-color:red"></span>字</span>
									<textarea class="form-control" name="infoContent.content" id="id_news_content"> ${info.infoContent.content }</textarea><span id="err_mark_content"></span>
								</td>
							</tr>
						    <tr>
						    	<td class="label">
						    		banner
						    	</td>
						    	<td>
						    		<div id="browse_div_id">
						    			<p id="browse" style="border: 1px solid #ccc; height: 150px; line-height: 150px; text-align: center; color: #aaa; width: 600px;">
						    				选择文件...支持HTML5的浏览器可以拖拽上传，将文件拖到此区域
						    			</p>
										<!-- <input type="button" value="选择文件..."  /> -->
										
									</div>
									<ul id="file-list">

									</ul>
								</td>
						    </tr>
							<tr>
								<td colspan="2" align="center">
								<button type="submit" class="btn">保&nbsp;&nbsp;存</button>&nbsp;&nbsp;
								<button type="button" class="btn" onclick="cancel();">取&nbsp;&nbsp;消</button>
								</td>
							</tr>
						</table>
					</div>
				</div>
				</form>
			
		</div>
		<%@include file="/WEB-INF/views/admin/include_js.jsp" %>
		<script src="<%=path %>/back/js/jquery.md5.js" type="text/javascript"></script>
		<script type="text/javascript" src="<%=path %>/back/js/jquery.form.js"></script>
		<script type="text/javascript" src="<%=path %>/back/kindeditor-4.1.10/kindeditor.js"></script>
		<script type="text/javascript" src="<%=path %>/back/kindeditor-4.1.10/lang/zh_CN.js"></script>
		<script type="text/javascript" src="<%=path %>/back/js/uploadPreview.js"></script>
		<script type="text/javascript" src="<%=path %>/back/js/plupload.full.min.js"></script>
		<script type="text/javascript" src="<%=path %>/back/zTree/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="<%=path %>/back/zTree/js/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript" src="<%=path %>/back/js/ztree-checkbox-radio.js"></script>
		<script type="text/javascript">
			var selector_form = "#id_form_add_news";
			var editor;
			var uploader;
			var fileUploadSucFlag = false;
			var uploadedFileName;
			var options = {};
			var isChangeImage = false;
			
			var setting = {
					check: {
						chkStyle : "checkbox",
						enable: true,
						radioType: "all"
					},
					data: {
						simpleData: {
							enable: true
						}
					},
					callback:{
						onCheck:checkedNode
					}
				};

			  var zNodes =[
					{ id:1, pId:0, name:"随意勾选 1", open:true},
					{ id:11, pId:1, name:"随意勾选 1-1", open:true},
					{ id:111, pId:11, name:"随意勾选 1-1-1"},
					 { id:112, pId:11, name:"随意勾选 1-1-2"},
					{ id:12, pId:1, name:"随意勾选 1-2", open:true},
					{ id:121, pId:12, name:"随意勾选 1-2-1"},
					{ id:122, pId:12, name:"随意勾选 1-2-2"},
					{ id:2, pId:0, name:"随意勾选 2", checked:true, open:true},
					{ id:21, pId:2, name:"随意勾选 2-1"},
					{ id:22, pId:2, name:"随意勾选 2-2", open:true},
					{ id:221, pId:22, name:"随意勾选 2-2-1", checked:true},
					{ id:222, pId:22, name:"随意勾选 2-2-2"},
					{ id:23, pId:2, name:"随意勾选 2-3"} 
					]; 
				var treeObj = null;
				
				
				//$.fn.zTree.init($("#treeDemo"), setting, zNodes);
				$(function(){
					$.ajax({
						type: "post",
				        url: "<%=path %>/admin/label/ajaxLabelList",
				        data:{
							"labelId":'${info.tagId}',
							"tagIds":'${tagIds}'
							},
				        dataType: "json",
						success:function(data){
							treeObj = $.fn.zTree.init($("#treeDemo"), setting, data);
					   }
				      });
				
				});
				function checkedNode(event,treeId, treeNode){
					if(!treeNode.isParent){
						var nodes = treeObj.getCheckedNodes(true);
						var exParentNodeId = $("#id_hidden_labelId").val();
						if(parseInt(treeNode.id)<10000 && parseInt(treeNode.getParentNode().id)-10000 != parseInt(exParentNodeId)){
							for(var i=0;i<nodes.length;i++){
								nodes[i].checked=false;
								treeObj.refresh();
							}
							
							treeNode.checked=true;
							treeObj.refresh();
						}
						$("#id_hidden_labelId").val(parseInt(treeNode.getParentNode().id)-10000);
						var nodesss = treeObj.getCheckedNodes(true);
						var nodesId = getNodesId(nodesss);
						$("#id_hidden_tag_id").val(nodesId);
					}
				}
				
				 function getNodesId(nodes){
					var nodesId = "";
					for(var node = 0; node < nodes.length; node++){
						if(parseInt(nodes[node].id)<=10000){//只保存标签的值，在后台传过来的时候，在父节点的Id加上10000表示分类，不是标签，现在的前提是标签的Id不超过10000
							nodesId += nodes[node].id+",";
						}
					}
					return nodesId.substring(0,nodesId.length-1);
				} 
				
			jQuery(function($){
				
				 initBannerImage();
				
				
				uploader = new plupload.Uploader({ //实例化一个plupload上传对象
					browse_button : 'browse',
					url : '<%=path %>/uploadBanner',
					//url : '<%=path%>/admin/info/modifyInfo',
					file_data_name:'bannerFile',
					drop_element : 'browse',
					resize: {
					  width: 100,
					  height: 100,
					  crop: false,
					  quality: 90,
					  preserve_headers: true
					},
					multipart:true,
					multipart_params:{
						infoId: $("#id_news_id").val(),
						bannerIds:$("#id_bannerIds_id").val()
					},
						
					filters: {
					  mime_types : [ //只允许上传图片文件
					    { title : "图片文件", extensions : "jpg,jpeg,png" }
					  ]
					}
				});
				uploader.init(); //初始化

				//绑定文件添加进队列事件
				uploader.bind('FilesAdded',function(uploader,files){
					for(var i = 0, len = files.length; i<len; i++){
						var file_name = files[i].name; //文件名
						//构造html来更新UI
						var html = '<li id="file-' + files[i].id +'"><p class="file-name">' + file_name + '</p><input type="hidden" value="'+files[i].id+'" id="file_id"><input type="button" value="删除" id="remove-btn"/><p class="progress"></p></li>';
						$(html).appendTo('#file-list');
						/* if(files.length==1){
							uploader.disableBrowse(true);
							document.getElementById("browse_div_id").style.display="none";
						} */
						!function(i){
							previewImage(files[i],function(imgsrc){
								$('#file-'+files[i].id).append('<img src="'+ imgsrc +'" />');
							});
					    }(i);
					}
				});
				
				uploader.bind("FileUploaded",function(uploader,file,responseObject){
					
					var bannerIds = $("#id_bannerIds_id").val();
					resJson = jQuery.parseJSON(responseObject.response);
					console.info("FileUploaded:"+resJson);
					if(resJson.success=='true'){
						if(bannerIds==''){
							bannerIds=resJson.bannerId;
							$("#id_bannerIds_id").val(bannerIds);
						}else {
							bannerIds+=(","+resJson.bannerId);
							$("#id_bannerIds_id").val(bannerIds);
						}
					}
					
				});
				uploader.bind("UploadComplete",function(uploader,files){
					//var status = $("#id_info_status_id").val();
					fileUploadSucFlag = true;
					//$(selector_form).submit();
					//所有文件上传完成，提交表单
					submitForm();
				});
				
				uploader.bind("QueueChanged",function(uploader){
					isChangeImage = true;
					$("#id_isChangeImage_id").val("2");
					var len = $("#id_files_length").val();
					$("#id_files_length").val(parseInt(len)+parseInt(uploader.files.length));
				});
				uploader.bind("Error",function(uploader,errObject){
					fileUploadSucFlag = false;
					layer.msg("图片上传失败,稍后重试或联系管理员");
				});
				
				
				//绑定文件上传进度事件
				uploader.bind('UploadProgress',function(uploader,file){
					$('#file-'+file.id+' .progress').css('width',file.percent + '%');//控制进度条
				});
				
				$(document).on("click","#remove-btn",function(){
					var fileId = $(this).parent().find("#file_id").val();
					if(fileId!='value_index'){//如果不是在修改页面上传的图片，那么不用从uploader中移除
						uploader.removeFile(uploader.getFile(fileId));
						
					}else {
						var banId = $(this).parent().find("#hidden_ban_id").val();
						//console.info("banId="+banId);
						var banIds = $("#id_bannerIds_id").val();
						//console.info("banIds="+banIds);
						if(banIds!=null&&banIds!=''){
							var banIdArr = banIds.split(",");
							console.info(banIdArr.length);
							for(var i =0;i<banIdArr.length;i++){
								if(banId==banIdArr[i]){
									var o = banIdArr.splice(i,1);//从数组中删除元素
									//console.info(o);
								}
							}
							console.info(banIdArr.length);
							console.info(banIdArr.join(","));
							$("#id_bannerIds_id").val(banIdArr.join(","));
							console.info($("#id_bannerIds_id").val(banIdArr.join(",")));
							$("#id_files_length").val(parseInt(banIdArr.length)+parseInt(uploader.files.length));
						}else {
							$("#id_files_length").val(parseInt(uploader.files.length));
						}
						
					}
					$("#id_isChangeImage_id").val("2");
					//document.getElementById("browse_div_id").style.display="block";
					$(this).parent().remove();
					//uploader.disableBrowse(false);
				}); 
				
				//plupload中为我们提供了mOxie对象
				//有关mOxie的介绍和说明请看：https://github.com/moxiecode/moxie/wiki/API
				//如果你不想了解那么多的话，那就照抄本示例的代码来得到预览的图片吧
				function previewImage(file,callback){//file为plupload事件监听函数参数中的file对象,callback为预览图片准备完成的回调函数
					if(!file || !/image\//.test(file.type)) return; //确保文件是图片
					if(file.type=='image/gif'){//gif使用FileReader进行预览,因为mOxie.Image只支持jpg和png
						var fr = new mOxie.FileReader();
						fr.onload = function(){
							callback(fr.result);
							fr.destroy();
							fr = null;
						}
						fr.readAsDataURL(file.getSource());
					}else{
						var preloader = new mOxie.Image();
						preloader.onload = function() {
							preloader.downsize( 300, 300 );//先压缩一下要预览的图片,宽300，高300
							var imgsrc = preloader.type=='image/jpeg' ? preloader.getAsDataURL('image/jpeg',80) : preloader.getAsDataURL(); //得到图片src,实质为一个base64编码的数据
							callback && callback(imgsrc); //callback传入的参数为预览图片的url
							preloader.destroy();
							preloader = null;
						};
						preloader.load( file.getSource() );
					}	
				}
				
				//页面初始化的时候，展示页面Banner图				
				 function initBannerImage(){
					//var bannerLen = '${banLen}';
					//$("#id_files_length").val(bannerLen);
					
					var bannerIds = "";
					var banlist = '${bannersJson}';
					console.info(banlist);
					if(banlist!=null && banlist!=''){
						var banJson = jQuery.parseJSON(banlist);
						console.info(banJson);
						$("#id_files_length").val(banJson.length);
						$.each(banJson,function(index,item){
							if(bannerIds==''){
								bannerIds=item.banId;
							}else {
								bannerIds+=(","+item.banId);
							}
							console.info(item.url);
							var html = '<li id="file-index-'+index+'"><p class="file-name">' + item.url + '</p><input type="hidden" value="value_index" id="file_id"><input type="hidden" value="'+item.banId+'" id="hidden_ban_id"><input type="button" value="删除" id="remove-btn"/><p class="progress"></p></li>';
							$(html).appendTo('#file-list');
							$('#file-index-'+index).append('<img width="300px" height="300px" src="'+ item.url +'" />');
						});
						$("#id_bannerIds_id").val(bannerIds);
						
					}
				} 
				
				$(selector_form).submit(function(){//提交表单
					var newsId = $("#id_news_id").val();
		            options = {
		                //target:'#Tip', //后台将把传递过来的值赋给该元素
		                //url:'<%=path%>/admin/news/modifyNews', 
		                type:'POST',
		                dataType:'json',
		                success: function(msg){
							
		                } //显示操作提示
		            };
		            editor.sync();
					if(checkForm()){
						var isChangeImage = $("#id_isChangeImage_id").val();
						if(isChangeImage == '2' && uploader.files.length>0){
							uploader.start();
						}else {
							submitForm();
						}
						
					}
		            return false; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！

			    });
				
				$("#id_news_upload_file").bind("click",function(){
					$("#id_news_upload_file").uploadPreview({ Img: "ImgPr", Width: 800, Height: 300,Callback: function () { 
						
					}});
				});
				
				$("#id_add_search_word").bind("click",function(){
					var input = $(this).parent().find("input");
					if(typeof(input)=='undefined' || input==null ){
						$(this).before('<input type="text" id="id_search_word" name="searchWords[0].word" value="" style="width:10%"><button type="button" id="id_deleteone" onclick="deltOne(this)">-</button>');
					}else {
						$(this).before('<input type="text" id="id_search_word" name="searchWords['+input.length+'].word" value="" style="width:10%"><button type="button" id="id_deleteone" onclick="deltOne(this)">-</button>');
					}
				});
				
			});
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="infoContent.content"]', {
					
					uploadJson : '<%=path%>/back/kindeditor-4.1.10/jsp/upload_json.jsp',
					fileManagerJson : '<%=path%>/back/kindeditor-4.1.10/jsp/file_manager_json.jsp',
					allowFileManager : true,
					urlType:'domain',
					width:'80%',
					height:'100%',
					resizeType:1,
					allowImageRemote:false,
					afterChange : function() {
						K('#input_count_id').html(this.count('text'));
						//K('.word_count2').html(this.count('text'));
					},
					afterCreate:function(){
						K('#input_count_id').html(this.count('text'));
					}
				});
	
			});
			
			function submitForm(){
				console.info("submitForm()");
				 var status = $("#id_info_status_id").val();
				 if(status=='1101-1'){
					 $("#id_info_status_id").val("1101-2");
				 }
				$.ajax({
					type:'POST',
					url:'<%=path%>/admin/info/modifyInfo',
					data:$(selector_form).serializeArray(),
					dataType:'json',
					success:function(msg){
						var infoId = $("#id_news_id").val();
						
						if(msg.success=='true'){
								layer.alert(msg.message,{icon: 6, closeBtn:2,title:'资讯管理',offset:'100px'},function(index){
									window.location.href="<%=path%>/admin/info/viewInfo?infoId="+infoId+"&from=1";
									layer.close(index);
								});
							
						}else if(msg.fail=='true'){
							layer.alert(msg.message,{icon: 5, closeBtn:2,title:'资讯管理',offset:'100px'});
						} 
					},
					error: function(data) {
						layer.msg(data.message,4,{type:1});
	                }
				});
			}
			
			
			function checkForm(){
				
				$("#err_mark_title").html("");
				$("#err_mark_brief").html("");
				//$("#err_mark_type").html("");
				$("#err_mark_content").html("");
				//$("#err_mark_file").html("");
				var title = $("#id_news_title").val();
				var brief = $("#id_news_brief").val();
				var content = $("#id_news_content").val();
				//var node = $("#id_hidden_tag_id").val();
				if(title==null||title.trim()==''){
					layer.tips('资讯标题不能为空', '#id_news_title', {
					    tips: 4,
					    time:4000
					});
					return false;
				}
				/* if(typeof(node) == "undefined"||node==null||node.trim()==''){
					layer.tips('请选择资讯对应标签', '#id_tag_div_id', {
					    tips: 4,
					    time:4000
					});
					return false;
				} */
				if(content==null||content.trim()==''){
					layer.tips('资讯内容不能为空', '#id_hidden_content', {
					    tips: 4,
					    time:4000
					});
					return false;
				}
				return true;
			}
			
			function cancel(){
				window.location.href="<%=path %>/admin/info/getInfos?from=1";
			}
			
			function deltOne(vale){
				var inputs = $(vale).nextAll("input");
				for(var i=0;i<inputs.length;i++){
					var inp = inputs[i];
					var attrName = $(inp).attr("name");
					var val = attrName.match(/\d+/);
					$(inp).attr("name","searchWords["+(parseInt(val)-1)+"].word");
				}
				$(vale).prev("input").remove();
				$(vale).remove();
			}
			
		</script>
		<script type="text/javascript">
Function.prototype.method = function(name, func) {
  this.prototype[name] = func;
  return this;
};
if(!String.prototype.trim){ //判断下浏览器是否自带有trim()方法
String.method('trim', function() {
return this.replace(/^s+|s+$/g, '');
});
String.method('ltrim', function() {
return this.replace(/^s+/g, '');
});
String.method('rtrim', function() {
return this.replace(/s+$/g, '');
});
}
</script>
	</body>
</html>