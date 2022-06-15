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
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/inc/upMenu.jsp"></jsp:include>
	<div class="jumbotron">
	  <h1>대여 정보 상세 검색</h1>
	</div>
	<div class="container">
		<br><br><br><br><br><br>
	</div>
	<div class="container">
	<form method="post" action="<%=request.getContextPath()%>/searchDetail/rentalSearchAction.jsp">
		<table class="table table-striped">
		<!-- 스토어ID 검색 -->
			<tr>
				<th class="text-center">지점 번호</th>
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
				<th class="text-center">고객 이름</th>
				<td>
					<input type="text" name="customerName" class="form-control">
				</td>
			</tr>
		<!-- 대여 일자 -->
			<tr>
				<td class="text-center">대여 일자</td>
				<td>
					<input type="date" name="beginDate"> ~ <input type="date" name="endDate">
				</td>
			</tr>
			<tr>
				<td colspan="2"><button type="submit" class="btn float-right" style="background:#00004B; color:#FFFFFF;">검색</button></td>
			</tr>
		</table>
	</form>
	</div>
	<div class="container">
		<br><br><br><br><br><br>
	</div>
	<jsp:include page="/inc/footer.jsp"></jsp:include>
</body>
</html>