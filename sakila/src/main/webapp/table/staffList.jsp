<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.*"%>
<%
   StaffDao staffDao = new StaffDao();
   List<Map<String, Object>> list = staffDao.selectStaffList();
   String active = null;
   String password = "";
%>
<!DOCTYPE html>
<html>
<head>
<title>Staff List</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
   <jsp:include page="/inc/upMenu.jsp"></jsp:include>
   <div class="jumbotron">
      <h1>직원 목록</h1>
      <span>SAKILA와 함께하는 가족</span>
   </div><br><br>
      <div class="container">
         <h2 style="color:#0000A5;"><%=list.get(0).get("staffName")%></h2>
         <div class="card">
            <div class="row">
                 <div class="col-sm-4">
                    <div class="card-body">
                          <img src="<%=request.getContextPath()%>/image/mike.jpg" style="width:300px; height:370px;">
                    </div>
                 </div>
                 <div class="col-sm-7">
                    <table class="table">
                     <tr>
                        <th>주소 번호</th>
                        <td><%=list.get(0).get("addressId")%></td>
                     </tr>
                     <tr>
                        <th>주소</th>
                        <td><%=list.get(0).get("staffAddr")%></td>
                     </tr>
                     <tr>
                        <th>이메일</th>
                        <td><%=list.get(0).get("email")%></td>
                     </tr>
                     <tr>
                        <th>매장 번호</th>
                        <td><%=list.get(0).get("storeId")%>번 지점</td>
                     </tr>
                     <tr>
                        <th>재직 여부</th>
                        <%
                           if(list.get(0).get("active").equals(1)) {
                              active = "현재 재직 중";
                           } else {
                              active = "퇴사 또는 휴직";
                           }
                        %>
                        <td><%=active %></td>
                     </tr>
                     <tr>
                        <th>사용자이름</th>
                        <td><%=list.get(0).get("username")%></td>
                     </tr>
                     <tr>
                        <th>비밀번호</th>
                        <td><%=list.get(0).get("password")%></td>
                     </tr>
                     <tr>
                        <th>업데이트일</th>
                        <td><%=list.get(0).get("lastUpdate")%></td>
                     </tr>
                    </table>
              </div>
           </div>
   </div><br><br>
      <h2 style="color:#0000A5;"><%=list.get(1).get("staffName")%></h2>
         <div class="card">
            <div class="row">
                 <div class="col-sm-4">
                    <div class="card-body">
                       <img src="<%=request.getContextPath()%>/image/jon.jpg" style="width:300px; height:370px;">
                    </div>
                 </div>
                 <div class="col-sm-7">
                    <table class="table">
                     <tr>
                        <th>주소 번호</th>
                        <td><%=list.get(1).get("addressId")%></td>
                     </tr>
                     <tr>
                        <th>주소</th>
                        <td><%=list.get(1).get("staffAddr")%></td>
                     </tr>
                     <tr>
                        <th>이메일</th>
                        <td><%=list.get(1).get("email")%></td>
                     </tr>
                     <tr>
                        <th>매장 번호</th>
                        <td><%=list.get(1).get("storeId")%>번 지점</td>
                     </tr>
                     <tr>
                        <th>재직 여부</th>
                        <%
                           if(list.get(1).get("active").equals(1)) {
                              active = "현재 재직 중";
                           } else {
                              active = "퇴사 또는 휴직";
                           }
                        %>
                        <td><%=active %></td>
                     </tr>
                     <tr>
                        <th>사용자이름</th>
                        <td><%=list.get(1).get("username")%></td>
                     </tr>
                     <tr>
                        <th>비밀번호</th>
                        <%
                           if(list.get(1).get("password") == null) {
                        %>
                           <td><%=password %></td>
                        <%
                           } else {
                        %>
                           <td><%=list.get(1).get("password")%></td>
                        <%
                           }
                        %>
                     </tr>
                     <tr>
                        <th>업데이트일</th>
                        <td><%=list.get(1).get("lastUpdate")%></td>
                     </tr>
                    </table>
              </div>
           </div>
      </div>
   </div>
   <jsp:include page="/inc/footer.jsp"></jsp:include>
</body>
</html>