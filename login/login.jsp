<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">

<head>

<meta charset="utf-8">
<title>用户登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- CSS -->

<link rel="stylesheet" href="css/supersized.css">
<link rel="stylesheet" href="css/login.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	<script src="js/html5.js"></script>
<![endif]-->
<script src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/jquery.form.js"></script>
<script type="text/javascript" src="js/tooltips.js"></script>
<script type="text/javascript" src="js/login.js"></script>
</head>

<body>

<div class="page-container">
	<div class="main_box" style="height: 400px">
		<div class="login_box">
			<div class="login_logo">
				<img src="images/logo.png" >
			</div>
		
			<div class="login_form">
				<form action="${pageContext.request.contextPath }/user_login" id="login_form" method="post">
					<div>
						<label style="color: red;">${errorInfo }</label>
					</div>
					<div class="form-group">
						<label for="j_username" class="t">用户名：</label> 
						<input id="loginName" value="" name="loginName" type="text" class="form-control x319 in" 
						autocomplete="off">
					</div>
					<div class="form-group">
						<label for="j_password" class="t">密　码：</label> 
						<input id="pwd" value="" name="pwd" type="password" 
						class="password form-control x319 in">
					</div>
					
					<div class="form-group">
						<label class="t"></label>
						<label for="j_remember" class="m">
						<input id="j_remember" type="checkbox" value="true">&nbsp;记住登陆账号!</label>
					</div>
					<div class="form-group space">
						<label class="t"></label>　　　
						<input type="submit"  id="submit_btn" 
						class="btn btn-primary btn-lg" value="&nbsp;登&nbsp;录&nbsp;">
						<input type="reset" value="&nbsp;重&nbsp;置&nbsp;" class="btn btn-default btn-lg">
					</div>
				</form>
			</div>
		</div>
		<div class="bottom">Copyright &copy; 2014 - 2015 <a href="#">系统登陆</a></div>
	</div>
</div>

<!-- Javascript -->

<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<script src="js/scripts.js"></script>
<div style="text-align:center;">

</div>
</body>
</html>