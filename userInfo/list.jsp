<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
<form method="post" action="" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 我的文章列表</strong> </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="100" style="text-align:left; padding-left:20px;">ID</th>
        <th>名称</th>
        <th>分类名称</th>
        <th width="10%">发表时间</th>
        <th width="310">操作</th>
      </tr>
      			<!-- 先判断，在迭代 -->
      			<c:if test="${empty listTopicByUser }">
      				你还没有发表过任何文章.
      			</c:if>
      			<c:if test="${!empty listTopicByUser }">
      			<c:forEach var="tp" items="${listTopicByUser }" varStatus="vs">
				<tr>
					<td style="text-align:left; padding-left:20px;"> ${vs.count } </td>
					<td>${tp.title }</td>
					<td>${tp.type.typeName }</td>
					<td>${tp.time }</td>
					<td>
						<div class="button-group">
							<a class="button border-main" href="javascript:void(0)" onclick="return edit(${tp.id})">
								<span class="icon-edit"></span> 修改
							</a> 
							<a class="button border-red" href="javascript:void(0)" onclick="return del(${tp.id },1,1)">
								<span class="icon-trash-o"></span> 删除
							</a>
						</div>
					</td>
				</tr>
				</c:forEach>
				</c:if>
				<tr>
					<td colspan="8"><div class="pagelist">
							<a href="">首页</a><a href="">上一页</a> <a href="">下一页</a><a href="">尾页</a>
						</div>
					</td>
				</tr>
			</table>
  </div>
</form>
<script type="text/javascript">
// 修改
function edit(id){
	window.location="${pageContext.request.contextPath }/topic_vieweditTopic?id="+id;
}

//单个删除
function del(id,mid,iscid){
	if(confirm("您确定要删除吗?")){
		/* $("#listform").submit(); */
		window.location="${pageContext.request.contextPath }/topic_deleteTopic?id="+id;
	}
}}} // 没有影响  不知道为什么报错  
</script>
</body>
</html>