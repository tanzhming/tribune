<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Start of Footer -->
<footer id="footer-wrapper">
	<div id="footer" class="container">
		<div class="row">

			<div class="span3">
				<section class="widget">
					<h3 class="title">关于论坛</h3>
					<div class="textwidget">
						<p>
							我们的论坛兴起于当今的互联网时代，我们做好每一模块的设计、开发，争取做到行业中标准。
						</p>
						<P>
							版权所有--简若宁，盗版必究
						</P>
					</div>
				</section>
			</div>

			<div class="span3">
				<section class="widget">
					<h3 class="title">分类</h3>
					<c:forEach var="ty" items="${listTypes }" varStatus="vs">
					<ul>
						<li>
						<a href="${pageContext.request.contextPath }/topic_view_ByType?id=${ty.id }&currentPage=1" title="Lorem ipsum dolor sit amet,">
							${ty.typeName }
						</a>
						</li>
					</ul>
					</c:forEach>
				</section>
			</div>

		</div>
	</div>
	<!-- end of #footer -->

	<!-- Footer Bottom 版权信息 -->
	<%@ include file="copyright.jsp"%>
	<!-- End of Footer Bottom -->

</footer>
<!-- End of Footer -->






