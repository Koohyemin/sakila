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
	FilmDao filmDao = new FilmDao();
	// 존재하지 않는 영화번호 유효성
	int existFilmId = filmDao.existFilmId(filmId);
	if(existFilmId==0) {
		response.sendRedirect(request.getContextPath()+"/procedure/filmInStock.jsp?msg="+URLEncoder.encode("존재하지 않는 영화번호입니다"));
		return;
	}
	
	int storeId = Integer.parseInt(request.getParameter("storeId")); // 입력받은 storeId값 대입
	System.out.println("film_in_stock_filmId : " + filmId);
	System.out.println("film_in_stock_storeId : " + storeId);
	
	// 프로시저 결과 인벤토리번호
	Map<String, Object> map = filmDao.filmInStockCall(filmId, storeId);
	List<Integer> list = (List<Integer>)map.get("list");
	int count = list.size();
	System.out.println(list.size());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>filmInStockAction</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="/inc/upMenu.jsp"></jsp:include>
	<div class="jumbotron">
	  <h1>인텐토리 검색 결과</h1>
	  <span class="text-primary"><h5>영화 번호 : <%=filmId%> / 지점 번호 : <%=storeId %></h5></span>
	 </div>
	<div class="container">
		<div>
			<a href="<%=request.getContextPath()%>/procedure/filmInStock.jsp" style="background:#00004B; color:#FFFFFF;" class="btn">재검색</a>
		</div><br>
		<!-- film_in_stock 리스트 -->
		<table class="table">
				<thead class="text-center text-light" style="background:#00004B;">
					<tr class="text-center">
						<th colspan="2">인벤토리 번호</th>
					</tr>
				</thead>

			<%
				for(int id : list) {
			%>
					<tbody class="text-center">
						<tr>
							<td colspan="2" class="text-center"><%=id %>번</td>
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
				<tr>
					<th><h5 class="text-danger text-center">재고가 없습니다.</h5></th>
				</tr>
			<%
				}
			%>
		</table>
	</div>
	<jsp:include page="/inc/footer.jsp"></jsp:include>
</body>
</html>