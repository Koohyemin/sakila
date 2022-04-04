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
	<h1 class="text-center text-info">Sales By Store(view)</h1>
	<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-link">index</a>
	<div class="container-fluid">
	<table class="table table-dark">
		<tr class="text-info">
			<th>store</th>
			<th>manager</th>
			<th>totalSales</th>
		</tr>
		<%
			for(SalesByStore s : list) {
		%>
				<tr>
					<td><%=s.getStore()%></td>
					<td><%=s.getManager()%></td>
					<td><%=s.getTotalSales()%></td>
				</tr>
		<%
			}
		%>
	</table>
	</div>
</body>
</html>