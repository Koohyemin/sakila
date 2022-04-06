<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*"%>
<%@ page import = "vo.*"%>
<%@ page import = "java.util.*"%>
<%
	// 카테고리 이름 목록
	CategoryDao categoryDao = new CategoryDao();
	List<Category> categoryList = categoryDao.selectCategoryList();
	// 대여료 목록
	FilmDao filmDao = new FilmDao();
	List<Double> priceList = filmDao.selectFilmPriceList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>filmSearchForm</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<h1 class="text-center text-info">필름 리스트 뷰 검색</h1>
	<div class="container">
	<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-link">index</a>
	<form action="<%=request.getContextPath()%>/filmSearchAction.jsp" method="post">
		<table class="table table-dark table-striped">
			<tr>
				<!-- category 테이블에서 select -->
				<th class="text-info">카테고리</th>
				<td>
					<select name="category" class="form-control">
						<option value="">카테고리 선택</option>
						<%
							for(Category c : categoryList) {
						%>
								<option value="<%=c.getName() %>"><%=c.getName() %></option>
						<%
							}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<!-- rating은 고정값이기 때문에 직접 입력 -->
				<th class="text-info">등급</th>
				<td>
					<select name="rating" class="form-control">
						<option value="">등급 선택</option>
						<option value="G">G</option>
						<option value="PG">PG</option>
						<option value="PG-13">PG-13</option>
						<option value="R">R</option>
						<option value="NC-17">NC-17</option>
					</select>
				</td>
			</tr>
			<tr>
				<th class="text-info">대여료</th>
				<td>
					<div><input type="radio" name="price" value="" checked="checked" class="form-check-input">선택안함</div>
					<%
						for(Double p : priceList) {
					%>
							<div><input type="radio" name="price" value="<%=p%>" class="form-check-input"><%=p%><div>
					<%
						}
					%>
				</td>
			</tr>
			<tr>
				<th class="text-info">영화 시간</th>
				<td>
					<div><input type="radio" name="length" value="" checked="checked" class="form-check-input">선택안함</div>
					<div><input type="radio" name="length" value="0" class="form-check-input">1시간 미만</div> <!-- length < 60 -->
					<div><input type="radio" name="length" value="1" class="form-check-input">1시간 이상</div> <!-- length >= 60  -->
				</td>
			</tr>
			<tr>
				<th class="text-info">제목 검색</th> <!-- 공백 값 submit 시 null 값 전송 -->
				<td>
					<input type="text" name="title" class="form-control">
				</td>
			</tr>
			<tr>
				<th class="text-info">배우 검색</th> <!-- 공백 값 submit 시 null 값 전송 -->
				<td>
					<input type="text" name="actors" class="form-control">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn btn-info btn float-right">검색</button>
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>