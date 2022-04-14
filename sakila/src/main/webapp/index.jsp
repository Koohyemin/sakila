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
				<li class="list-group-item list-group-item-info text-center"><a href="<%=request.getContextPath()%>/table/storeList.jsp" class="text-dark">매장 목록</a></li>
				<li class="list-group-item list-group-item-warning text-center"><a href="<%=request.getContextPath()%>/table/staffList.jsp" class="text-dark">직원 목록</a></li>
			</ol>
		<h3 class="text-center text-info">뷰 상세보기</h3>
			<ol class="list-group">
				<li class="list-group-item list-group-item-info text-center"><a href="<%=request.getContextPath()%>/view/actorInfoList.jsp" class="text-dark">배우별 출연 영화 목록</a></li>
				<li class="list-group-item list-group-item-warning text-center"><a href="<%=request.getContextPath()%>/view/customerListView.jsp" class="text-dark">고객 목록</a></li>
				<li class="list-group-item list-group-item-info text-center"><a href="<%=request.getContextPath()%>/view/filmListView.jsp" class="text-dark">영화 목록</a></li>
				<li class="list-group-item list-group-item-warning text-center"><a href="<%=request.getContextPath()%>/view/nicerButSlowerFilmList.jsp" class="text-dark">영화 목록(nicerButSlower)</a></li>
				<li class="list-group-item list-group-item-info text-center"><a href="<%=request.getContextPath()%>/view/salesByFilmCategory.jsp" class="text-dark">장르별 총매출</a></li>
				<li class="list-group-item list-group-item-warning text-center"><a href="<%=request.getContextPath()%>/view/salesByStore.jsp" class="text-dark">매장별 총매출</a></li>
				<li class="list-group-item list-group-item-info text-center"><a href="<%=request.getContextPath()%>/view/staffListView.jsp" class="text-dark">직원 목록</a></li>
			</ol>
		<h3 class="text-center text-info">프로시저</h3>
			<ol class="list-group">
				<li class="list-group-item list-group-item-info text-center"><a href="<%=request.getContextPath()%>/procedure/filmInStock.jsp" class="text-dark">영화 재고 검색</a></li>
				<li class="list-group-item list-group-item-warning text-center"><a href="<%=request.getContextPath()%>/procedure/filmNotInStock.jsp" class="text-dark">대여 중인 영화 검색</a></li>
				<li class="list-group-item list-group-item-info text-center"><a href="<%=request.getContextPath()%>/procedure/rewardsReport.jsp" class="text-dark">조건달성 고객 검색</a></li>
			</ol>
		<h3 class="text-center text-info">상세 검색</h3>
			<ol class="list-group">
				<li class="list-group-item list-group-item-info text-center"><a href="<%=request.getContextPath()%>/searchDetail/filmSearchForm.jsp" class="text-dark">영화 상세검색</a></li>
				<li class="list-group-item list-group-item-warning text-center"><a href="<%=request.getContextPath()%>/searchDetail/rentalSearchForm.jsp" class="text-dark">대여 정보 상세검색</a></li>
			</ol>
		<h3 class="text-center text-info">통계 데이터</h3>
			<ol class="list-group">
				<li class="list-group-item list-group-item-info text-center"><a href="<%=request.getContextPath()%>/stats/statsData.jsp" class="text-dark">통계 데이터 리스트</a></li>
			</ol>
	</div>
	<br>
</body>
</html>