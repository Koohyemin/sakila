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
</head>
<body>
	<a href="">index</a>
	<h1>Store List</h1>
	<table>
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
			</tr>
		</tbody>
	</table>
</body>
</html>