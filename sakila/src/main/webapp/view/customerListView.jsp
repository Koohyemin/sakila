<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.CustomerListDao" %>
<%@ page import = "vo.CustomerList" %>
<%
	// 페이지
	int currentPage = 1; // 현재 페이지
	if(request.getParameter("currentPage") != null) { // 이전, 다음 버튼을 통해 들어왔다면 값 적용
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int rowPerPage = 10; // 한 페이지당 표시할 customerList 수
	int beginRow = (currentPage - 1) * rowPerPage; // 페이지마다 시작 customerList 번호
	int lastPage = 0; // 마지막 페이지
	
	CustomerListDao customerListDao = new CustomerListDao();
	int totalCount = customerListDao.selectCustomerListTotalRow(); // 전체 행의 수
	lastPage = (int)(Math.ceil((double)totalCount / (double)rowPerPage)); // lastPage 값 대입
	
	// CustomerList 목록에 beginRow, rowPerPage 값 입력
	List<CustomerList> list = customerListDao.selectCustomerListViewByPage(beginRow, rowPerPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>customer list view</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="/inc/upMenu.jsp"></jsp:include>
	<div class="jumbotron">
      <h1>고객 목록</h1>
   </div>
	<div class="container-fluid">
	<div style="float:right">
         <form>
            <table>
               <tr>
                  <th>고객 이름</th>
                  <td>
                     <input type="text" name="customerName" class="form-control">
                  </td>
                  <td>
                     <button type="submit" style="background: #00004B; color: #FFFFFF;" class="btn">검색</button>
                  </td>
               </tr>
            </table>
         </form>
      </div><br><br>
		<!-- customerList 뷰 리스트 -->
		<table class="table">
			<thead  class="text-center text-light" style="background: #00004B;">
				<tr>
					<th>고객ID</th>
					<th>이름</th>
					<th>주소</th>
					<th>우표번호</th>
					<th>전화번호</th>
					<th>도시</th>
					<th>나라</th>
					<th>메모</th>
					<th>매장 번호</th>
				</tr>
			</thead>
			<%
				for(CustomerList c : list) {
			%>
					<tbody class="text-center">
						<tr>
							<td><%=c.getId()%></td>
							<td><%=c.getName()%></td>
							<td><%=c.getAddress()%></td>
							<td><%=c.getZipCode()%></td>
							<td><%=c.getPhone()%></td>
							<td><%=c.getCity()%></td>
							<td><%=c.getCountry()%></td>
							<td><%=c.getNotes()%></td>
							<td><%=c.getSid()%></td>
						</tr>
					</tbody>
			<%
				}
			%>
		</table>
		
		<!-- 이전 / 다음 페이지 -->
		<%
		// currentPage가 1보다 크면 이전이 보이도록 하고, 이전을 누르면 currentPage에서 -1값을 보냄
			if(currentPage > 1) {
		%>
				<a href="<%=request.getContextPath()%>/view/customerListView.jsp?currentPage=<%=currentPage-1%>" class="btn" style="background: #00004B; color: #FFFFFF;">이전</a>
		<%
			}
		// currentPage가 lastPage보다 작으면 다음이 보이도록 하고, 다음을 누르면 currentPage에서 +1값을 보냄
			if(currentPage < lastPage) {
		%>
				<a href="<%=request.getContextPath()%>/view/customerListView.jsp?currentPage=<%=currentPage+1%>" class="btn" style="background: #00004B; color: #FFFFFF;">다음</a>
		<%
			}
		%>
	</div>
	<jsp:include page="/inc/footer.jsp"></jsp:include>
</body>
</html>