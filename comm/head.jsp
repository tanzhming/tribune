<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Start of Header -->
<div class="header-wrapper">
	<header>
		<div class="container">


			<div class="logo-container">
				<!-- Website Logo -->
				<a href="index-2.html" title="Knowledge Base Theme"> <img
					src="images/logo.png" alt="Knowledge Base Theme"> </a>
			</div>


			<!-- Start of Main Navigation -->
			<nav class="main-nav">
				<div class="menu-top-menu-container">
					<ul id="menu-top-menu" class="clearfix">
						<li class="current-menu-item"><a href="${pageContext.request.contextPath }/topic_listAll?currentPage=1">首页</a>
						</li>
						<c:if test="${empty userInfo }">
							<li>
								<a href="${pageContext.request.contextPath }/login/login.jsp">登录</a>&nbsp;&nbsp;
								<a href="${pageContext.request.contextPath }/login/register.jsp">注册</a>
							</li>
						</c:if>
						<c:if test="${!empty userInfo }">
							<li>
								<a href="${pageContext.request.contextPath }/user_showMyInfo" target="_blank">${userInfo.name }</a>
								&nbsp;&nbsp;
								<a href="${pageContext.request.contextPath }/user_exit">退出</a>
							</li>
						</c:if>
						<li><a href="${pageContext.request.contextPath }/topic_view_expressed">发表</a>
						<li><a href="${pageContext.request.contextPath }/topic_view_articles?currentPage=1">文章列表</a>
						</li>
						<li><a href="faq.jsp">常见问题解答</a>
						</li>
						<li><a href="#">皮肤</a>
							<ul class="sub-menu">
								<li><a href="blue-skin.html">Blue Skin</a>
								</li>
								<li><a href="green-skin.html">Green Skin</a>
								</li>
								<li><a href="red-skin.html">Red Skin</a>
								</li>
								<li><a href="index-2.html">默认外观</a>
								</li>
							</ul></li>

						<li><a href="${pageContext.request.contextPath }/contact_view_contact">联系我们</a>
						</li>
					</ul>
				</div>
			</nav>
			<!-- End of Main Navigation -->

		</div>
	</header>
</div>
<!-- End of Header -->
