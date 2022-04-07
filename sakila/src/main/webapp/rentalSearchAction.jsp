<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%
	int storeId = -1; // storeId데이터가 입력되지 않았을때 default값을 -1로 지정
	if(!request.getParameter("storeId").equals("")) { // 매장을 선택했다면 선택한 매장값 받아서 int로 형변환
		storeId = Integer.parseInt(request.getParameter("storeId"));	
	}
	String customerName = request.getParameter("customerName");
	String beginDate = request.getParameter("beginDate");
	String endDate = request.getParameter("endDate");
	
	System.out.println("[rentalSearchAction.jsp parameter 값]");
	System.out.println("storeId : " + storeId);
	System.out.println("customerName : " + customerName);
	System.out.println("beginDate : " + beginDate);
	System.out.println("endDate : " + endDate);
	
	// 페이징
	int currentPage = 1; // 현재 페이지
	if(request.getParameter("currentPage") != null) { // 이전, 다음 버튼을 통해 들어왔다면 currentPage에 값 대입
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
</head>
<body>
	<h1 class="text-center text-info">렌탈 리스트 검색 결과</h1>
	<div class="container-fluid">
	<div>
		<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-link">index</a>
		<a href="<%=request.getContextPath()%>/rentalSearchForm.jsp">재검색</a>
	</div>
	<table class="table table-dark">
	<%
		if(totalCount > 0) { // 데이터가 1개이상 존재한다면 테이블 및 개수 출력
	%>
			<div class="text-success">조건에 해당하는 총 [ <%=totalCount %> ]개의 렌탈정보가 존재합니다</div>
			<tr class="text-info">
				<th>rentalId</th>
				<th>rentalDate</th>
				<th>inventoryId</th>
				<th>filmId</th>
				<th>title</th>
				<th>customerId</th>
				<th>customerName</th>
				<th>returnDate</th>
				<th>storeId</th>
				<th>staffId</th>
				<th>lastUpdate</th>
			</tr>
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
			<a href="<%=request.getContextPath()%>/rentalSearchAction.jsp?currentPage=<%=currentPage-1%>&storeId=<%=storeId%>&customerName=<%=customerName%>&beginDate=<%=beginDate%>&endDate=<%=endDate%>" class="btn btn-outline-info">이전</a>
	<%
		}
		if(currentPage < lastPage) { // currentPage가 lastPage보다 작으면 다음 버튼이 보이도록 설정
	%>
			<!-- 이전버튼 누르면 currentPage+1의 값 보내기 --> 
			<!-- 받은 storeId, customerName, beginDate, endDate 값 같이 넘김 -->
			<a href="<%=request.getContextPath()%>/rentalSearchAction.jsp?currentPage=<%=currentPage+1%>&storeId=<%=storeId%>&customerName=<%=customerName%>&beginDate=<%=beginDate%>&endDate=<%=endDate%>" class="btn btn-outline-info">다음</a>
	<%
		}
	%>
	</div>
</body>
</html>