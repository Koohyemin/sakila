<%@page import="dao.SalesByFilmCategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.SalesByFilmCategory" %>
<%@ page import = "java.util.*" %>
<%
	SalesByFilmCategoryDao salesByFilmCategoryDao = new SalesByFilmCategoryDao();
	List<SalesByFilmCategory> list = salesByFilmCategoryDao.selectSalesByFilmCategory();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>salesByFilmCategory</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<h1 class="text-center text-info">Sales By Film Category(view)</h1>
	<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-link">index</a>
	<div class="container-fluid">
	<table class="table table-dark">
		<tr class="text-info">
			<th>category</th>
			<th>totalSales</th>
		</tr>
		<%
			for(SalesByFilmCategory s : list) {
		%>
				<tr>
					<td><%=s.getCategory()%></td>
					<td><%=s.getTotalSales()%></td>
				</tr>
		<%
			}
		%>
	</table>
	</div>
</body>
</html>