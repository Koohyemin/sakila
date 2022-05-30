<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>
<%@page import="java.net.URLDecoder"%>
<%
	// 지점 번호 목록
	StoreDao storeDao = new StoreDao();
	List<Integer> storeList = storeDao.selectStoreIdList();
	// 유효성 판별
	String msg = "";
	if(request.getParameter("msg") != null) {
		msg = request.getParameter(URLDecoder.decode("msg"));
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>filmInStock</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="/inc/upMenu.jsp"></jsp:include>
	<div class="jumbotron">
	  <h1>인텐토리 검색</h1>
	  <span>영화번호와 해당지점을 입력하여 재고가 있는 DVD의 위치를 편안하게 찾아보세요!</span>
	 </div>
	<div class="container">
		<div class="text-danger"><%=msg %></div>
		<!-- filmId, storeId 입력 -->
		<form method="post" action="<%=request.getContextPath()%>/procedure/filmInStockAction.jsp">
			<table class="table table-striped">
				<tr>
					<th class="text-center">영화 번호 </th>
					<td><input type="number" name="filmId" class="form-control" placeholder="영화번호를 입력해주세요"></td>
				</tr>
				<tr>
					<th class="text-center">지점</th>
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
					<td colspan="2"><button type="submit" class="btn float-right" style="background:#00004B; color:#FFFFFF;">검색</button></td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="/inc/footer.jsp"></jsp:include>
</body>
</html>