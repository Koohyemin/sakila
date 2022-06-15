<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "vo.StaffList" %>
<%@ page import = "dao.StaffListDao" %>
<%
	StaffListDao staffListDao = new StaffListDao();
	List<StaffList> list = staffListDao.selectStaffList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>staffListView</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<h1 class="text-center text-info">직원 목록</h1>
	<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-link">index</a>
	<div class="container-fluid">
	<table class="table">
		<thead class="thead-dark text-center">
			<tr class="text-info">
				<th>직원 ID</th>
				<th>이름</th>
				<th>주소</th>
				<th>우편번호</th>
				<th>전화번호</th>
				<th>도시</th>
				<th>나라</th>
				<th>매장 번호</th>
			</tr>
		</thead>
		<%
			for(StaffList s : list) {
		%>
				<tbody class="text-center">
					<tr>
						<td><%=s.getId()%></td>
						<td><%=s.getName()%></td>
						<td><%=s.getAddress()%></td>
						<td><%=s.getZipCode()%></td>
						<td><%=s.getPhone()%></td>
						<td><%=s.getCity()%></td>
						<td><%=s.getCountry()%></td>
						<td><%=s.getSid()%></td>
					</tr>
				</tbody>
		<%		
			}
		%>
	</table>
	</div>
</body>
</html>