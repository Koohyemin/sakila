<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rewardsReport</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<h1 class="text-center text-info">rewards report(프로시저)</h1>
	<div class="container">
		<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-link">index</a>
		<!-- min_monthly_purchases, min_dollar_amount_purchased 입력 -->
		<form method="post" action="<%=request.getContextPath()%>/rewardsReportAction.jsp">
			<table class="table table-borderless">
				<tr>
					<td class="text-info">[최소 구매 횟수] : </td>
					<td><input type="number" name="minPurchase" class="form-control"></td>
					<td class="text-info">[최소 구매 금액] : </td>
					<td><input type="number" step="0.01" name="minDollar" class="form-control"></td> <!-- 소수점 2자리 수 까지 입력받음 -->
					<td><button type="submit" class="btn btn-outline-info">검색</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>