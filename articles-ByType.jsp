<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!doctype html>
        <!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en-US"> <![endif]-->
        <!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="en-US"> <![endif]-->
        <!--[if IE 8]>    <html class="lt-ie9" lang="en-US"> <![endif]-->
        <!--[if gt IE 8]><!--> <html lang="en-US"> <!--<![endif]-->
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
                <script src="js/html5.js"></script></script>
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
                                <div class="row" style="height: 900px;">

                                        <!-- start of page content -->
                                        <div class="span8 main-listing">
					<c:forEach var="tp" items="${listByType }" varStatus="vs">
						<article class="format-standard type-post hentry clearfix">

							<header class="clearfix">

								<h3 class="post-title">
									<a href="${pageContext.request.contextPath }/topic_viewTopicInfo?id=${tp.id }">
										${tp.title }	
									</a>
								</h3>

								<div class="post-meta clearfix">
									<span class="date">${tp.time }</span> <span class="category">
									<a href="#" title="View all posts in Server &amp; Database"> 
										${tp.user.name }
									</a>
									</span> <span class="comments">
									<a href="#" title="Comment on Integrating WordPress with Your Website">3
										评论 
									</a>
									</span> <span class="like-count">${tp.good }</span>
								</div>
								<!-- end of post meta -->

							</header>

							<p>
								${fn:substring(tp.contents,0,50)}...
								<a 
									class="readmore-link" href="${pageContext.request.contextPath }/topic_viewTopicInfo?id=${tp.id }">
									查看
								</a>
							</p>

						</article>
					</c:forEach>


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
						<h3 class="title">推荐文章</h3>
						<ul class="articles">
							<c:forEach var="tp" items="${list4Notes }" varStatus="vs">
								<li class="article-entry standard">
									<h4>
										<a href="single.html">${tp.title }</a>
									</h4> <span class="article-meta">${tp.time } </span> <span
									class="like-count">${tp.good }</span>
								</li>
							</c:forEach>
						</ul>
					</section>
					<section class="widget">
						<h3 class="title">分类</h3>
						<ul>
							<c:forEach var="ty" items="${listTypes }" varStatus="vs">
								<li><a href="${pageContext.request.contextPath }/topic_view_ByType?id=${ty.id }&currentPage=1" title="Lorem ipsum dolor sit amet,">
								${ty.typeName }</a></li>
							</c:forEach>
						</ul>
					</section>


				</aside>
                                        <!-- end of sidebar -->
                                </div>
                                <!-- 分页开始 -->
					<div id="pagination" style="font-size: 33px;">
						当前&nbsp;&nbsp;${currentPage }/${totalPage }&nbsp;&nbsp;页 <a
							href="${pageContext.request.contextPath }/topic_view_ByType?id=${id }&currentPage=1">
							首页 </a> &nbsp;&nbsp;
						<c:if test="${currentPage!=1 }">
							<a
								href="${pageContext.request.contextPath }/topic_view_ByType?id=${id }&currentPage=${currentPage-1 }">
								上一页 </a>
						</c:if>
						&nbsp;&nbsp;
						<c:if test="${currentPage!=totalPage }">
							<a
								href="${pageContext.request.contextPath }/topic_view_ByType?id=${id }&currentPage=${currentPage+1 }">
								下一页 </a>
						</c:if>
						&nbsp;&nbsp;
						<c:if test="${currentPage!=totalPage }">
							<a
								href="${pageContext.request.contextPath }/topic_view_ByType?id=${id }&currentPage=${totalPage }">
								末页 </a>
						</c:if>
						<c:if test="${currentPage==totalPage }">
							<a>末页</a>
						</c:if>
					</div>
					<!-- 分页结束 -->
                        </div>
                </div>
                <!-- End of Page Container -->

                <!-- Start of Footer -->
                 <%@ include file="comm/footer.jsp" %>
                <!-- End of Footer -->

                <a href="#top" id="scroll-top"></a>

                <!-- script -->
                <script type='text/javascript' src='js/jquery-1.8.3.min.js'></script>
                <script type='text/javascript' src='js/jquery.easing.1.34e44.js?ver=1.3'></script>
                <script type='text/javascript' src='js/prettyphoto/jquery.prettyPhotoaeb9.js?ver=3.1.4'></script>
                <script type='text/javascript' src='js/jquery.liveSearchd5f7.js?ver=2.0'></script>
				<script type='text/javascript' src='js/jflickrfeed.js'></script>
                <script type='text/javascript' src='js/jquery.formd471.js?ver=3.18'></script>
                <script type='text/javascript' src='js/jquery.validate.minfc6b.js?ver=1.10.0'></script>
                <script type='text/javascript' src='js/custom5152.js?ver=1.0'></script>

        </body>
</html>
