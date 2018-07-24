<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="layui/css/layui.css">
<script type="text/javascript" src="layui/layui.js"></script>
<title>教务管理系统首页</title>
<style type="text/css">
.layui-body {
	background: url('images/welcome.jpg') no-repeat center;
	background-size: 100%;
}
.layui-tab-content {
	padding: 0px;
}
</style>
</head>
<body class="layui-layout-body" onload="changeFrameHeight()">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">教务管理系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="">控制台</a></li>
      <li class="layui-nav-item"><a href="">商品管理</a></li>
      <li class="layui-nav-item"><a href="">用户</a></li>
      <li class="layui-nav-item">
        <a href="javascript:;">其它系统</a>
        <dl class="layui-nav-child">
          <dd><a href="">邮件管理</a></dd>
          <dd><a href="">消息管理</a></dd>
          <dd><a href="">授权管理</a></dd>
        </dl>
      </li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
          ${user.username }
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="${pageContext.request.contextPath }/logout.do">退出</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
      	<c:forEach items="${menuDtoList }" var="menuDto">
      		<li class="layui-nav-item layui-nav-itemed">
	          <a class="" href="javascript:;">${menuDto.menuname }</a>
	          <c:if test="${not empty menuDto.menuDtoList }">
	          	  <dl class="layui-nav-child">
	          	  	<c:forEach items="${menuDto.menuDtoList }" var="innerMenuDto">
	          	  		<dd><a class="menu" href="javascript:;" url="${innerMenuDto.url }" lay-id="${innerMenuDto.menuid }">${innerMenuDto.menuname }</a></dd>
	          	  	</c:forEach>
		          </dl>
	          </c:if>
	        </li>
      	</c:forEach>
      </ul>
    </div>
  </div>
  
  <div class="layui-body layui-tab layui-tab-card" lay-filter="demo" lay-allowclose="true" style="overflow:hidden">
      <ul class="layui-tab-title">
	  </ul>
	  <div class="layui-tab-content">
	  </div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © layui.com - 底部固定区域
  </div>
</div>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var $ = layui.jquery
  ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
  //绑定事件
  $('.menu').on('click', function(){
    var layid = $(this).attr("lay-id");
    if($("li[lay-id="+layid+"]").size()>0){
    	element.tabChange('demo', layid);
    } else {
    	//新增一个Tab项
        element.tabAdd('demo', {
          title: $(this).html() //用于演示
          ,content: '<iframe id="mainiframe'+layid+'" src="'+$(this).attr("url")+'" onload="changeFrameHeight(\'mainiframe'+layid+'\')" width="100%" src="main.jsp"  frameborder="0" scrolling="auto"></iframe>'
          ,id: layid //实际使用一般是规定好的id，这里以时间戳模拟下
        });
        element.tabChange('demo', layid);
    }
  });
});
function changeFrameHeight(frameid){
    var ifm= document.getElementById(frameid);
    if(ifm != null){
    	ifm.height=document.documentElement.clientHeight-144;
    }
}
window.onresize=function(){ 
	var $ = layui.jquery;
	for(var i=0; i<$("iframe").size(); i++){
		changeFrameHeight($("iframe").eq(i).attr("id"));
	}
}
</script>
</body>
</html>