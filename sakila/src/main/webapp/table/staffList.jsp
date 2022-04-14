<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "dao.*"%>
<%
	StaffDao staffDao = new StaffDao();
	List<Map<String, Object>> list = staffDao.selectStaffList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Staff List</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<h1 class="text-center text-info">직원 목록</h1>
	<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-link">index</a>
	<div class="container-fluid">
	<table class="table">
		<thead class="thead-dark text-center">
			<tr class="text-info">
				<th>직원 이름</th>
				<th>주소 번호</th>
				<th>주소</th>
				<th>이메일</th>
				<th>매장 번호</th>
				<th>재직 여부</th>
				<th>사용자이름</th>
				<th>비밀번호</th>
				<th>업데이트일</th>
			</tr>
		</thead>
				<%
					for(Map<String, Object> m : list) {
				%>
					<tbody class="text-center">
						<tr>
							<td><%=m.get("staffName")%></td>
							<td><%=m.get("addressId")%></td>
							<td><%=m.get("staffAddr")%></td>
							<td><%=m.get("email")%></td>
							<td><%=m.get("storeId")%></td>
							<td><%=m.get("active")%></td>
							<td><%=m.get("username")%></td>
							<td><%=m.get("password")%></td>
							<td><%=m.get("lastUpdate")%></td>
						</tr>
					</tbody>
				<%
					}
				%>
	</table>
	</div>
</body>
</html>