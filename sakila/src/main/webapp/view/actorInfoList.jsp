<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.ActorInfoDao"%>
<%@ page import="vo.ActorInfo"%>
<%
   // 페이지
   int currentPage = 1; // 현재 페이지
   if(request.getParameter("currentPage") != null) { // 이전, 다음 버튼을 통해 들어왔다면 값 적용
      currentPage = Integer.parseInt(request.getParameter("currentPage"));
   }
   int rowPerPage = 10; // 한 페이지당 표시할 ActorInfo 수
   int beginRow = (currentPage - 1) * rowPerPage; // 페이지마다 시작 actorInfo 번호
   int lastPage = 0; // 마지막 페이지
   
   ActorInfoDao actorInfoDao = new ActorInfoDao();
   int totalCount = actorInfoDao.selectActorInfoTotalRow(); // 전체 행의 수
   lastPage = (int)(Math.ceil((double)totalCount / (double)rowPerPage)); // lastPage 값 대입
   
   // ActorInfo 목록에 beginRow, rowPerPage 값 입력
   List<ActorInfo> list = actorInfoDao.selectActorInfoListByPage(beginRow, rowPerPage);
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>ActorInfoList</title>
</head>
<body>
   <jsp:include page="/inc/upMenu.jsp"></jsp:include>
   <div class="jumbotron">
      <h1>배우별 영화 출연 목록</h1>
   </div>
   <div class="container-fluid">
      <div style="float:right">
         <form>
            <table>
               <tr>
                  <th>배우 이름</th>
                  <td>
                     <input type="text" name="actorName" class="form-control">
                  </td>
                  <td>
                     <button type="submit" style="background: #00004B; color: #FFFFFF;" class="btn">검색</button>
                  </td>
               </tr>
            </table>
         </form>
      </div><br><br>
      <!-- actor_info 리스트 -->
      <table class="table">
         <thead class="text-center text-light" style="background: #00004B;">
            <tr>
               <th>No</th>
               <th>이름</th>
               <th>출연 정보</th>
            </tr>
         </thead>
         <%
         for(ActorInfo a : list) {
      %>
         <tbody class="text-center">
            <tr>
               <td><%=a.getActorId()%></td>
               <td><%=a.getFirstName()%></td>
               <td><%=a.getFilmInfo()%></td>
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
      <a
         href="<%=request.getContextPath()%>/view/actorInfoList.jsp?currentPage=<%=currentPage-1%>"
         class="btn" style="background: #00004B; color: #FFFFFF;">이전</a>
      <%
         }
      // currentPage가 lastPage보다 작으면 다음이 보이도록 하고, 다음을 누르면 currentPage에서 +1값을 보냄
         if(currentPage < lastPage) {
      %>
      <a
         href="<%=request.getContextPath()%>/view/actorInfoList.jsp?currentPage=<%=currentPage+1%>"
         class="btn" style="background: #00004B; color: #FFFFFF;">다음</a>
      <%
         }
      %>
   </div>
   <jsp:include page="/inc/footer.jsp"></jsp:include>
</body>
</html>