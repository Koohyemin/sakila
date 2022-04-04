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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<h1 class="text-center text-info">Staff List(view)</h1>
	<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-link">index</a>
	<div class="container-fluid">
	<table class="table table-dark">
		<tr class="text-info">
			<th>id</th>
			<th>name</th>
			<th>address</th>
			<th>zipCode</th>
			<th>phone</th>
			<th>city</th>
			<th>country</th>
			<th>sid</th>
		</tr>
		<%
			for(StaffList s : list) {
		%>
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
		<%		
			}
		%>
	</table>
	</div>
</body>
</html>