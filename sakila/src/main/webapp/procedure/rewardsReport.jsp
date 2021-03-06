<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%
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
<title>rewardsReport</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/inc/upMenu.jsp"></jsp:include>
	<div class="jumbotron">
	   <h1>조건별 고객 검색</h1>
	</div>
	<div class="container">
		<br><br><br><br><br>
	</div>
	<div class="container">
		<div class="text-danger"><%=msg %></div>
		<!-- min_monthly_purchases, min_dollar_amount_purchased 입력 -->
		<form method="post" action="<%=request.getContextPath()%>/procedure/rewardsReportAction.jsp">
			<table class="table">
				<tr>
					<td class="text-center">최소 구매 횟수</td>
					<td><input type="number" name="minPurchase" class="form-control"></td>
				</tr>
				<tr>
					<td class="text-center">최소 구매 금액</td>
					<td><input type="number" step="0.01" name="minDollar" class="form-control"></td> <!-- 소수점 2자리 수 까지 입력받음 -->
				</tr>
				<tr>
					<td colspan="2"><button type="submit" class="bt btn float-right" style="background: #00004B; color: #FFFFFF;">검색</button></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="container">
		<br><br><br><br><br>
	</div>
<jsp:include page="/inc/footer.jsp"></jsp:include>
</body>
</html>