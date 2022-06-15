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
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="/inc/upMenu.jsp"></jsp:include>
	<div class="jumbotron">
	  <h1>매장 정보</h1>
	  <span>SAKILA의 매장정보입니다</span>
	 </div>
	<div class="container">
		<h1 class="text-center"><span class="text-danger"><%=list.get(0).get("storeId")%></span>번 지점 정보</h1>
		<table class="table">
			<tr>
				<th class="text-center text-light" style="background:#00004B;">지점</th>
				<td ><%=list.get(0).get("storeId")%>번</td>
			</tr>
			<tr>
				<th class="text-center text-light" style="background:#00004B;">주소</th>
				<td ><%=list.get(0).get("staffAddr")%></td>
			</tr>
			<tr>
				<th class="text-center text-light" style="background:#00004B;">담당 매니저</th>
				<td ><%=list.get(0).get("staffName")%></td>
			</tr>
			<tr>
				<th class="text-center text-light" style="background:#00004B; vertical-align: middle;">지도</th>
				<td>
					<img alt="" src="<%=request.getContextPath()%>/image/지도.png" style="width:619px;height: 326;">
				</td>
			</tr>
		</table>
		<h1 class="text-center"><span class="text-danger"><%=list.get(1).get("storeId")%></span>번 지점 정보</h1>
		<table class="table">
			<tr>
				<th class="text-center text-light" style="background:#00004B;">지점</th>
				<td ><%=list.get(1).get("storeId")%>번</td>
			</tr>
			<tr>
				<th class="text-center text-light" style="background:#00004B;">주소</th>
				<td ><%=list.get(1).get("staffAddr")%></td>
			</tr>
			<tr>
				<th class="text-center text-light" style="background:#00004B;">담당 매니저</th>
				<td ><%=list.get(1).get("staffName")%></td>
			</tr>
			<tr>
				<th class="text-center text-light" style="background:#00004B;vertical-align: middle;">지도</th>
				<td>
					<img alt="" src="<%=request.getContextPath()%>/image/지도2.png">
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="/inc/footer.jsp"></jsp:include>
</body>
</html>