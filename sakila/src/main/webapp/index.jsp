<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
	<h1 class="text-center text-info">INDEX</h1>
	<ol class="list-group">
		<li class="list-group-item list-group-item-dark text-center"><a href="<%=request.getContextPath()%>/storeList.jsp">Store List</a></li>
		<li class="list-group-item list-group-item-dark text-center"><a href="<%=request.getContextPath()%>/staffList.jsp">Staff List</a></li>
	</ol>
</body>
	</div>
</html>