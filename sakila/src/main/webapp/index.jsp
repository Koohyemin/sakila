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
	<br>
		<h3 class="text-center text-info">테이블 상세보기</h3>
			<ol class="list-group">
				<li class="list-group-item list-group-item-dark text-center"><a href="<%=request.getContextPath()%>/storeList.jsp" class="text-dark">Store List</a></li>
				<li class="list-group-item list-group-item-dark text-center"><a href="<%=request.getContextPath()%>/staffList.jsp" class="text-dark">Staff List</a></li>
			</ol>
		<h3 class="text-center text-info">뷰 상세보기</h3>
			<ol class="list-group">
				<li class="list-group-item list-group-item-dark text-center"><a href="<%=request.getContextPath()%>/actorInfoList.jsp" class="text-dark">actorInfoList</a></li>
				<li class="list-group-item list-group-item-dark text-center"><a href="<%=request.getContextPath()%>/customerListView.jsp" class="text-dark">customerList</a></li>
				<li class="list-group-item list-group-item-dark text-center"><a href="<%=request.getContextPath()%>/filmListView.jsp" class="text-dark">filmList</a></li>
				<li class="list-group-item list-group-item-dark text-center"><a href="<%=request.getContextPath()%>/nicerButSlowerFilmList.jsp" class="text-dark">nicerButSlowerFilmList</a></li>
				<li class="list-group-item list-group-item-dark text-center"><a href="<%=request.getContextPath()%>/salesByFilmCategory.jsp" class="text-dark">salesByFilmCategory</a></li>
				<li class="list-group-item list-group-item-dark text-center"><a href="<%=request.getContextPath()%>/salesByStore.jsp" class="text-dark">salesByStore</a></li>
				<li class="list-group-item list-group-item-dark text-center"><a href="<%=request.getContextPath()%>/staffListView.jsp" class="text-dark">staffList</a></li>
			</ol>
		<h3 class="text-center text-info">프로시저</h3>
			<ol class="list-group">
				<li class="list-group-item list-group-item-dark text-center"><a href="<%=request.getContextPath()%>/filmInStock.jsp" class="text-dark">filmInStock</a></li>
				<li class="list-group-item list-group-item-dark text-center"><a href="<%=request.getContextPath()%>/filmNotInStock.jsp" class="text-dark">filmNotInStock</a></li>
				<li class="list-group-item list-group-item-dark text-center"><a href="<%=request.getContextPath()%>/rewardsReport.jsp" class="text-dark">rewardsReport</a></li>
			</ol>
		<h3 class="text-center text-info">상세 검색</h3>
			<ol class="list-group">
				<li class="list-group-item list-group-item-dark text-center"><a href="<%=request.getContextPath()%>/filmSearchForm.jsp" class="text-dark">필름 상세검색</a></li>
			</ol>
	</div>
</body>
</html>