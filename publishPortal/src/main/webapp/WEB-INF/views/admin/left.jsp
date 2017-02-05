<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/general_path.jsp"%>
<!DOCTYPE>
<html>
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="<%=path %>/back/css/reset.css">
		<link rel="stylesheet" type="text/css" href="<%=path %>/back/css/left.css">
	</head>
	<body>
		<ul id="slider_menu"></ul>
		<script type="text/javascript" src="<%=path %>/back/js/libs/jquery-1.11.1.min.js"></script>
		<script type="text/javascript">
			$(function(){
				/************************************************************
				* 展开或关闭子菜单的配置 
				************************************************************/
				$.ajax({
					type: "post",
			        url: "<%=path %>/admin/ajaxMenuList",
			        dataType: "json",
					success:function(data){
						initMenu(data);
					}
				});
			});
	
			//初始化菜单json转对象
			function initMenu(node_root){
				for (var i = 0; i < node_root.length; i++) {
					initRootMenu(node_root[i]);
				}
			}

			//初始化菜单根节点
			function initRootMenu(node_root){
				if(isHaveChildren(node_root)){
					menu_html = loopSubMenu(node_root);
				}else{
					menu_html = appendMenuHtml(node_root);
				}
				$("#slider_menu").append(menu_html);
			}

			//循环当前节点的子菜单(递归)
			function loopSubMenu(node_parent){
				var curContext = "";
				var cur_node_children = node_parent.children;
				var cur_node_children_length = cur_node_children.length;
				for(var i = 0; i < cur_node_children_length; i++){
					var curTempContext = "";
					var curTempNode = cur_node_children[i];
					if(isHaveChildren(curTempNode)){
						curTempContext += loopSubMenu(curTempNode);
					}else{
						curTempContext += appendMenuHtml(curTempNode);
					}
					curContext += curTempContext;
				}
				return appendSubMenuHtml(node_parent, curContext);
			}

			//判断是否有子菜单
			function isHaveChildren(node){
				var cur_node_children = node.children;
				if(cur_node_children !=undefined && cur_node_children != null && cur_node_children.length > 0){
					return true;
				}
				return false;
			}

			//追加没有子菜单项
			function appendMenuHtml(node){
				var menuNoSub_html = '<li><a href="'+node.attributes.href+'" title="'+node.attributes.title+'" target="main"><i class="'+node.iconCls+'"></i><span>'+node.text+'</span></a></li>';
				return menuNoSub_html;
			}

			//追加有子菜单项
			function appendSubMenuHtml(node, context){
				var menuHaveSub_html = '<li><a href="'+node.attributes.href+'" title="'+node.attributes.title+'" target="main" onclick="closeSubs(this)"><i class="'+node.iconCls+'"></i><span>'+node.text+'</span></a>';
				if(node.state == 'off'){
					menuHaveSub_html += '<span class="sliser_icon" onclick="closeSubs(this)"></span><ul class="subs closed">'+context+'</ul></li>';
				}else{
					menuHaveSub_html += '<span class="sliser_icon off" onclick="closeSubs(this)"></span><ul class="subs">'+context+'</ul></li>';
				}
				return menuHaveSub_html;
			}
			/**
			 * 展开关闭菜单
			 * */
			function closeSubs(dom, e){
				var subs = $(dom).parent().find(".subs");
				subs.toggleClass("closed");
				$(dom).parent().find(".sliser_icon").toggleClass("off");
			}
		</script>
	</body>
</html>