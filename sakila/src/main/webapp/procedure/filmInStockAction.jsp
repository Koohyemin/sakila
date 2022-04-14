<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.FilmDao" %>
<%@page import="java.net.URLEncoder"%>
<%
	
	// 유효성 판별
	if(request.getParameter("filmId").equals("")) {
		response.sendRedirect(request.getContextPath()+"/procedure/filmInStock.jsp?msg="+URLEncoder.encode("영화번호를 입력해주세요"));
		return;
	} else if (request.getParameter("storeId")==null) {
		response.sendRedirect(request.getContextPath()+"/procedure/filmInStock.jsp?msg="+URLEncoder.encode("지점을 선택해주세요"));
		return;
	}

	int filmId = Integer.parseInt(request.getParameter("filmId")); // 입력받은 filmId값 대입
	int storeId = Integer.parseInt(request.getParameter("storeId")); // 입력받은 storeId값 대입

	System.out.println("film_in_stock_filmId : " + filmId);
	System.out.println("film_in_stock_storeId : " + storeId);
	
	FilmDao filmDao = new FilmDao();
	Map<String, Object> map = filmDao.filmInStockCall(filmId, storeId);
	List<Integer> list = (List<Integer>)map.get("list");
	int count = (Integer)map.get("count");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>filmInStockAction</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<h1 class="text-center text-info">영화 재고 결과</h1>
	<div class="container">
		<div class="text-center text-success">
			영화 번호 : <%=filmId%> / 
			지점 번호 : <%=storeId %>
		</div>
		<div>
			<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-link">index</a>
			<a href="<%=request.getContextPath()%>/procedure/filmInStock.jsp">재검색</a>
		</div>
		<!-- film_in_stock 리스트 -->
		<table class="table">
		<%
			if(count > 0) {
		%>
				<thead class="thead-dark text-center">
					<tr class="text-center">
						<th colspan="2" class="text-info text-center">인벤토리 번호</th>
					</tr>
				</thead>
		<%
			}
		%>
			<%
				for(int id : list) {
			%>
					<tbody class="text-center">
						<tr>
							<td colspan="2" class="text-center"><%=id %></td>
						</tr>
					</tbody>
			<%
				}
				if(count > 0) {
			%>
					<tr>
						<th class="text-danger text-center">재고</th>
						<td class="text-center"><%=count%>개</td>
					</tr>
			<%		
				} else if(count == 0) {
			%>
					<h5 class="text-danger text-center">재고가 없습니다.</h5>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>