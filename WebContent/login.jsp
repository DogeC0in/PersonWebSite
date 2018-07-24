<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<script src="libs/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="css/login.css"/>
</head>
<body>
		<header>
			<a href="#" class="logo"></a>
			<div class="desc">欢迎登录</div>
		</header>
		<section>
			<form>
				<div class="register-box">
					<label for="username" class="username_label">用 户 名
					<input maxlength="20" name="userName" type="text" placeholder="您的用户名或登录名" id="u1"/>
					</label>
					<div class="tips">
						
					</div>
				</div>
				<div class="register-box">
					<label for="username" class="other_label"> 密 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp码
					<input maxlength="20" name="passWord" type="password" placeholder="请输入密码" id="p1"/>
					</label>
					<div class="tips">
						
					</div>
				</div>
				<div class="register-box">
					<label for="username" class="other_label">验 证 码
					<input maxlength="20" type="text" placeholder="请输入验证码" />
					</label>
					<span id="code"></span>
					<div class="tips">
						
					</div>
				</div>
				<div class="arguement">
					<input type="checkbox" id="xieyi"/>
					阅读并同意
					<a href="#">《用户协议》</a>
					<a href="#">《隐私政策》</a>
					<div class="tips">
					</div>
				</div>
				<div class="submit_btn">
					<button type="button" id="submit_btn" >立 即 登 录</button>
				</div>
			</form>
		</section>
		<script src="js/login.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">

//		提交按钮
		$("#submit_btn").click(function(e){		
			for(var j=0 ;j<3;j++){
				if($('input').eq(j).val().length==0){				
					$('input').eq(j).focus();				
					if(j==2){
						$('input').eq(j).parent().next().next("div").text("此处不能为空");
						$('input').eq(j).parent().next().next("div").css("color",'red');
						e.preventDefault();
						return;
					}
					$('input').eq(j).parent().next(".tips").text("此处不能为空");
					$('input').eq(j).parent().next(".tips").css("color",'red');	
					e.preventDefault();
					return;
				}			
			}

			//协议
			if($("#xieyi")[0].checked){
				//发送用户信息
	            var u1=$("#u1").val();
	            var p1=$("#p1").val();
	            //异步动态刷新表单
	            $.ajax({
	                type : 'post',
	                url : '${pageContent.request.contextPath }/PersonWebSite/login.do',
	                //设置contentType类型为json
	                contentType : 'application/json;charset=utf-8',
	                //json数据
	                //dataType:'json',
	                data:JSON.stringify({'userName':u1,'passWord':p1}), //提交json字符串数组，如果提交json字符串去掉[]
					/*data:'{"username":"username","password":"password"}',*/
	                //请求成功后的回调函数
	                success:function(data) {
	                    //此处的data为一个json格式的对象；是你的检验文件返回的数据;是服务器返回的登陆结果
	                    //{'status':true,'msg':'登陆成功'}     验证反馈结果  
	                    //{'status':false,'msg':'密码错误'}    验证反馈结果     
	                    if(data =="true" ){
	                        alert("登陆成功!前往主页...");
	                        window.location.href="index.jsp";
	                    } else{
	                        alert("账号或密码错误!");
	                    }
	                },
	                error : function() {
	                    alert("登陆异常!");
	                }
	            });
			}else{						
				$("#xieyi").next().next().next(".tips").text("请勾选协议");
				$("#xieyi").next().next().next(".tips").css("color",'red');
				e.preventDefault();
				return;
			}

		})
		
		</script>
</body>
</html>