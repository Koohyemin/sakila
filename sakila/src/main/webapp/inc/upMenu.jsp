<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 스킨 -->
<div class="container-fluid" style="height:300px; background-image:url('<%=request.getContextPath()%>/image/index3.jpg'); background-repeat : no-repeat;background-size : cover;">
	<br><br><br><br><br>
		<h1 class="text-center">
			<a href="<%=request.getContextPath()%>/home.jsp" style="text-decoration:none; vertical-align: middle; color:#FFFFFF;">SAKILA DVD</a>
		</h1>
</div>
<!-- 스킨 끝 -->
<!-- 다른페이지의 부분으로 사용되는 페이지 -->
<div class="container-fluid">
	<ul class="nav nav-tabs nav-justified">
		<li class="nav-item">
			<a href="<%=request.getContextPath()%>/home.jsp" class="nav-link text-secondary"><b>HOME</b></a>
		</li>
		<li class="nav-item">
			<a href="<%=request.getContextPath()%>/searchDetail/filmSearchForm.jsp" class="nav-link text-secondary"><b>영화 리스트 / 상세 검색</b></a>
		</li>
		<li class="nav-item">
	         <a href="<%=request.getContextPath()%>/view/actorInfoList.jsp" class="nav-link text-secondary">
	            <b>배우별 출연영화 검색</b>
	         </a>
        </li>
		
		<li class="nav-item">
			<a href="<%=request.getContextPath()%>/procedure/filmInStock.jsp" class="nav-link text-secondary"><b>인벤토리 검색</b></a>
		</li>
		<li class="nav-item">
			<a href="<%=request.getContextPath()%>/table/storeList.jsp" class="nav-link text-secondary"><b>매장 정보</b></a>
		</li>
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle text-secondary" href="#" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><b>직원 시스템</b></a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="<%=request.getContextPath()%>/table/staffList.jsp">직원 로그인</a>
					<a class="dropdown-item" href="<%=request.getContextPath()%>/table/staffList.jsp">직원 목록</a>
					<a class="dropdown-item" href="<%=request.getContextPath()%>/view/customerListView.jsp">고객 목록</a>
					<a class="dropdown-item" href="<%=request.getContextPath()%>/view/salesByStore.jsp">매출 관리</a>
					<a class="dropdown-item" href="<%=request.getContextPath()%>/searchDetail/rentalSearchForm.jsp">대여 정보 상세 검색</a>
					<a class="dropdown-item" href="<%=request.getContextPath()%>/sakila/procedure/filmNotInStock.jsp">대여 중인 영화 검색</a>
					<a class="dropdown-item" href="<%=request.getContextPath()%>/procedure/rewardsReport.jsp">구매 횟수/금액별 고객 검색</a>
					<a class="dropdown-item" href="<%=request.getContextPath()%>/stats/statsData.jsp">통계 데이터</a>
				</div>
		</li>
	</ul>
</div>