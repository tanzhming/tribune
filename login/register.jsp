<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">

<head>

<meta charset="utf-8">
<title>用户注册</title>
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
	<div class="main_box" style="height: 556px">
		<div class="login_box">
			<div>
				用户注册<font color="red"></font>
			</div>
		
			<div class="login_form">
				<form action="${pageContext.request.contextPath }/user_register" id="login_form" method="post">
					<div>
						<label style="color: red;">${errorInfo }</label>
					</div>
					<div class="form-group">
						<label for="j_username" class="t">用户名：</label> 
						<input id="loginName" value="" name="loginName" type="text" class="form-control x319 in" 
						autocomplete="off">
					</div>
					<div class="form-group">
						<label for="j_password" class="t">密 &nbsp;　码：</label> 
						<input id="pwd" value="" name="pwd" type="password" 
						class="password form-control x319 in">
					</div>
					
					<div class="form-group">
						<label for="j_password" class="t">昵 &nbsp;  称：</label> 
						<input id="name" value="" name="name" type="text" 
						class="password form-control x319 in">
					</div>
					
					<div class="form-group">
						<label for="j_password" class="t">性 &nbsp;  别：</label> 
						<input id="sex" value="男" name="sex" type="radio"  >男   &nbsp;
						<input id="sex" value="女" name="sex" type="radio"  >女
					</div>
					
					<div class="form-group">
						<label for="j_password" class="t">邮 &nbsp;  箱：</label> 
						<input id="email" value="" name="email" type="email"  class="password form-control x319 in">
					</div>
					
					<div class="form-group">
						<label for="j_password" class="t">电 &nbsp;  话：</label> 
						<input id="tel" value="" name="tel" type="tel"  class="password form-control x319 in">
					</div>
					
					
					
					<div class="form-group space">
						<label class="t"></label>　　　
						<input type="submit"  id="submit_btn" class="btn btn-primary btn-lg" value="&nbsp;注&nbsp;册&nbsp;">
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