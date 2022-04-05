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
			<!-- 7개 view 리스트 -->
			<li class="list-group-item list-group-item-dark text-center"><a href="<%=request.getContextPath()%>/actorInfoList.jsp">actorInfoList(view)</a></li>
			<li class="list-group-item list-group-item-dark text-center"><a href="<%=request.getContextPath()%>/customerListView.jsp">customerList(view)</a></li>
			<li class="list-group-item list-group-item-dark text-center"><a href="<%=request.getContextPath()%>/filmListView.jsp">filmList(view)</a></li>
			<li class="list-group-item list-group-item-dark text-center"><a href="<%=request.getContextPath()%>/nicerButSlowerFilmList.jsp">nicerButSlowerFilmList(view)</a></li>
			<li class="list-group-item list-group-item-dark text-center"><a href="<%=request.getContextPath()%>/salesByFilmCategory.jsp">salesByFilmCategory(view)</a></li>
			<li class="list-group-item list-group-item-dark text-center"><a href="<%=request.getContextPath()%>/salesByStore.jsp">salesByStore(view)</a></li>
			<li class="list-group-item list-group-item-dark text-center"><a href="<%=request.getContextPath()%>/staffListView.jsp">staffList(view)</a></li>
			<!-- procedure 3개 결과 화면 -->
			<li class="list-group-item list-group-item-dark text-center"><a href="<%=request.getContextPath()%>/filmInStock.jsp">filmInStock</a></li>
			<li class="list-group-item list-group-item-dark text-center"><a href="<%=request.getContextPath()%>/filmNotInStock.jsp">filmNotInStock</a></li>
			<li class="list-group-item list-group-item-dark text-center"><a href="<%=request.getContextPath()%>/rewardsReport.jsp">rewardsReport</a></li>
		</ol>
	</div>
</body>
</html>