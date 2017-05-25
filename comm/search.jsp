<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="search-area-wrapper">
	<div class="search-area container">
		<h3 class="search-header">有一个问题？</h3>
		<p class="search-tag-line">如果您有任何问题，你可以问以下或输入你在找什么！</p>

		<form id="search-form" class="search-form clearfix" method="post" action="${pageContext.request.contextPath }/topic_search" autocomplete="off">
			<input class="search-term required" type="text" id="title" name="title" 
				placeholder="在这里输入你要搜索的内容" title="* Please enter a search term!" />
			<input class="search-btn" type="submit"  value="搜索" />
			<div id="search-error-container"></div>
		</form>
	</div>
</div>
