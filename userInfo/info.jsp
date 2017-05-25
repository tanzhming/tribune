<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>网站信息</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>  
</head>

<body >
	<!-- <SCRIPT language=javascript>
		function click() {
			if (event.button == 2) {
				alert('无法查看网页源代码');
			}
		}
		document.onmousedown = click;
	</SCRIPT> -->
	<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>个人信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="${pageContext.request.contextPath }/user_updateInfo">
     <%--  <input type="hidden" name="loginName" value="${userInfo.loginName }" >
      <input type="hidden" name="pwd" value="${userInfo.pwd }"> --%>
      <!-- 隐藏域:用户的ID  -->
      <input type="hidden" name="id" value="${userInfo.id }">
      <div class="form-group">
        <div class="label">
          <label>登录名：</label>
        </div>
        <div class="field">
          <div style="font-size: 28px;line-height: 29px;">${userInfo.loginName }</div>
        </div>
      </div>
     
      <div class="form-group">
        <div class="label">
          <label>昵称：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="name" value="${userInfo.name }" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>性别：</label>
        </div>
        <div class="field">
          <c:if test="${userInfo.sex=='男' }">
          	<input type="radio" name="sex" value="男" checked="checked" />男&nbsp;&nbsp;
          	<input type="radio" name="sex" value="女" />女&nbsp;&nbsp;
          </c:if>
          <c:if test="${userInfo.sex=='女' }">
          	<input type="radio" name="sex" value="男" />男&nbsp;&nbsp;
          	<input type="radio" name="sex" value="女" checked="checked"  />女&nbsp;&nbsp;
          </c:if>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>手机：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="tel" value="${userInfo.tel }" />
          <div class="tips"></div>
        </div>
      </div>
     
      <div class="form-group">
        <div class="label">
          <label>Email：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="email" value="${userInfo.email }" />
          <div class="tips"></div>
        </div>
      </div>
              
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 修改</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body></html>