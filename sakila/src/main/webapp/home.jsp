<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.*" %>
<%
	StatsDataDao statsDataDao = new StatsDataDao();

	// TOP10 영화
	List<Map<String, Object>> rentalCountByFilm = statsDataDao.rentalCountByFilm();
	// TOP10 배우(대여 수로 파악)
	List<Map<String, Object>> dataByActor = statsDataDao.dataByActor();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sakila</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="inc/upMenu.jsp"></jsp:include>
	<div class="jumbotron">
	  <h1>WELCOME TO SAKILA DVD STORE</h1>
	  <span>SAKILA DVD TOP10 영화와 배우 리스트를 참고해 DVD를 대여해보세요!</span>
	  <br><span><a href="<%=request.getContextPath()%>/index.jsp">기존 데이터 INDEX 바로가기</a>(수정 완료 후 삭제 예정)</span>
	 </div>
	  	<div class="container">
		<h1 class="text-center">SAKILA DVD <span class="text-danger">BEST 10</span> FILM</h1>
		<table class="table">
			<thead class="text-center text-light" style="background:#00004B;">
				<tr>
					<th>영화 번호</th>
					<th>제목</th>
					<th>대여 횟수</th>
				</tr>
			</thead>
			<%
				for(Map<String, Object> m : rentalCountByFilm) {
			%>
					<tbody class="text-center">
						<tr>
							<td><%=m.get("filmId")%></td>
							<td><%=m.get("title")%></td>
							<td><%=m.get("cnt")%></td>
						</tr>
					</tbody>
			<%
				}
			%>
		</table>
		<h1 class="text-center">SAKILA DVD <span class="text-danger">BEST 10</span> ACTOR</h1>
		<table class="table">
			<thead class="text-center text-light" style="background:#00004B;">
				<tr>
					<th>배우 번호</th>
					<th>이름</th>
					<th>출연횟수</th>
					<th>해당 영화 대여횟수</th>
				</tr>
			</thead>
			<%
				for(Map<String, Object> m : dataByActor) {
			%>
					<tbody class="text-center">
						<tr>
							<td><%=m.get("actorId")%></td>
							<td><%=m.get("actorName")%></td>
							<td><%=m.get("filmCount")%></td>
							<td><%=m.get("rentalCount")%></td>
						</tr>
					</tbody>
			<%
				}
			%>
		</table>
	</div>
	<jsp:include page="inc/footer.jsp"></jsp:include>
</body>
</html>