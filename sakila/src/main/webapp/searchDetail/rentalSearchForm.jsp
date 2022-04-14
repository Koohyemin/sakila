<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>
<%
	StoreDao storeDao = new StoreDao();
	List<Integer> storeList = storeDao.selectStoreIdList();
	System.out.println("매장 수 : " + storeList.size());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rentalSearchFrom</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<h1 class="text-center text-info">대여 정보 상세검색</h1>
	<div class="container">
	<form method="post" action="<%=request.getContextPath()%>/searchDetail/rentalSearchAction.jsp">
	<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-link">index</a>
		<table class="table table-striped">
		<!-- 스토어ID 검색 -->
			<tr>
				<th class="text-info">지점 번호</th>
				<td>
					<div><input type="radio" name="storeId" value="" checked="checked" class="form-check-input">선택안함</div>
					<%
						for(int i : storeList) {
					%>
								<div><input type="radio" name="storeId" value="<%=i%>" class="form-check-input"><%=i%>번 지점</div>
					<%
						}
					%>
				</td>
			</tr>
		<!-- 고객이름 검색 -->
			<tr>
				<th class="text-info">고객 이름</th>
				<td>
					<input type="text" name="customerName" class="form-control">
				</td>
			</tr>
		<!-- 대여 일자 -->
			<tr>
				<td class="text-info">대여 일자</td>
				<td>
					<input type="date" name="beginDate"> ~ <input type="date" name="endDate">
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