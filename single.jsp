<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<!--[if lt IE 7]>
<html class="lt-ie9 lt-ie8 lt-ie7" lang="en-US"> <![endif]-->
<!--[if IE 7]>
<html class="lt-ie9 lt-ie8" lang="en-US"> <![endif]-->
<!--[if IE 8]>
<html class="lt-ie9" lang="en-US"> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en-US"> <!--<![endif]-->
<head>
    <!-- META TAGS -->
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Knowledge Base Theme</title>

    <link rel="shortcut icon" href="images/favicon.png"/>


    <!-- Style Sheet-->
    <link rel="stylesheet" href="style.css"/>
    <link rel='stylesheet' id='bootstrap-css-css' href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all'/>
    <link rel='stylesheet' id='responsive-css-css' href='css/responsive5152.css?ver=1.0' type='text/css' media='all'/>
    <link rel='stylesheet' id='pretty-photo-css-css' href='js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css'
          media='all'/>
    <link rel='stylesheet' id='main-css-css' href='css/main5152.css?ver=1.0' type='text/css' media='all'/>
    <link rel='stylesheet' id='custom-css-css' href='css/custom5152.html?ver=1.0' type='text/css' media='all'/>


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
        <div class="row">

            <!-- start of page content -->
            <div class="span8 page-content">

                <ul class="breadcrumb">
                    <li><a href="#">知识库主题</a><span class="divider">/</span></li>
                    <li><a href="#" title="View all posts in Server &amp; Database">数据库和服务器</a> <span
                            class="divider">/</span></li>
                    <li class="active">
                    	与您的网站集成的WordPress
                    </li>
                </ul>

                <article class=" type-post format-standard hentry clearfix">

                    <h1 class="post-title"><a href="#">
                    	${topicInfo.title }
                    </a></h1>

                    <div class="post-meta clearfix">
                        <span class="date">${topicInfo.time }</span>
                        <span class="category"><a href="#"
                                                  title="View all posts in Server &amp; Database">${topicInfo.user.name }</a></span>
                        <span class="comments"><a href="#" title="Comment on Integrating WordPress with Your Website">3
                            回复</a></span>
                        <span class="like-count">${topicInfo.good }</span>
                    </div>
                    <!-- end of post meta -->

                    <p>
                    	${topicInfo.contents }
                    </p>



                </article>

					<div class="like-btn">
						<%-- 点赞 --%>
						<form id="like-it-form" action="${pageContext.request.contextPath }/topic_like" method="post">
							 <!--  <span class="like-it ">${topicInfo.good }</span> -->
							 <input type="submit" value="${topicInfo.good }" class="like-it " style="height: 30px"> 
							 <input type="hidden" name="id" value="${topicInfo.id }"> 
						</form>
						<%-- 点赞结束 --%>
					</div>

					<%--评论部分开始 --%>
					<section id="comments">
					<c:forEach var="tp" items="${listReplys }" varStatus="vs">
                    <ol class="commentlist">

                        <li class="comment even thread-even depth-1" id="li-comment-2">
                            <article id="comment-2">
                                <div class="comment-meta">
                                    <h5 class="author">
                                        <cite class="fn">
                                            <a href="#" rel="external nofollow" class="url">${tp.user.name }</a>
                                        </cite>
                                        - <a class="comment-reply-link" href="#">评论</a>
                                    </h5>
                                    <p class="date">
                                        <a href="#">
                                            <time datetime="2013-02-26T13:18:47+00:00">
                                            	${tp.time }
                                            </time>
                                        </a>
                                    </p>

                                </div>
                                <!-- end .comment-meta -->

								<%-- 评论的内容开始 --%>
                                <div class="comment-body">
                                    <p>
                                    	${tp.contents }
                                    </p>
                                </div>
                                <%-- 评论的内容结束 --%>

                            </article>
                            <!-- end of comment -->

                            <ul class="children">

                                <li class="comment byuser comment-author-saqib-sarwar bypostauthor odd alt depth-2"
                                    id="li-comment-3">
                                    <c:if test="${!empty listcoments }">
                                    <c:forEach var="com" items="${listcoments }" varStatus="vs">
                                    <article id="comment-3">

                                        <div class="comment-meta">

                                            <h5 class="author">
                                                <cite class="fn">${com.user.name }</cite>
                                                - <a class="comment-reply-link" href="#">评论</a>
                                            </h5>

                                            <p class="date">
                                                <a href="#">
                                                    <time datetime="2013-02-26T13:20:14+00:00">
                                                        ${com.time }
                                                    </time>
                                                </a>
                                            </p>

                                        </div>
                                        <!-- end .comment-meta -->

                                        <div class="comment-body">
                                            <p>
                                            	${com.reply.id }
                                            </p>
                                        </div>
                                        <!-- end of comment-body -->

                                    </article>
                                    </c:forEach>
                                    </c:if>
                                    <!-- end of comment -->

                                </li>
                            </ul>
                        </li>

                        
                    </ol>
					</c:forEach>
                    <div id="respond">

                        <h3>发表评论</h3>
						<c:if test="${empty userInfo }">
							你还没有登录，请先<a href="${pageContext.request.contextPath }/login/login.jsp" target="_blank">登录</a>
						</c:if>
						<c:if test="${!empty userInfo }">
                        <form action="${pageContext.request.contextPath }/reply_addReply" method="post" >
                        	<input type="hidden" name="topicId" value="${topicInfo.id }">  <!-- 隐藏域“文章ID” -->
                            <div>
                                <label for="comment">回复</label>
                                <textarea class="span8" name="contents" id="comment" cols="58" rows="10"></textarea>
                            </div>
                            <div>
                                <input class="btn" name="submit" type="submit" id="submit" value="提交评论">
                            </div>
                        </form>
					</c:if>
                    </div>

                </section>
                
                <%--评论部分结束 --%>

            </div>
            <!-- end of page content -->


            <!-- start of sidebar -->
            <aside class="span4 page-sidebar">

                <section class="widget">
                    <div class="support-widget">
                        <h3 class="title">支持</h3>

                        <p class="intro">
	                       	 需要更多的支持？如果您没有找到答案，请联系我们获取进一步的帮助。
                        </p>
                    </div>
                </section>


                <section class="widget">
                    <h3 class="title">推荐文章</h3>
                    <ul class="articles">
                    <c:forEach var="tp" items="${list4Notes }" varStatus="vs">
                        <li class="article-entry standard">
                            <h4><a href="single.html">${tp.title }</a></h4>
                            <span class="article-meta">${tp.time }
                            </span>
                            <span class="like-count">${tp.good }</span>
                        </li>
                     </c:forEach>
                    </ul>
                </section>


					<section class="widget">
						<h3 class="title">分类</h3>
						<ul>
							<c:forEach var="ty" items="${listTypes }" varStatus="vs">
								<li><a href="#" title="Lorem ipsum dolor sit amet,">${ty.typeName
										}</a></li>
							</c:forEach>
						</ul>
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
