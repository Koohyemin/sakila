<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>
<%
	// 지점 번호 목록
	StoreDao storeDao = new StoreDao();
	List<Integer> storeList = storeDao.selectStoreIdList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>filmInStock</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<h1 class="text-center text-info">영화 재고 검색</h1>
	<div class="container">
		<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-link">index</a>
		<!-- filmId, storeId 입력 -->
		<form method="post" action="<%=request.getContextPath()%>/filmInStockAction.jsp">
			<table class="table">
				<tr>
					<th class="text-info text-center">영화 번호 </th>
					<td><input type="number" name="filmId" class="form-control"></td>
				</tr>
				<tr>
					<th class="text-info text-center">지점</th>
					<td>
					<%
						for(int i : storeList) {
					%>
								<div>
									<input type="radio" name="storeId" value="<%=i%>"class="form-check-input"><%=i%>번 지점 
								</div>
					<%
						}
					%>
					</td>
				</tr>
				<tr>
					<td colspan="2"><button type="submit" class="btn btn-info btn float-right">검색</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>