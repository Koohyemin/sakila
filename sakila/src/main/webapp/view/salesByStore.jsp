<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "vo.*" %>
<%
	SalesByStoreDao salesByStoreDao = new SalesByStoreDao();
	StatsDataDao statsDataDao = new StatsDataDao();
	SalesByFilmCategoryDao salesByFilmCategoryDao = new SalesByFilmCategoryDao();
	// 1. 매장별 총 매출
	List<SalesByStore> list = salesByStoreDao.selectSalesByStore();
	// 2. 매장 월별 매출
	List<Map<String, Object>> monthByStore = statsDataDao.monthByStore();
	// 3. 매장 요일별 매출
	List<Map<String, Object>> dayOfWeekByStore = statsDataDao.dayOfWeekByStore();
	// 4. 매장 시간대별 매출
	List<Map<String, Object>> timeAmountByStore = statsDataDao.timeAmountByStore();
	// 5. 고객별 매출 데이터(TOP10)
	List<Map<String, Object>> amountByCustomer = statsDataDao.amountByCustomer();
	// 6. 비활동 고객별 매출 데이터(TOP10)
	List<Map<String, Object>> amountByZeroActiveCustomer = statsDataDao.amountByZeroActiveCustomer();
	// 7. 영화별 매출 데이터(TOP10)
	List<Map<String, Object>> amountByFilm = statsDataDao.amountByFilm();
	// 8. 장르별 매출 데이터
	List<SalesByFilmCategory> salesByFilmCategory = salesByFilmCategoryDao.selectSalesByFilmCategory();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>salesByStore</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
   <jsp:include page="/inc/upMenu.jsp"></jsp:include>
   <div class="jumbotron">
      <h1>매출 관리(통계 데이터)</h1>
   </div><br><br>
   
