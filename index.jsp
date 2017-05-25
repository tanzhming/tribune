<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
        <head>
                <!-- META TAGS -->
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0">

                <title>爱问知识论坛</title>

                <link rel="shortcut icon" href="images/favicon.png" />

                <!-- Style Sheet-->
                <link rel="stylesheet" href="style.css"/>
                <link rel='stylesheet' id='bootstrap-css-css'  href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='responsive-css-css'  href='css/responsive5152.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='pretty-photo-css-css'  href='js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css' media='all' />
                <link rel='stylesheet' id='main-css-css'  href='css/main5152.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='custom-css-css'  href='css/custom5152.html?ver=1.0' type='text/css' media='all' />


                <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
                <!--[if lt IE 9]>
                <script src="js/html5.js"></script>
                <![endif]-->
        </head>
        <body>

                <!-- Start of Header -->
                <%@ include file="comm/head.jsp" %>
                <!-- End of Header -->

                <!-- Start of Search Wrapper -->
                <%@include file="comm/search.jsp" %>
                <!-- End of Search Wrapper -->

                <!-- Start of Page Container -->
                <div class="page-container">
                        <div class="container">
                                <div class="row">

                                        <!-- start of page content -->
                                        <div class="span8 page-content">

                                                <!-- Basic Home Page Template -->
                                                <div class="row separator">
                                                        <section class="span4 articles-list">
                                                                <h3>推荐文章</h3>
                                                                <c:if test="${empty listTuiJian }">
                                                                	暂无推荐文章
                                                                </c:if>
                                                                <c:if test="${!empty listTuiJian }">
                                                                <c:forEach var="tp" items="${listTuiJian }" varStatus="vs">
                                                                <ul class="articles">
                                                                        <li class="article-entry standard">
                                                                                <h4><a href="${pageContext.request.contextPath }/topic_viewTopicInfo?id=${tp.id }">
                                                                                	${tp.title }
                                                                                </a></h4>
                                                                                <span class="article-meta">
                                                                                	${tp.time }
                                                                                </span>
                                                                                <span class="like-count">
                                                                                	${tp.good }
                                                                                </span>
                                                                        </li>
                                                                </ul>
                                                                </c:forEach>
                                                                </c:if>
                                                        </section>


						<section class="span4 articles-list">
							<h3>最新文章</h3>
							<c:if test="${empty listall }">
                                	没有任何人发表过文章，你可以是第一个发表文章的人,历史会记住你的
                            </c:if>
							<c:if test="${!empty listall }">
								<c:forEach var="tp" items="${listall }" varStatus="vs">
									<ul class="articles">
										<li class="article-entry standard">
											<h4>
												<a
													href="${pageContext.request.contextPath }/topic_viewTopicInfo?id=${tp.id }">
													${tp.title } </a>
											</h4> <span class="article-meta"> ${tp.time } </span> <span
											class="like-count"> ${tp.good } </span></li>
									</ul>
								</c:forEach>
							</c:if>
						</section>
					</div>
					<div style="padding-left: 410px">
						当前&nbsp;&nbsp;${currentPage }/${totalPage }&nbsp;&nbsp;页
							<a href="${pageContext.request.contextPath }/topic_listAll?currentPage=1">
								首页
							</a>

							&nbsp;&nbsp;
							<c:if test="${currentPage!=1 }">
								<a href="${pageContext.request.contextPath }/topic_listAll?currentPage=${currentPage-1 }">
									上一页
								</a>
							</c:if>
							&nbsp;&nbsp;
							<c:if test="${currentPage!=totalPage }">
								<a href="${pageContext.request.contextPath }/topic_listAll?currentPage=${currentPage+1 }">
									下一页
								</a>
							</c:if>
							&nbsp;&nbsp;
							<c:if test="${currentPage!=totalPage }">
								<a href="${pageContext.request.contextPath }/topic_listAll?currentPage=${totalPage }">
									末页
								</a>
							</c:if>
							<c:if test="${currentPage==totalPage }">
								<a>末页</a>
							</c:if>
					</div>
                                        </div>
                                        <!-- end of page content -->


                                        <!-- start of sidebar -->
                                        <aside class="span4 page-sidebar">

                                                <section class="widget">
                                                        <div class="support-widget">
                                                                <h3 class="title">支持</h3>
                                                                <p class="intro">需要更多的支持？如果您没有找到答案，请联系我们获取进一步的帮助。</p>
                                                        </div>
                                                </section>

                                                <section class="widget">
                                                        <div class="quick-links-widget">
                                                                <h3 class="title">快速链接</h3>
                                                                <ul id="menu-quick-links" class="menu clearfix">
                                                                        <li><a href="${pageContext.request.contextPath }/topic_listAll?currentPage=1">首页</a></li>
                                                                        <li><a href="${pageContext.request.contextPath }/topic_view_articles">文章列表</a></li>
                                                                        <li><a href="faq.jsp">常见问题解答</a></li>
                                                                        <li><a href="contact.html">联系我们</a></li>
                                                                </ul>
                                                        </div>
                                                </section>


                                        </aside>
                                        <!-- end of sidebar -->
                                </div>
                        </div>
                </div>
                <!-- End of Page Container -->

                <!-- Start of Footer -->
                <%@ include file="comm/footer.jsp" %>
                <!-- End of Footer -->

                <a href="#top" id="scroll-top"></a>

                <!-- script -->
                <script type='text/javascript' src='js/jquery-1.8.3.min.js'></script>
                <script type='text/javascript' src='js/jquery.easing.1.3.js'></script>
                <script type='text/javascript' src='js/prettyphoto/jquery.prettyPhoto.js'></script>
                <script type='text/javascript' src='js/jflickrfeed.js'></script>
				<script type='text/javascript' src='js/jquery.liveSearch.js'></script>
                <script type='text/javascript' src='js/jquery.form.js'></script>
                <script type='text/javascript' src='js/jquery.validate.min.js'></script>
                <script type='text/javascript' src='js/custom.js'></script>

        </body>
</html>