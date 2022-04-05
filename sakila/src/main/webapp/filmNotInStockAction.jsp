<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.FilmDao" %>
<%
	int filmId = 0;
	int storeId = 0;
	
	if(request.getParameter("filmId") != null && request.getParameter("storeId") != null) {
		filmId = Integer.parseInt(request.getParameter("filmId")); // 입력받은 filmId값 대입
		storeId = Integer.parseInt(request.getParameter("storeId")); // 입력받은 storeId값 대입
	}
	
	FilmDao filmDao = new FilmDao();
	Map<String, Object> map = filmDao.filmNotInStockCall(filmId, storeId);
	List<Integer> list = (List<Integer>)map.get("list");
	int count = (Integer)map.get("count");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>filmNotInStockAction</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
		<h1 class="text-center text-info">film not in stock(프로시저)</h1>
	<div class="container">
		<div class="text-center text-success">
			영화 번호 : <%=filmId%> / 
			지점 번호 : <%=storeId %>
		</div>
		<div>
			<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-link">index</a>
			<a href="<%=request.getContextPath()%>/filmNotInStock.jsp">재검색</a>
		</div>
		<!-- film_not_in_stock 리스트 -->
		<table class="table table-dark">
			<%
				for(int id : list) {
			%>
					<tr>
						<th class="text-info text-center">인벤토리 번호</th>
						<td><%=id %></td>
					</tr>
					<tr>
						<th class="text-center">지점 번호</th>	
						<td><%=storeId%></td>
					</tr>
			<%
				}
				if(count > 0) {
			%>
					<tr>
						<th class="text-danger text-center">없는 재고</th>
						<td><%=count%>개</td>
					</tr>
			<%		
				} else if(count == 0) {
			%>
					<h5 class="text-danger text-center"><%=storeId %>번 지점의 <%=filmId%>번 영화는 모든 재고가 있습니다.</h5>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>