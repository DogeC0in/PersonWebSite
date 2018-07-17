<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<script src="libs/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="css/index.css"/>
</head>
<body>
		<header>
			<a href="#" class="logo"></a>
			<div class="desc">欢迎登录</div>
		</header>
		<section>
			<form action="${pageContent.request.contextPath }/login.do" method="post">
				<div class="register-box">
					<label for="username" class="username_label">用 户 名
					<input maxlength="20" name="userName" type="text" placeholder="您的用户名或登录名" class="userName"/>
					</label>
					<div class="tips">
						
					</div>
				</div>
				<div class="register-box">
					<label for="username" class="other_label"> 密 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp码
					<input maxlength="20" name="passWord" type="password" placeholder="请输入密码" class="passWord"/>
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
					<button type="submit" id="submit_btn" >立 即 登 录</button>
				</div>
			</form>
		</section>
		<script src="js/index.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>