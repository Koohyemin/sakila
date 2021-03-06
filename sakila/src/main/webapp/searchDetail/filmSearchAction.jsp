<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<%
	String category = request.getParameter("category");
	String rating = request.getParameter("rating");
	double price = -1; // price데이터가 입력되지 않았을 때 default값을 -1로 지정
	if(!request.getParameter("price").equals("")) {
		price = Double.parseDouble(request.getParameter("price"));	
	}
	int length = -1; // length데이터가 입력되지 않았을때 default값을 -1로 지정
	if(!request.getParameter("length").equals("")){
		length = Integer.parseInt(request.getParameter("length"));	
	}
	String title = request.getParameter("title");
	String actors = request.getParameter("actors");
	
	// 페이지
	int currentPage = 1;
	if(request.getParameter("currentPage")!=null) { // 이전, 다음 버튼을 통해 들어왔다면 currentPage에 페이지 수 적용(이전 : -1, 다음 : +1)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int rowPerPage = 10; // 한 페이지 당 표시 할 film 목록 수 
	int beginRow = (currentPage-1) * rowPerPage; // 페이지마다 시작점
	FilmDao filmDao = new FilmDao();
	int totalCount = filmDao.filmSearchTotalRow(category, rating, price, length, title, actors); // 데이터의 수
	int lastPage = (int)(Math.ceil(((double)totalCount / (double)rowPerPage))); // 전체개수 / 한페이지당 수를 올림하여 int 형변환 -> 마지막페이지
	
	List<FilmList> list = filmDao.selectFilmListSearch(beginRow, rowPerPage, category, rating, price, length, title, actors); // 조건에 해당하는 리스트
	
	System.out.println("lastPage : " + lastPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>filmSearchAction</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="/inc/upMenu.jsp"></jsp:include>
	<div class="jumbotron">
	  <h1>영화 상세검색 결과 리스트</h1>
	  <span class="text-primary"><h5>조건에 해당하는 총 [ <%=totalCount %> ]개의 영화가 존재합니다</h5></span>
	 </div>
	<div class="container-fluid">
	<div>
		<a href="<%=request.getContextPath()%>/searchDetail/filmSearchForm.jsp" style="background:#00004B; color:#FFFFFF;" class="btn">재검색</a><br><br>
	</div>
	<table class="table">
	<% if(totalCount > 0) { // 데이터가 1개이상 존재한다면 테이블 및 개수 출력
	%>
			<thead class="text-center text-light" style="background:#00004B;">
				<tr>
					<th>No</th>
					<th>제목</th>
					<th>줄거리</th>
					<th>장르</th>
					<th>$</th>
					<th>분</th>
					<th>등급</th>
					<th>출연 배우</th>
				</tr>
			</thead>
	<%	
	} else if(totalCount == 0) { // 데이터가 존재하지 않는다면 데이터가 없다는 안내메세지 출력
	%>
		<h3 class="text-danger text-center">조건에 해당하는 영화가 존재하지 않습니다.</h3>
	<%
	}
	%>
		<%
			for(FilmList f : list) {
		%>
				<tbody class="text-center">
					<tr>
						<td><%=f.getFid()%></td>
						<td><%=f.getTitle()%></td>
						<td><%=f.getDescription()%></td>
						<td><%=f.getCategory()%></td>
						<td><%=f.getPrice()%></td>
						<td><%=f.getLength()%></td>
						<td><%=f.getRating()%></td>
						<td><%=f.getActors()%></td>
					</tr>
				</tbody>
		<%
			}
		%>
	</table>
	<!-- 이전/다음 페이지 -->
	<%
		if(currentPage > 1) { // currentPage가 1보다 클 때 이전 버튼 보임
	%>
			<a href="<%=request.getContextPath()%>/searchDetail/filmSearchAction.jsp?currentPage=<%=currentPage-1%>&category=<%=category%>&rating=<%=rating%>&price=<%=price%>&length=<%=length%>&title=<%=title%>&actors=<%=actors%>" class="btn" style="background:#00004B; color:#FFFFFF;" class="btn">이전</a>
	<%
		}
		if(currentPage < lastPage) { // currentPage가 lastPage보다 작을 때만 다음 버튼 보임
	%>
			<a href="<%=request.getContextPath()%>/searchDetail/filmSearchAction.jsp?currentPage=<%=currentPage+1%>&category=<%=category%>&rating=<%=rating%>&price=<%=price%>&length=<%=length%>&title=<%=title%>&actors=<%=actors%>" class="btn" style="background:#00004B; color:#FFFFFF;" class="btn">다음</a>
	<%
		}
	%>
	</div>
</body>
</html>