<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.RewardsReportDao" %>
<%@page import="java.net.URLEncoder"%>
<%
	// 유효성 판별
	if(request.getParameter("minPurchase").equals("")) {
		response.sendRedirect(request.getContextPath()+"/rewardsReport.jsp?msg="+URLEncoder.encode("최소 구매 횟수를 입력해주세요"));
		return;
	} else if (request.getParameter("minDollar").equals("")) {
		response.sendRedirect(request.getContextPath()+"/rewardsReport.jsp?msg="+URLEncoder.encode("최소 구매 금액을 입력해주세요"));
		return;
	}

	int minPurchase = Integer.parseInt(request.getParameter("minPurchase")); // 입력받은 minPurchase값 대입
	double minDollar = Double.parseDouble(request.getParameter("minDollar")); // 입력받은 minDollar값 대입

	System.out.println("rewards_report_minPurchase : " + minPurchase);
	System.out.println("rewards_report_minDollar : " + minDollar);
	
	
	// 조건에 해당하는 고객 목록 호출
	RewardsReportDao rrd = new RewardsReportDao();
	Map<String, Object> map = rrd.rewardsReportCall(minPurchase, minDollar);
	List<Map<String,Object>> list = (List<Map<String,Object>>)map.get("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rewardsReportAction</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<h1 class="text-center text-info">조건달성 고객 결과</h1>
	<div class="container-fluid">
		<div class="text-center text-success">
			최소 구매  [ <%=minPurchase%> ] 회 이상, 
			최소 구매 금액 [ <%=minDollar %> ] 이상 고객 목록
		</div>
		<div>
			<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-link">index</a>
			<a href="<%=request.getContextPath()%>/rewardsReport.jsp">재검색</a>
		</div>
		<div class="text-center bg-info text-light"><%=map.get("count") %>명</div>
		<!-- rewardsReport 리스트 -->
		<table class="table">
			<thead class="thead-dark text-center">
				<tr class="text-info">
					<th>고객 번호</th>
					<th>매장 번호</th>
					<th>이름</th>
					<th>성</th>
					<th>이메일</th>
					<th>주소 번호</th>
					<th>활동 여부</th>
					<th>가입일자</th>
					<th>업데이트일</th>
				</tr>
			</thead>
			<%
				for(Map<String, Object> m : list) {
			%>
					<tbody class="text-center">
						<tr>
							<td><%=m.get("customerId") %></td>
							<td><%=m.get("storeId") %></td>
							<td><%=m.get("firstName") %></td>
							<td><%=m.get("lastName") %></td>
							<td><%=m.get("email") %></td>
							<td><%=m.get("addressId") %></td>
							<td><%=m.get("active") %></td>
							<td><%=m.get("createDate") %></td>
							<td><%=m.get("lastUpdate") %></td>
						</tr>
					</tbody>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>