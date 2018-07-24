<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./layui/css/layui.css">
    <script type="text/javascript" src="./layui/layui.js"></script>
    <script type="text/javascript" src="./layui/layui.all.js"></script>
<title>Insert title here</title>
<script>
    layui.use(['form', 'layedit'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit;
        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');
        //自定义验证规则
        form.verify({
            username: function(value){
                if(value.length < 4){
                    return '账号至少4个字符';
                }

            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,content: function(value){
                layedit.sync(editIndex);
            },
            
        });
        form.on('submit(go)', function(data){
			  $("form").submit();
		  });

    });
    function init(){
        if(window.top !== window.self){
            window.top.location.href = "${pageContext.request.contextPath }";
        }
    }
</script>
<style type="text/css">
    body {
        background-image: url("./images/register.jpg");
    }
    .content {
        width: 350px;
        height: 450px;
        margin-top: 150px;
        margin-left: 100px;
        background-color: white;
        padding: 20px;
    }
    .layui-form-item{
        width: 350px;
        height: 52px;
    }
    .layui-table-tips{
        position: absolute;
        margin-top: 5px;
        font-size: 14px;
        color: #ccc;
    }
  /*  .layui-form-pane .layui-form-label {
        width: 40px;
        padding: 8px 0px;
    }*/
   /* .layui-form-pane .layui-input-block {
        margin-left: 40px;
    }*/
    i {
        color: #e6e6e6;
    }
    i:hover {
        color: #009688;
    }
</style>
</head>
<body class="login_bj" onload="init()">
<div class="content">
    <fieldset class="layui-elem-field layui-field-title" style="text-align:center;">
        <legend style="font-size: 30px;">账号注册</legend>
    </fieldset>
<form class="layui-form layui-form-pane" action="${pageContext.request.contextPath }/register.do" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">账号</label>
        <div class="layui-input-inline">
            <input type="text" name="userName" lay-verify="required|username" autocomplete="off" placeholder="请输入账号" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input  type="password" name="passWord" lay-verify="required|pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="go">注册</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
    <div class="layui-form-item" style="text-align: right;">
        <a href="login.jsp">去登录</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">忘记密码</a>
    </div>
    <fieldset class="layui-elem-field layui-field-title" style="text-align:center;">
        <legend style="font-size: 14px; color: #e6e6e6;">其他方式登录</legend>
    </fieldset>
    <div class="layui-form-item" style="text-align: center;">
        <i class="layui-icon layui-icon-login-wechat" style="font-size: 38px;"></i>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <i class="layui-icon layui-icon-login-qq" style="font-size: 38px;"></i>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <i class="layui-icon layui-icon-login-weibo" style="font-size: 38px;"></i>
    </div>
</form>
</div>
</body>
</html>