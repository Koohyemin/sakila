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
	<div class="container-fluid">
	<table class="table table-dark">
		<h1 class="text-center text-info">Store List</h1>
		<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-link">index</a>
		<thead>
			<tr>
				<th>storeId</th>
				<th>staffId</th>
				<th>staffName</th>
				<th>addressId</th>
				<th>staffAddr</th>
				<th>lastUpdate</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<%
					for(Map m : list) {
						
				%>
						<tr>
							<td class="text-info"><%=m.get("storeId")%></td>
							<td><%=m.get("staffId")%></td>
							<td><%=m.get("staffName")%></td>
							<td><%=m.get("addressId")%></td>
							<td><%=m.get("staffAddr")%></td>
							<td><%=m.get("lastUpdate")%></td>
						</tr>
				<%
					}
				%>
			</tr>
		</tbody>
	</table>
	</div>
</body>
</html>