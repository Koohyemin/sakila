<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>filmInStock</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<h1 class="text-center text-info">film in stock(프로시저)</h1>
	<div class="container">
		<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-link">index</a>
		<!-- filmId, storeId 입력 -->
		<form method="post" action="<%=request.getContextPath()%>/filmInStockAction.jsp">
			<table class="table table-borderless">
				<tr>
					<td class="text-info">[영화 번호] : </td>
					<td><input type="number" name="filmId" class="form-control"></td>
					<td class="text-info">[지점 번호] : </td>
					<td><input type="number" name="storeId" class="form-control"></td>
					<td><button type="submit" class="btn btn-outline-info">검색</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>