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
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<h1 class="text-center text-info">장르별 총매출</h1>
	<div class="container">
	<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-link">index</a>
	<table class="table">
		<thead class="thead-dark text-center">
			<tr class="text-info">
				<th>장르</th>
				<th>총 매출</th>
			</tr>
		</thead>
		<%
			for(SalesByFilmCategory s : list) {
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
</body>
</html>