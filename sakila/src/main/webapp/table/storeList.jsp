<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "dao.*"%>
<%
	StoreDao storeDao = new StoreDao();
	List<Map<String, Object>> list = storeDao.selectStoreList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store List</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<h1 class="text-center text-info">매장 목록</h1>
	<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-link">index</a>
	<div class="container-fluid">
	<table class="table">
		<thead class="thead-dark text-center">
			<tr>
				<th>매장 번호</th>
				<th>매니저 번호</th>
				<th>이름</th>
				<th>주소 번호</th>
				<th>주소</th>
				<th>업데이트일</th>
			</tr>
		</thead>
		<tbody class="text-center">
				<%
					for(Map<String, Object> m : list) {
						
				%>
						<tr>
							<td><%=m.get("storeId")%></td>
							<td><%=m.get("staffId")%></td>
							<td><%=m.get("staffName")%></td>
							<td><%=m.get("addressId")%></td>
							<td><%=m.get("staffAddr")%></td>
							<td><%=m.get("lastUpdate")%></td>
						</tr>
				<%
					}
				%>
		</tbody>
	</table>
	</div>
</body>
</html>