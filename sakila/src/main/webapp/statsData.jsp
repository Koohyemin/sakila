<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.*" %>
<%
	StatsDataDao statsDataDao = new StatsDataDao();

	// 1. customer별 총 amount
	List<Map<String, Object>> amountByCustomer = statsDataDao.amountByCustomer();
	
	// 2. rental_rate별 film_count
	List<Map<String, Object>> filmCountByRentalRate = statsDataDao.filmCountByRentalRate();
	
	// 3. rating별 film_ count
	List<Map<String, Object>> filmCountByRating = statsDataDao.filmCountByRating();
	
	// 4. language별 film_count
	List<Map<String, Object>> filmCountByLanguage = statsDataDao.filmCountByLanguage();
	
	// 5. customer별 rental_count(상위 1명)
	Map<String, Object> bestRentalCustomer = statsDataDao.bestRentalCustomer();
	
	// 6. actor별 film 출연 수 
	List<Map<String, Object>> filmCountByActor = statsDataDao.filmCountByActor();
	
	// 7. store별 film_count
	List<Map<String, Object>> inventoryCountByStore = statsDataDao.inventoryCountByStore();
	
	// 8. staff별 rental_count
	List<Map<String, Object>> rentalCountByStaff = statsDataDao.rentalCountByStaff();
	
	// 9. length별 film_count(구간, 기준을 정해서)
	List<Map<String, Object>> filmCountByLength = statsDataDao.filmCountByLength();
	
	// 10. customer별 store 이용 횟수
	List<Map<String, Object>>storeByCustomer = statsDataDao.storeByCustomer();
	
	// 11. film별 총amount
	List<Map<String, Object>> amountByFilm = statsDataDao.amountByFilm();
	
	// 12. film별 rental_count
	List<Map<String, Object>> rentalCountByFilm = statsDataDao.rentalCountByFilm();
	
	// 13. inventory별 rental_count
	List<Map<String, Object>> rentalCountByInventory = statsDataDao.rentalCountByInventory();
	
	// 14. actor별 총 amount
	List<Map<String, Object>> amountByActor = statsDataDao.amountByActor();
	
	// 15. country별 customer_count
	List<Map<String, Object>> customerCountByCountry = statsDataDao.customerCountByCountry();
	
	// 16. category별 length 평균
	List<Map<String, Object>> lengthAvgByCategory = statsDataDao.lengthAvgByCategory();
	
	// 17. active가 0인 customer별 총amount
	List<Map<String, Object>> amountByZeroActiveCustomer = statsDataDao.amountByZeroActiveCustomer();
	// 18. store별 요일별 매출
	List<Map<String, Object>> dayOfWeekByStore = statsDataDao.dayOfWeekByStore();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>statsData</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container-fluid">
	<div class="row">
	<!-- 통계데이터 바로가기 리스트 -->
	<div class="col-sm-3">
	</div>
	<div class="col-sm-3 position-fixed">
		<h2 class="text-center text-info">통계 데이터 바로가기</h2>
		<ul class="list-group text-center">
			<li class="list-group-item"><a href="#1" class="text-dark">1. 고객 별 매출(TOP10)</a></li>
			<li class="list-group-item"><a href="#2" class="text-dark">2. 대여료 별 영화 개수</a></li>
			<li class="list-group-item"><a href="#3" class="text-dark">3. 등급 별 영화 개수</a></li>
			<li class="list-group-item"><a href="#4" class="text-dark">4. 언어 별 영화 개수</a></li>
			<li class="list-group-item"><a href="#5" class="text-dark">5. 고객 별 대여 개수(BEST1)</a></li>
			<li class="list-group-item"><a href="#6" class="text-dark">6. 배우 별 영화 출연 횟수(TOP10)</a></li>
			<li class="list-group-item"><a href="#7" class="text-dark">7. 매장 별 재고 수</a></li>
			<li class="list-group-item"><a href="#8" class="text-dark">8. 직원 별 대여 횟수</a></li>
			<li class="list-group-item"><a href="#9" class="text-dark">9. 길이(분) 별 영화 개수</a></li>
			<li class="list-group-item"><a href="#10" class="text-dark">10. 고객 별 매장 이용 횟수(TOP10)</a></li>
			<li class="list-group-item"><a href="#11" class="text-dark">11. 영화 별 총 매출(TOP10)</a></li>
			<li class="list-group-item"><a href="#12" class="text-dark">12. 영화별 대여 횟수(TOP10)</a></li>
			<li class="list-group-item"><a href="#13" class="text-dark">13. 인벤토리 별 대여 횟수(TOP10)</a></li>
			<li class="list-group-item"><a href="#14" class="text-dark">14. actor 별 총 매출(TOP10)</a></li>
			<li class="list-group-item"><a href="#15" class="text-dark">15. 국가 별 고객 수(TOP10)</a></li>
			<li class="list-group-item"><a href="#16" class="text-dark">16. 장르 별 영화길이 평균</a></li>
			<li class="list-group-item"><a href="#17" class="text-dark">17. 비활성화 고객의 이용금액 총 합계(TOP10)</a></li>
			<li class="list-group-item"><a href="#18" class="text-dark">18. 매장 요일 별 매출액</a></li>
		</ul>
	</div>
	<!-- 통계 데이터 테이블 -->
	<div class="col-sm-9">
		<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-outline-secondary">index</a>
		<a name="1"></a>
		<h1 class="text-center text-info">1. 고객 별 매출(TOP10)</h1>
		<table class="table table-dark table-striped" name="A">
			<tr class="text-center text-info">
				<th>고객 아이디</th>
				<th>고객 이름</th>
				<th>대여 횟수</th>
				<th>총 지불액</th>
			</tr>
			<%
				for(Map<String, Object> m : amountByCustomer) {
			%>
					<tr class="text-center">
						<td><%=m.get("customerId")%></td>
						<td><%=m.get("name")%></td>
						<td><%=m.get("cnt") %></td>
						<td><%=m.get("total")%></td>
					</tr>
			<%
				}
			%>
		</table>
		<a name="2"></a>
		<h1 class="text-center text-info">2. 대여료 별 영화 개수</h1>
		<table class="table table-dark table-striped">
			<tr class="text-center text-info">
				<th>대여료</th>
				<th>영화 개수</th>
			</tr>
			<%
				for(Map<String, Object> m : filmCountByRentalRate) {
			%>
					<tr class="text-center">
						<td><%=m.get("rentalRate")%></td>
						<td><%=m.get("cnt")%></td>
					</tr>
			<%
				}
			%>
		</table>
		<a name="3"></a>
		<h1 class="text-center text-info">3. 등급 별 영화 개수</h1>
		<table class="table table-dark table-striped">
			<tr class="text-center text-info">
				<th>등급</th>
				<th>영화 개수</th>
			</tr>
			<%
				for(Map<String, Object> m : filmCountByRating) {
			%>
					<tr class="text-center">
						<td><%=m.get("rating")%></td>
						<td><%=m.get("cnt")%></td>
					</tr>
			<%
				}
			%>
		</table>
		<a name="4"></a>
		<h1 class="text-center text-info">4. 언어 별 영화 개수</h1>
		<table class="table table-dark table-striped">
			<tr class="text-center text-info">
				<th>언어</th>
				<th>영화 개수</th>
			</tr>
			<%
				for(Map<String, Object> m : filmCountByLanguage) {
			%>
					<tr class="text-center">
						<td><%=m.get("name")%></td>
						<td><%=m.get("cnt")%></td>
					</tr>
			<%
				}
			%>
		</table>
		<a name="5"></a>
		<h1 class="text-center text-info">5. 고객 별 대여 개수(BEST1)</h1>
		<table class="table table-dark table-striped">
			<tr class="text-center text-info">
				<th>고객번호</th>
				<th>지점번호</th>
				<th>이름</th>
				<th>이메일</th>
				<th>주소번호</th>
				<th>활동여부</th>
				<th>생성날짜</th>
				<th>업데이트일</th>
			</tr>
			<tr class="text-center">
				<td><%=bestRentalCustomer.get("customerId")%></td>
				<td><%=bestRentalCustomer.get("storeId")%></td>
				<td><%=bestRentalCustomer.get("cName")%></td>
				<td><%=bestRentalCustomer.get("email")%></td>
				<td><%=bestRentalCustomer.get("addressId")%></td>
				<td><%=bestRentalCustomer.get("active")%></td>
				<td><%=bestRentalCustomer.get("createDate")%></td>
				<td><%=bestRentalCustomer.get("lastUpdate")%></td>
			</tr>
		</table>
		<a name="6"></a>
		<h1 class="text-center text-info">6. 배우 별 영화 출연 횟수(TOP10)</h1>
		<table class="table table-dark table-striped">
			<tr class="text-center text-info">
				<th>배우 번호</th>
				<th>이름</th>
				<th>출연횟수</th>
			</tr>
			<%
				for(Map<String, Object> m : filmCountByActor) {
			%>
					<tr class="text-center">
						<td><%=m.get("actorId")%></td>
						<td><%=m.get("actorName")%></td>
						<td><%=m.get("cnt")%></td>
					</tr>
			<%
				}
			%>
		</table>
		<a name="7"></a>
		<h1 class="text-center text-info">7. 매장 별 재고 수</h1>
		<table class="table table-dark table-striped">
			<tr class="text-center text-info">
				<th>매장 번호</th>
				<th>재고 개수</th>
			</tr>
			<%
				for(Map<String, Object> m : inventoryCountByStore) {
			%>
					<tr class="text-center">
						<td><%=m.get("storeId")%></td>
						<td><%=m.get("cnt")%></td>
					</tr>
			<%
				}
			%>
		</table>
		<a name="8"></a>
		<h1 class="text-center text-info">8. 직원 별 대여 횟수</h1>
		<table class="table table-dark table-striped">
			<tr class="text-center text-info">
				<th>직원 번호</th>
				<th>이름</th>
				<th>대여 횟수</th>
			</tr>
			<%
				for(Map<String, Object> m : rentalCountByStaff) {
			%>
					<tr class="text-center">
						<td><%=m.get("staffId")%></td>
						<td><%=m.get("staffName")%></td>
						<td><%=m.get("cnt")%></td>
					</tr>
			<%
				}
			%>
		</table>
		<a name="9"></a>
		<h1 class="text-center text-info">9. 길이(분) 별 영화 개수</h1>
		<table class="table table-dark table-striped">
			<tr class="text-center text-info">
				<th>길이</th>
				<th>영화 개수</th>
			</tr>
			<%
				for(Map<String, Object> m : filmCountByLength) {
			%>
					<tr class="text-center">
						<td><%=m.get("length")%></td>
						<td><%=m.get("cnt")%></td>
					</tr>
			<%
				}
			%>
		</table>
		<a name="10"></a>
		<h1 class="text-center text-info">10. 고객 별 매장 이용 횟수(TOP10)</h1>
		<table class="table table-dark table-striped">
			<tr class="text-center text-info">
				<th>고객 번호</th>
				<th>매장 번호</th>
				<th>이용 횟수</th>
			</tr>
			<%
				for(Map<String, Object> m : storeByCustomer) {
			%>
					<tr class="text-center">
						<td><%=m.get("customerId")%></td>
						<td><%=m.get("storeId")%></td>
						<td><%=m.get("cnt")%></td>
					</tr>
			<%
				}
			%>
		</table>
		<a name="11"></a>
		<h1 class="text-center text-info">11. 영화 별 총 매출(TOP10)</h1>
		<table class="table table-dark table-striped">
			<tr class="text-center text-info">
				<th>영화 번호</th>
				<th>제목</th>
				<th>총 매출액</th>
			</tr>
			<%
				for(Map<String, Object> m : amountByFilm) {
			%>
					<tr class="text-center">
						<td><%=m.get("filmId")%></td>
						<td><%=m.get("title")%></td>
						<td><%=m.get("amount")%></td>
					</tr>
			<%
				}
			%>
		</table>
		<a name="12"></a>
		<h1 class="text-center text-info">12. 영화별 대여 횟수(TOP10)</h1>
		<table class="table table-dark table-striped">
			<tr class="text-center text-info">
				<th>영화 번호</th>
				<th>제목</th>
				<th>대여 횟수</th>
			</tr>
			<%
				for(Map<String, Object> m : rentalCountByFilm) {
			%>
					<tr class="text-center">
						<td><%=m.get("filmId")%></td>
						<td><%=m.get("title")%></td>
						<td><%=m.get("cnt")%></td>
					</tr>
			<%
				}
			%>
		</table>
		<a name="13"></a>
		<h1 class="text-center text-info">13. 인벤토리 별 대여 횟수(TOP10)</h1>
		<table class="table table-dark table-striped">
			<tr class="text-center text-info">
				<th>인벤토리 번호</th>
				<th>대여 횟수</th>
			</tr>
			<%
				for(Map<String, Object> m : rentalCountByInventory) {
			%>
					<tr class="text-center">
						<td><%=m.get("inventoryId")%></td>
						<td><%=m.get("cnt")%></td>
					</tr>
			<%
				}
			%>
		</table>
		<a name="14"></a>
		<h1 class="text-center text-info">14. actor 별 총 매출(TOP10)</h1>
		<table class="table table-dark table-striped">
			<tr class="text-center text-info">
				<th>배우 번호</th>
				<th>이름</th>
				<th>총 매출액</th>
			</tr>
			<%
				for(Map<String, Object> m : amountByActor) {
			%>
					<tr class="text-center">
						<td><%=m.get("actorId")%></td>
						<td><%=m.get("actorName")%></td>
						<td><%=m.get("amount")%></td>
					</tr>
			<%
				}
			%>
		</table>
		<a name="15"></a>
		<h1 class="text-center text-info">15. 국가 별 고객 수(TOP10)</h1>
		<table class="table table-dark table-striped">
			<tr class="text-center text-info">
				<th>국가 번호</th>
				<th>국가</th>
				<th>고객 수</th>
			</tr>
			<%
				for(Map<String, Object> m : customerCountByCountry) {
			%>
					<tr class="text-center">
						<td><%=m.get("countryId")%></td>
						<td><%=m.get("country")%></td>
						<td><%=m.get("cnt")%></td>
					</tr>
			<%
				}
			%>
		</table>
		<a name="16"></a>
		<h1 class="text-center text-info">16. 장르 별 영화길이 평균</h1>
		<table class="table table-dark table-striped">
			<tr class="text-center text-info">
				<th>장르 번호</th>
				<th>장르</th>
				<th>길이 평균</th>
			</tr>
			<%
				for(Map<String, Object> m : lengthAvgByCategory) {
			%>
					<tr class="text-center">
						<td><%=m.get("categoryId")%></td>
						<td><%=m.get("categoryName")%></td>
						<td><%=m.get("lengthAvg")%></td>
					</tr>
			<%
				}
			%>
		</table>
		<a name="17"></a>
		<h1 class="text-center text-info">17. 비활성화 고객의 이용금액 총 합계(TOP10)</h1>
		<table class="table table-dark table-striped">
			<tr class="text-center text-info">
				<th>고객 번호</th>
				<th>이름</th>
				<th>이용액 합계</th>
			</tr>
			<%
				for(Map<String, Object> m : amountByZeroActiveCustomer) {
			%>
					<tr class="text-center">
						<td><%=m.get("customerId")%></td>
						<td><%=m.get("cName")%></td>
						<td><%=m.get("amount")%></td>
					</tr>
			<%
				}
			%>
		</table>
		<a name="18"></a>
		<h1 class="text-center text-info">18. 매장 요일 별 매출액</h1>
		<table class="table table-dark table-striped">
			<tr class="text-center text-info">
				<th>매장 번호</th>
				<th>요일</th>
				<th>매출액</th>
			</tr>
			<%
				for(Map<String, Object> m : dayOfWeekByStore) {
			%>
					<tr class="text-center">
						<td><%=m.get("storeId")%></td>
						<td><%=m.get("dayOfWeek")%></td>
						<td><%=m.get("amount")%></td>
					</tr>
			<%
				}
			%>
		</table>
	</div>
	</div>
	</div>
</body>
</html>