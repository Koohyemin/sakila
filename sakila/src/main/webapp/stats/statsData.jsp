<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.*" %>
<%
	StatsDataDao statsDataDao = new StatsDataDao();
	
	// 2. rental_rate별 film_count
	List<Map<String, Object>> filmCountByRentalRate = statsDataDao.filmCountByRentalRate();
	
	// 3. rating별 film_ count
	List<Map<String, Object>> filmCountByRating = statsDataDao.filmCountByRating();
	
	// 4. language별 film_count
	List<Map<String, Object>> filmCountByLanguage = statsDataDao.filmCountByLanguage();
	
	// 5. customer별 rental_count(상위 1명)
	Map<String, Object> bestRentalCustomer = statsDataDao.bestRentalCustomer();
	
	
	// 7. store별 film_count
	List<Map<String, Object>> inventoryCountByStore = statsDataDao.inventoryCountByStore();
	
	// 8. staff별 rental_count
	List<Map<String, Object>> rentalCountByStaff = statsDataDao.rentalCountByStaff();
	
	// 9. length별 film_count(구간, 기준을 정해서)
	List<Map<String, Object>> filmCountByLength = statsDataDao.filmCountByLength();
	
	// 10. customer별 store 이용 횟수
	List<Map<String, Object>>storeByCustomer = statsDataDao.storeByCustomer();
	
	
	// 13. inventory별 rental_count
	List<Map<String, Object>> rentalCountByInventory = statsDataDao.rentalCountByInventory();
	
	// 14. rental기간별 inventory_count
	List<Map<String, Object>> inventoryCountByrentalPeriod = statsDataDao.inventoryCountByrentalPeriod();
	
	// 15. country별 customer_count
	List<Map<String, Object>> customerCountByCountry = statsDataDao.customerCountByCountry();
	
	// 16. category별 length 평균
	List<Map<String, Object>> lengthAvgByCategory = statsDataDao.lengthAvgByCategory();
	
	
	// 21. country별 data
	List<Map<String, Object>> dataByCountry = statsDataDao.dataByCountry();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>statsData</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/inc/upMenu.jsp"></jsp:include>
	<div class="container-fluid">
	<div class="row">
	<!-- 통계데이터 바로가기 리스트 -->
	<div class="col-sm-3">
	</div>
	<div class="col-sm-3 position-fixed" style="overflow-y:scroll; overflow-x:hidden; width:600px; height:100%;">
		<br>
		<h4 class="text-center text-info">통계 데이터 바로가기</h4>
			<li class="list-group-item"><a href="#2" class="text-dark">2. 대여료별 영화 개수</a></li>
			<li class="list-group-item"><a href="#3" class="text-dark">3. 등급별 영화 개수</a></li>
			<li class="list-group-item"><a href="#4" class="text-dark">4. 언어별 영화 개수</a></li>
			<li class="list-group-item"><a href="#5" class="text-dark">5. 고객별 대여 개수(BEST1)</a></li>
			<li class="list-group-item"><a href="#7" class="text-dark">7. 매장별 재고 수</a></li>
			<li class="list-group-item"><a href="#8" class="text-dark">8. 직원별 대여 횟수</a></li>
			<li class="list-group-item"><a href="#9" class="text-dark">9. 길이(분)별 영화 개수</a></li>
			<li class="list-group-item"><a href="#10" class="text-dark">10. 고객별 매장 이용 횟수(TOP10)</a></li>
			<li class="list-group-item"><a href="#13" class="text-dark">13. 인벤토리별 대여 횟수(TOP10)</a></li>
			<li class="list-group-item"><a href="#14" class="text-dark">14. 대여기간별 인벤토리 개수</a></li>
			<li class="list-group-item"><a href="#15" class="text-dark">15. 국가별 고객 수(TOP10)</a></li>
			<li class="list-group-item"><a href="#16" class="text-dark">16. 장르별 영화길이 평균</a></li>
			<li class="list-group-item"><a href="#17" class="text-dark">17. 비활성화 고객의 이용금액 총 합계(TOP10)</a></li>
			<li class="list-group-item"><a href="#21" class="text-dark">21. 나라별 데이터</a></li>
		</ul>
	</div>
	
	<!-- 통계 데이터 테이블 -->
	<div class="col-sm-9">
		<br><h1 class="text-center bg-dark text-light">통계데이터 리스트</h1> <br>
		<!-- index 바로가기 -->
		<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-link">index</a> 
		<h1 class="text-center text-info" id="2">2. 대여료별 영화 개수</h1>
		<table class="table">
			<thead class="thead-dark text-center">
				<tr>
					<th>대여료</th>
					<th>영화 개수</th>
				</tr>
			</thead>
			<%
				for(Map<String, Object> m : filmCountByRentalRate) {
			%>
					<tbody class="text-center">
						<tr>
							<td><%=m.get("rentalRate")%></td>
							<td><%=m.get("cnt")%></td>
						</tr>
					</tbody>
			<%
				}
			%>
		</table>
		<h1 class="text-center text-info" id="3">3. 등급별 영화 개수</h1>
		<table class="table">
			<thead class="thead-dark text-center">
				<tr>
					<th>등급</th>
					<th>영화 개수</th>
				</tr>
			</thead>
			<%
				for(Map<String, Object> m : filmCountByRating) {
			%>
					<tbody class="text-center">
						<tr>
							<td><%=m.get("rating")%></td>
							<td><%=m.get("cnt")%></td>
						</tr>
					</tbody>
			<%
				}
			%>
		</table>
		<h1 class="text-center text-info" id="4">4. 언어별 영화 개수</h1>
		<table class="table">
			<thead class="thead-dark text-center">
				<tr>
					<th>언어</th>
					<th>영화 개수</th>
				</tr>
			</thead>
			<%
				for(Map<String, Object> m : filmCountByLanguage) {
			%>
					<tbody class="text-center">
						<tr>
							<td><%=m.get("name")%></td>
							<td><%=m.get("cnt")%></td>
						</tr>
					</tbody>
			<%
				}
			%>
		</table>
		<h1 class="text-center text-info" id="5">5. 고객별 대여 개수(BEST1)</h1>
		<table class="table">
			<thead class="thead-dark text-center">
				<tr>
					<th>고객번호</th>
					<th>지점번호</th>
					<th>이름</th>
					<th>이메일</th>
					<th>주소번호</th>
					<th>활동여부</th>
					<th>생성날짜</th>
					<th>업데이트일</th>
				</tr>
			</thead>
				<tbody class="text-center">
					<tr>
						<td><%=bestRentalCustomer.get("customerId")%></td>
						<td><%=bestRentalCustomer.get("storeId")%></td>
						<td><%=bestRentalCustomer.get("cName")%></td>
						<td><%=bestRentalCustomer.get("email")%></td>
						<td><%=bestRentalCustomer.get("addressId")%></td>
						<td><%=bestRentalCustomer.get("active")%></td>
						<td><%=bestRentalCustomer.get("createDate")%></td>
						<td><%=bestRentalCustomer.get("lastUpdate")%></td>
					</tr>
			</tbody>
		</table>
		<h1 class="text-center text-info" id="7">7. 매장별 재고 수</h1>
		<table class="table">
			<thead class="thead-dark text-center">
				<tr>
					<th>매장 번호</th>
					<th>재고 개수</th>
				</tr>
			</thead>
			<%
				for(Map<String, Object> m : inventoryCountByStore) {
			%>
					<tbody class="text-center">
						<tr>
							<td><%=m.get("storeId")%></td>
							<td><%=m.get("cnt")%></td>
						</tr>
					</tbody>
			<%
				}
			%>
		</table>
		<h1 class="text-center text-info" id="8">8. 직원별 대여 횟수</h1>
		<table class="table">
			<thead class="thead-dark text-center">
				<tr>
					<th>직원 번호</th>
					<th>이름</th>
					<th>대여 횟수</th>
				</tr>
			</thead>
			<%
				for(Map<String, Object> m : rentalCountByStaff) {
			%>
					<tbody class="text-center">
						<tr>
							<td><%=m.get("staffId")%></td>
							<td><%=m.get("staffName")%></td>
							<td><%=m.get("cnt")%></td>
						</tr>
					</tbody>
			<%
				}
			%>
		</table>
		<h1 class="text-center text-info" id="9">9. 길이(분)별 영화 개수</h1>
		<table class="table">
			<thead class="thead-dark text-center">
				<tr>
					<th>길이</th>
					<th>영화 개수</th>
				</tr>
			</thead>
			<%
				for(Map<String, Object> m : filmCountByLength) {
			%>
					<tbody class="text-center">
						<tr>
							<td><%=m.get("filmLength")%></td>
							<td><%=m.get("cnt")%></td>
						</tr>
					</tbody>
			<%
				}
			%>
		</table>
		<h1 class="text-center text-info" id="10">10. 고객별 매장 이용 횟수(TOP10)</h1>
		<table class="table">
			<thead class="thead-dark text-center">
				<tr>
					<th>고객 번호</th>
					<th>매장 번호</th>
					<th>이용 횟수</th>
				</tr>
			</thead>
			<%
				for(Map<String, Object> m : storeByCustomer) {
			%>
					<tbody class="text-center">
						<tr>
							<td><%=m.get("customerId")%></td>
							<td><%=m.get("storeId")%></td>
							<td><%=m.get("cnt")%></td>
						</tr>
					</tbody>
			<%
				}
			%>
		</table>
		<h1 class="text-center text-info" id="14">14. 대여기간별 인벤토리 개수</h1>
		<table class="table">
			<thead class="thead-dark text-center">
				<tr>
					<th>대여 기간</th>
					<th>인벤토리 개수</th>
				</tr>
			</thead>
 			<%
				for(Map<String, Object> m : inventoryCountByrentalPeriod) {
			%>
					<tbody class="text-center">
						<tr>
							<td><%=m.get("rentalDate")%></td>
							<td><%=m.get("cnt")%></td>
						</tr>
					</tbody>
			<%
				}
			%>
		</table>
		<h1 class="text-center text-info" id="15">15. 국가별 고객 수(TOP10)</h1>
		<table class="table">
			<thead class="thead-dark text-center">
				<tr>
					<th>국가 번호</th>
					<th>국가</th>
					<th>고객 수</th>
				</tr>
			</thead>
			<%
				for(Map<String, Object> m : customerCountByCountry) {
			%>
					<tbody class="text-center">
						<tr>
							<td><%=m.get("countryId")%></td>
							<td><%=m.get("country")%></td>
							<td><%=m.get("cnt")%></td>
						</tr>
					</tbody>
			<%
				}
			%>
		</table>
		<h1 class="text-center text-info" id="16">16. 장르별 영화길이 평균</h1>
		<table class="table">
			<thead class="thead-dark text-center">
				<tr>
					<th>장르 번호</th>
					<th>장르</th>
					<th>영화 개수</th>
					<th>길이 평균</th>
				</tr>
			</thead>
			<%
				for(Map<String, Object> m : lengthAvgByCategory) {
			%>
					<tbody class="text-center">
						<tr>
							<td><%=m.get("categoryId")%></td>
							<td><%=m.get("categoryName")%></td>
							<td><%=m.get("filmCount")%></td>
							<td><%=m.get("lengthAvg")%></td>
						</tr>
					</tbody>
			<%
				}
			%>
		</table>

		<h1 class="text-center text-info" id="21">21. 나라별 데이터</h1>
		<table class="table">
			<thead class="thead-dark text-center">
				<tr>
					<th>나라</th>
					<th>도시 수</th>
					<th>고객 수</th>
					<th>대여 수</th>
				</tr>
			</thead>
			<%
				for(Map<String, Object> m : dataByCountry) {
			%>
					<tbody class="text-center">
						<tr>
							<td><%=m.get("country")%></td>
							<td><%=m.get("cityCnt")%></td>
							<td><%=m.get("cusCnt")%></td>
							<td><%=m.get("rentalCnt")%></td>
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