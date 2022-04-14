<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.ActorInfoDao" %>
<%@ page import = "vo.ActorInfo" %>
<%
	// 페이지
	int currentPage = 1; // 현재 페이지
	if(request.getParameter("currentPage") != null) { // 이전, 다음 버튼을 통해 들어왔다면 값 적용
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int rowPerPage = 10; // 한 페이지당 표시할 ActorInfo 수
	int beginRow = (currentPage - 1) * rowPerPage; // 페이지마다 시작 actorInfo 번호
	int lastPage = 0; // 마지막 페이지
	
	ActorInfoDao actorInfoDao = new ActorInfoDao();
	int totalCount = actorInfoDao.selectActorInfoTotalRow(); // 전체 행의 수
	lastPage = (int)(Math.ceil((double)totalCount / (double)rowPerPage)); // lastPage 값 대입
	
	// ActorInfo 목록에 beginRow, rowPerPage 값 입력
	List<ActorInfo> list = actorInfoDao.selectActorInfoListByPage(beginRow, rowPerPage);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ActorInfoList</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<h1 class="text-center text-info">배우별 출연 영화 목록</h1>
	<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-link">index</a>
	<div class="container-fluid">
		<!-- actor_info 리스트 -->
		<table class="table">
			<thead class="thead-dark text-center">
				<tr>
					<th>No</th>
					<th>이름</th>
					<th>성</th>
					<th>출연 정보</th>
				</tr>
			</thead>
		<%
			for(ActorInfo a : list) {
		%>
			<tbody class="text-center">
				<tr>
					<td><%=a.getActorId()%></td>
					<td><%=a.getFirstName()%></td>
					<td><%=a.getLastName()%></td>
					<td><%=a.getFilmInfo()%></td>
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
				<a href="<%=request.getContextPath()%>/view/actorInfoList.jsp?currentPage=<%=currentPage-1%>" class="btn btn-outline-info">이전</a>
		<%
			}
		// currentPage가 lastPage보다 작으면 다음이 보이도록 하고, 다음을 누르면 currentPage에서 +1값을 보냄
			if(currentPage < lastPage) {
		%>
				<a href="<%=request.getContextPath()%>/view/actorInfoList.jsp?currentPage=<%=currentPage+1%>" class="btn btn-outline-info">다음</a>
		<%
			}
		%>
	</div>
</body>
</html>