<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%--
	response.sendRedirect(request.getContextPath()+"/emp_list");
--%> 

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<c:redirect url="/topic_listAllType?currentPage=1"></c:redirect>