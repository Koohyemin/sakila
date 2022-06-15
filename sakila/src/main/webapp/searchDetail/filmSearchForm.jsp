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
	
	// 영화 리스트
	// 페이지
	int currentPage = 1; // 현재 페이지
	if(request.getParameter("currentPage") != null) { // 이전, 다음 버튼을 통해 들어왔다면 값 적용
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int rowPerPage = 10; // 한 페이지당 표시할 filmList 수
	int beginRow = (currentPage - 1) * rowPerPage; // 페이지마다 시작 filmList 번호
	int lastPage = 0; // 마지막 페이지
	
	FilmListDao filmListDao = new FilmListDao();
	int totalCount = filmListDao.selectFilmListTotalRow(); // 전체 행의 수
	lastPage = (int)(Math.ceil((double)totalCount / (double)rowPerPage)); // lastPage 값 대입
	
	// film List 목록에 beginRow, rowPerPage 값 입력
	List<FilmList> list = filmListDao.selectFilmListViewByPage(beginRow, rowPerPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>filmSearchForm</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="/inc/upMenu.jsp"></jsp:include>
	<div class="jumbotron">
	  <h1>영화 리스트 / 영화 상세검색</h1>
	 </div>
	<div class="container-fluid">
	<form method="post" action="<%=request.getContextPath()%>/searchDetail/filmSearchAction.jsp">
		<table class="table table-striped">
			<tr>
				<!-- category 테이블에서 select -->
				<th style="color:#00004B;" class="text-center">카테고리</th>
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
				<th style="color:#00004B;" class="text-center">등급</th>
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
				<th style="color:#00004B;" class="text-center">대여료</th>
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
				<th style="color:#00004B;" class="text-center">영화 시간</th>
				<td>
					<div><input type="radio" name="length" value="" checked="checked" class="form-check-input">선택안함</div>
					<div><input type="radio" name="length" value="0" class="form-check-input">1시간 미만</div> <!-- length < 60 -->
					<div><input type="radio" name="length" value="1" class="form-check-input">1시간 이상</div> <!-- length >= 60  -->
				</td>
			</tr>
			<tr>
				<th style="color:#00004B;" class="text-center">제목 검색</th> <!-- 공백 값 submit 시 null 값 전송 -->
				<td>
					<input type="text" name="title" class="form-control" placeholder="영화 제목을 입력해주세요">
				</td>
			</tr>
			<tr>
				<th style="color:#00004B;" class="text-center">배우 검색</th> <!-- 공백 값 submit 시 null 값 전송 -->
				<td>
					<input type="text" name="actors" class="form-control" placeholder="배우 이름을 입력해주세요">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn float-right" style="background:#00004B; color:#FFFFFF;">검색</button>
				</td>
			</tr>
		</table>
	</form>
	</div>
	<div class="container-fluid">
	<!-- filmList 뷰 리스트 -->
		<table class="table">
			<thead class="text-center text-light" style="background:#00004B;">
				<tr>
					<th>No</th>
					<th>제목</th>
					<th>줄거리</th>
					<th>장르</th>
					<th>$</th>
					<th>분</th>
					<th>등급</th>
					<th>출연 배우</th>
				</tr>
			</thead>
			<%
				for(FilmList f : list) {
			%>
					<tbody class="text-center">
						<tr>
							<td><%=f.getFid()%></td>
							<td><%=f.getTitle()%></td>
							<td><%=f.getDescription()%></td>
							<td><%=f.getCategory()%></td>
							<td><%=f.getPrice()%></td>
							<td><%=f.getLength()%></td>
							<td><%=f.getRating()%></td>
							<td><%=f.getActors()%></td>
						</tr>
					</tbody>
			<%
				}
			%>
		</table>
		<!-- 이전 / 다음 페이지 -->
		<div class="btn-group text-center">
		<%
		// currentPage가 1보다 크면 이전이 보이도록 하고, 이전을 누르면 currentPage에서 -1값을 보냄
			if(currentPage > 1) {
		%>
			<div style="text-align:center;">
				<a href="<%=request.getContextPath()%>/searchDetail/filmSearchForm.jsp?currentPage=<%=currentPage-1%>" class="btn" style="background:#00004B; color:#FFFFFF;">이전</a>
			</div>
		<%
			}
		// currentPage가 lastPage보다 작으면 다음이 보이도록 하고, 다음을 누르면 currentPage에서 +1값을 보냄
			if(currentPage < lastPage) {
		%>
			<div style="text-align:center;">
				<a href="<%=request.getContextPath()%>/searchDetail/filmSearchForm.jsp?currentPage=<%=currentPage+1%>" class="btn" style="background:#00004B; color:#FFFFFF;">다음</a>
			</div>
		<%
			}
		%>
		</div>
	</div>
	<jsp:include page="/inc/footer.jsp"></jsp:include>
</body>
</html>