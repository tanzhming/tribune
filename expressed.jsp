<!doctype html>
<!--[if lt IE 7]>
<html class="lt-ie9 lt-ie8 lt-ie7" lang="en-US"> <![endif]-->
<!--[if IE 7]>
<html class="lt-ie9 lt-ie8" lang="en-US"> <![endif]-->
<!--[if IE 8]>
<html class="lt-ie9" lang="en-US"> <![endif]-->
<!--[if gt IE 8]><!-->
<%@page import="java.text.SimpleDateFormat"%>
<html lang="en-US"> <!--<![endif]-->
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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



<!-- Start of Page Container -->
<div class="page-container">
    <div class="container">
        <div class="row">

            <!-- start of page content -->
            <div class="span8 page-content">



                <section id="comments">

                    <div id="respond">

                        <h3>发表文章</h3>



                        <form action="${pageContext.request.contextPath }/topic_addTopic" method="post" id="commentform">
							<input type="hidden" name="Tuid" value="${userInfo.id }">
								<%
									String datetime = new SimpleDateFormat("yyyy-MM-dd HH:ss:mm")
											.format(Calendar.getInstance().getTime()); //获取系统时间 
									request.setAttribute("currentTime", datetime);
								%>
								<input type="hidden" name="time" value="${currentTime }">
							<input type="hidden" name="isTuiJian" value="0">
							<input type="hidden" name="good" value="0">
                            <div>
                                <label for="author">标题</label>
                                <input class="span4" type="text" name="title" id="author"  size="22">
                            </div>
							<div>
                                <label for="author">分类</label>
                                <select name="tyId">
                                	<option value="0">----------------请选择----------------</option>
                                	<c:forEach var="ty" items="${listTypes }" varStatus="vs">
                                		<option value="${ty.id }">${ty.typeName }</option>
                                	</c:forEach>
                                </select>
                            </div>
                            <div>
                                <label for="comment">内容</label>
                                <textarea class="span8" name="contents" id="comment" cols="58" rows="10"></textarea>
                            </div>


                            <div>
                                <input class="btn" name="submit" type="submit" id="submit" value="发表">
                            </div>

                        </form>

                    </div>

                </section>
                <!-- end of comments -->

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