<div class="container-fluid">
	<div class="row">
	<div class="col-sm-3">
		<h4 class="text-center">매출관리 데이터 바로가기</h4>
		<ul class="list-group text-center">
			<li class="list-group-item"><a href="#1" class="text-dark">1. 매장별 매출</a></li>
			<li class="list-group-item"><a href="#2" class="text-dark">2. 매장 월별 매출</a></li>
			<li class="list-group-item"><a href="#3" class="text-dark">3. 매장 요일별 매출</a></li>
			<li class="list-group-item"><a href="#4" class="text-dark">4. 매장 시간대별 매출</a></li>
			<li class="list-group-item"><a href="#5" class="text-dark">5. 고객별 매출(TOP10)</a></li>
			<li class="list-group-item"><a href="#6" class="text-dark">6. 휴먼 고객 매출(TOP10)</a></li>
			<li class="list-group-item"><a href="#7" class="text-dark">7. 영화별 매출(TOP10)</a></li>
			<li class="list-group-item"><a href="#8" class="text-dark">8. 카테고리별 매출</a></li>
		</ul>
	</div>
	<div class="col-sm-9">
		<h1 id="1">1. 매장별 매출</h1>
		<table class="table">
			<thead  class="text-center text-light" style="background:#00004B;">
				<tr>
					<th>매장 주소</th>
					<th>매니저</th>
					<th>총 매출</th>
				</tr>
			</thead>
			<%
				for(SalesByStore s : list) {
			%>
					<tbody class="text-center">
						<tr>
							<td><%=s.getStore()%></td>
							<td><%=s.getManager()%></td>
							<td><%=s.getTotalSales()%></td>
						</tr>
					</tbody>
			<%
				}
			%>
		</table>
		<h1 id="2">2. 매장 월별 매출</h1>
		<table class="table">
			<thead class="text-center text-light" style="background:#00004B;">
				<tr>
					<th>매장 번호</th>
					<th>연도-월</th>
					<th>매출액</th>
				</tr>
			</thead>
			<%
				for(Map<String, Object> m : monthByStore) {
			%>
					<tbody class="text-center">
						<tr>
							<td><%=m.get("storeId")%></td>
							<td><%=m.get("yearMonth")%></td>
							<td><%=m.get("amount")%></td>
						</tr>
					</tbody>
			<%
				}
			%>
		</table>
		
		<h1 id="3">3. 매장 요일별 매출</h1>
		<table class="table">
			<thead class="text-center text-light" style="background:#00004B;">
				<tr>
					<th>매장 번호</th>
					<th>요일</th>
					<th>매출액</th>
				</tr>
			</thead>
			<%
				for(Map<String, Object> m : dayOfWeekByStore) {
			%>
					<tbody class="text-center">
						<tr>
							<td><%=m.get("storeId")%></td>
							<td><%=m.get("dayOfWeek")%></td>
							<td><%=m.get("amount")%></td>
						</tr>
					</tbody>
			<%
				}
			%>
		</table>
		<h1 id="4">4. 매장 시간대별 매출</h1>
		<table class="table">
			<thead class="text-center text-light" style="background:#00004B;">
				<tr>
					<th>시간대</th>
					<th>매출액</th>
				</tr>
			</thead>
			<%
				for(Map<String, Object> m : timeAmountByStore) {
			%>
					<tbody class="text-center">
						<tr>
							<td><%=m.get("paymentHour")%></td>
							<td><%=m.get("amount")%></td>
						</tr>
					</tbody>
			<%
				}
			%>
		</table>
		<h1 id="5">5. 고객별 매출(TOP10)</h1>
		<table class="table">
			<thead class="text-center text-light" style="background:#00004B;">
				<tr>
					<th>고객 아이디</th>
					<th>고객 이름</th>
					<th>대여 횟수</th>
					<th>총 지불액</th>
				</tr>
			</thead>
			<%
				for(Map<String, Object> m : amountByCustomer) {
			%>
					<tbody>
						<tr class="text-center">
							<td><%=m.get("customerId")%></td>
							<td><%=m.get("name")%></td>
							<td><%=m.get("cnt") %></td>
							<td><%=m.get("total")%></td>
						</tr>
					</tbody>
			<%
				}
			%>
		</table>
		<h1 id="6">6. 휴먼 고객 매출(TOP10)</h1>
		<table class="table">
			<thead class="text-center text-light" style="background:#00004B;">
				<tr>
					<th>고객 번호</th>
					<th>이름</th>
					<th>이용액 합계</th>
				</tr>
			</thead>
			<%
				for(Map<String, Object> m : amountByZeroActiveCustomer) {
			%>
					<tbody class="text-center">
						<tr>
							<td><%=m.get("customerId")%></td>
							<td><%=m.get("cName")%></td>
							<td><%=m.get("amount")%></td>
						</tr>
					</tbody>
			<%
				}
			%>
		</table>
		<h1 id="7">7. 영화별 매출(TOP10)</h1>
		<table class="table">
			<thead class="text-center text-light" style="background:#00004B;">
				<tr>
					<th>영화 번호</th>
					<th>제목</th>
					<th>총 매출액</th>
				</tr>
			</thead>
			<%
				for(Map<String, Object> m : amountByFilm) {
			%>
					<tbody class="text-center">
						<tr>
							<td><%=m.get("filmId")%></td>
							<td><%=m.get("title")%></td>
							<td><%=m.get("amount")%></td>
						</tr>
					</tbody>
			<%
				}
			%>
		</table>
		<h1 id="8">8. 카테고리별 매출</h1>
		<table class="table">
		<thead class="text-center text-light" style="background:#00004B;">
			<tr>
				<th>장르</th>
				<th>총 매출</th>
			</tr>
		</thead>
		<%
			for(SalesByFilmCategory s : salesByFilmCategory) {
		%>
				<tbody class="text-center">
					<tr>
						<td><%=s.getCategory()%></td>
						<td><%=s.getTotalSales()%></td>
					</tr>
				</tbody>
		<%
			}
		%>
	</table>
		</div>
	</div>
</div>
	<jsp:include page="/inc/footer.jsp"></jsp:include>
</body>
</html>