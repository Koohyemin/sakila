<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.SalesByStoreDao" %>
<%@ page import = "java.util.*" %>
<%@ page import = "vo.SalesByStore" %>
<%
	SalesByStoreDao salesByStoreDao = new SalesByStoreDao();
	List<SalesByStore> list = salesByStoreDao.selectSalesByStore();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>salesByStore</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<h1 class="text-center text-info">매장별 총매출</h1>
	<div class="container">
	<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-link">index</a>
	<table class="table">
		<thead class="thead-dark text-center">
			<tr class="text-info">
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
	</div>
</body>
</html>