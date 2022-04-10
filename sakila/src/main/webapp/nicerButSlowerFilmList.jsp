<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.NicerButSlowerFilmListDao" %>
<%@ page import = "vo.NicerButSlowerFilmList" %>
<%
	// 페이지
	int currentPage = 1; // 현재 페이지
	if(request.getParameter("currentPage") != null) { // 이전, 다음 버튼을 통해 들어왔다면 값 적용
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int rowPerPage = 10; // 한 페이지당 표시할 nicerButSlowerFilmList 수
	int beginRow = (currentPage - 1) * rowPerPage; // 페이지마다 시작 nicerButSlowerFilmList 번호
	int lastPage = 0; // 마지막 페이지
	
	NicerButSlowerFilmListDao nicerButSlowerFilmListDao = new NicerButSlowerFilmListDao();
	int totalCount = nicerButSlowerFilmListDao.selectNicerButSlowerFilmListTotalRow(); // 전체 행의 수
	lastPage = (int)(Math.ceil((double)totalCount / (double)rowPerPage)); // lastPage 값 대입
	
	// nicerButSlowerFilmList 목록에 beginRow, rowPerPage 값 입력
	List<NicerButSlowerFilmList> list = nicerButSlowerFilmListDao.selectNicerButSlowerFilmListByPage(beginRow, rowPerPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nicer but slower film list(view)</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<h1 class="text-center text-info">영화 목록(nicerButSlower)</h1>
	<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-link">index</a>
	<div class="container-fluid">
	<!-- nicerButSlowerFilmList 뷰 리스트 -->
		<table class="table">
			<thead class="thead-dark text-center">
				<tr class="text-info">
					<th>No</th>
					<th>제목</th>
					<th>줄거리</th>
					<th>장르</th>
					<th>$</th>
					<th>분</th>
					<th>등급</th>
					<th>배우</th>
				</tr>
			</thead>
			<%
				for(NicerButSlowerFilmList n : list) {
			%>
					<tbody class="text-center">
						<tr>
							<td><%=n.getFid()%></td>
							<td><%=n.getTitle()%></td>
							<td><%=n.getDescription()%></td>
							<td><%=n.getCategory()%></td>
							<td><%=n.getPrice()%></td>
							<td><%=n.getLength()%></td>
							<td><%=n.getRating()%></td>
							<td><%=n.getActors()%></td>
						</tr>
					</tbody>
			<%
				}
			%>
		</table>
		<!-- 이전 / 다음 페이지 -->
		<%
		// currentPage가 1보다 크면 이전이 보이도록 하고, 이전을 누르면 currentPage에서 -1값을 보냄
			if(currentPage > 1) {
		%>
				<a href="<%=request.getContextPath()%>/nicerButSlowerFilmList.jsp?currentPage=<%=currentPage-1%>" class="btn btn-outline-info">이전</a>
		<%
			}
		// currentPage가 lastPage보다 작으면 다음이 보이도록 하고, 다음을 누르면 currentPage에서 +1값을 보냄
			if(currentPage < lastPage) {
		%>
				<a href="<%=request.getContextPath()%>/nicerButSlowerFilmList.jsp?currentPage=<%=currentPage+1%>" class="btn btn-outline-info">다음</a>
		<%
			}
		%>
	</div>
</body>
</html>