<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.time.*" %>
<%
	// storeId데이터가 입력되지 않았을때 default값을 -1로 지정
	int storeId = -1; 
	// storeId을 선택했다면 선택한 매장값 받아서 int로 형변환
	if(!request.getParameter("storeId").equals("")) { 
		storeId = Integer.parseInt(request.getParameter("storeId"));	
	}
	
	String customerName = request.getParameter("customerName");
	
	// rental_date 처음 발생일이 "2005-05-24"이므로 디폴트 값 "2005-05-01"로 설정
	String beginDate = "2005-05-01"; 
	// beginDate값을 입력했다면 입력받은 값 대입
	if(!request.getParameter("beginDate").equals("")) { 
		beginDate = request.getParameter("beginDate");
	}
	
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); // 현재 날짜 yyyy-MM-dd 형식으로 불러오기
	Date now = new Date();
	// endDate데이터가 입력되지 않았을 때 디폴트 값을 현재 날짜로 설정 
	String endDate = format.format(now); 
	// endDate값을 입력했다면 입력받은 값 대입
	if(!request.getParameter("endDate").equals("")) { 
		endDate = request.getParameter("endDate");
	}
	
	// 디버깅
	System.out.println("[rentalSearchAction.jsp parameter 값]");
	System.out.println("storeId : " + storeId);
	System.out.println("customerName : " + customerName);
	System.out.println("beginDate : " + beginDate);
	System.out.println("endDate : " + endDate);
	
	// 페이징
	int currentPage = 1; // 현재 페이지
	
	// 이전, 다음 버튼을 통해 들어왔다면 currentPage에 값 대입
	if(request.getParameter("currentPage") != null) { 
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int rowPerPage = 10; // 한 페이지당 10개의 목록
	int beginRow = (currentPage - 1) * rowPerPage; // LIMIT 첫번째 값 알고리즘
	RentalDao rentalDao = new RentalDao();
	
	int totalCount = rentalDao.rentalSearchTotalRow(storeId, customerName, beginDate, endDate); // 총 리스트 개수
	int lastPage = (int)(Math.ceil(((double)totalCount / (double)rowPerPage))); // 마지막 페이지 알고리즘
	
	// 조건에 해당하는 리스트 불러오기
	List<Map<String, Object>> list = rentalDao.selectRentalSearchList(beginRow, rowPerPage, storeId, customerName, beginDate, endDate);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rentalSearchAction</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="/inc/upMenu.jsp"></jsp:include>
	<div class="jumbotron">
		<h1>대여 정보 검색 결과</h1>
		<span class="text-primary"><h5>조건에 해당하는 총 [ <%=totalCount %> ]개의 대여정보가 존재합니다</h5></span>
	</div>
	<div class="container-fluid">
	<div>
		<a href="<%=request.getContextPath()%>/searchDetail/rentalSearchForm.jsp" class="btn" style="background:#00004B; color:#FFFFFF;">재검색</a>
	</div><br>
	<table class="table">
	<%
		if(totalCount > 0) { // 데이터가 1개이상 존재한다면 테이블 출력
	%>
			<thead class="text-center text-light" style="background: #00004B;">
				<tr>
					<th>대여 번호</th>
					<th>대여일</th>
					<th>재고 번호</th>
					<th>영화 번호</th>
					<th>제목</th>
					<th>고객 번호</th>
					<th>고객이름</th>
					<th>반납일</th>
					<th>매장</th>
					<th>직원 번호</th>
					<th>업데이트일</th>
				</tr>
			</thead>
	<%
		} else if (totalCount == 0) { // 데이터가 존재하지 않는다면 데이터가 없다는 안내메세지 출력
	%>
			<h3 class="text-danger text-center">조건에 해당하는 렌탈 정보가 존재하지 않습니다.</h3>
	<%	
		}
	%>
		<%
			for(Map<String, Object> m : list) {
		%>
				<tbody class="text-center">
					<tr>
						<td><%=m.get("rentalId")%></td>
						<td><%=m.get("rentalDate")%></td>
						<td><%=m.get("inventoryId")%></td>
						<td><%=m.get("filmId")%></td>
						<td><%=m.get("title")%></td>
						<td><%=m.get("customerId")%></td>
						<td><%=m.get("customerName")%></td>
						<td><%=m.get("returnDate")%></td>
						<td><%=m.get("storeId")%></td>
						<td><%=m.get("staffId")%></td>
						<td><%=m.get("lastUpdate")%></td>
					</tr>
				</tbody>
		<%
			}
		%>
		</table>
	
	<!-- 이전 / 다음 (페이지) -->
	<%
		if(currentPage > 1) { // currentPage가 1보다 크면 이전 버튼이 보이도록 설정
	%>
			<!-- 이전버튼 누르면 currentPage-1의 값 보내기 --> 
			<!-- 받은 storeId, customerName, beginDate, endDate 값 같이 넘김 -->
			<a href="<%=request.getContextPath()%>/searchDetail/rentalSearchAction.jsp?currentPage=<%=currentPage-1%>&storeId=<%=storeId%>&customerName=<%=customerName%>&beginDate=<%=beginDate%>&endDate=<%=endDate%>" class="btn" style="background:#00004B; color:#FFFFFF;">이전</a>
	<%
		}
		if(currentPage < lastPage) { // currentPage가 lastPage보다 작으면 다음 버튼이 보이도록 설정
	%>
			<!-- 이전버튼 누르면 currentPage+1의 값 보내기 --> 
			<!-- 받은 storeId, customerName, beginDate, endDate 값 같이 넘김 -->
			<a href="<%=request.getContextPath()%>/searchDetail/rentalSearchAction.jsp?currentPage=<%=currentPage+1%>&storeId=<%=storeId%>&customerName=<%=customerName%>&beginDate=<%=beginDate%>&endDate=<%=endDate%>" class="btn" style="background:#00004B; color:#FFFFFF;">다음</a>
	<%
		}
	%>
	</div>
	<jsp:include page="/inc/footer.jsp"></jsp:include>
</body>
</html>