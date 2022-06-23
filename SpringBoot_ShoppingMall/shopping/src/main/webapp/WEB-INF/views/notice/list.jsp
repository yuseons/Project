<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions" %>
 
<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
   <script type="text/javascript">
     function read(noticeno){
       var url = "read";
       url += "?noticeno="+noticeno;
       url += "&col=${col}"; //col,word,nowPage를 가져옴 : 목록페이지를 유지하려고
       url += "&word=${word}";
       url += "&nowPage=${nowPage}";
       location.href=url;
 
     }  
  </script>
 
</head>
<body>
<div class="container">
 
   <h2>공지 사항</h2>
  <form class="form-inline" action="./list">
    <div class="form-group">
      <select class="form-control" name="col">
        <option value="wname"
        <c:if test= "${col=='wname'}"> selected </c:if>
        >성명</option>
        <option value="title"
        <c:if test= "${col=='title'}"> selected </c:if>
        >제목</option>
        <option value="content"
        <c:if test= "${col=='content'}"> selected </c:if>
        >내용</option>
        <option value="title_content"
        <c:if test= "${col=='title_content'}"> selected</c:if>
        >제목+내용</option>
        <option value="total"
        <c:if test= "${col=='total'}"> selected </c:if>
        >전체출력</option>       
     </select>
    </div>
    <div class="form-group">
      <input type="text" class="form-control" placeholder="Enter 검색어" 
      name="word" value="${word}">
    </div>
    
    <button type="submit" class="btn btn-default" >검색</button>

       <c:if test="${sessionScope.grade == 'A' }">  <!-- 관리자만 볼 수 있게 설정 -->
    <button type="button" class="btn btn-default" onclick="location.href='/admin/notice/create'">등록</button>
    </c:if>
  </form>
  
  <table class="table table-striped">
   <thead>
    <tr>
    <th>번호</th>
    <th>제목</th>
    <th>작성자</th>
    <th>등록날짜</th>
    <th>조회수</th>
    </tr>
   </thead>
   <tbody>
 
<c:choose>   
<c:when test="${empty list}">
   <tr><td colspan="6">등록된 글이 없습니다.</td>
</c:when>
<c:otherwise>
  
   <c:forEach var="dto" items="${list}"> 
   
   <tr>
    <td>${dto.noticeno}</td>
    <td>
    <a href="javascript:read('${dto.noticeno}')">${dto.title}</a>
 
 <%//sql에서 rdate의 타입을 datetime(시간까지 가져옴)로 설정해서 년.월.일만 가져오려고 substring으로 잘라냄
 	//년,월,일로 new이미지 뜨게 하려고%>
    <c:if test="${util:newImg(fn:substring(dto.rdate,0,10)) }">
         <img src="/images/new.gif"> 
    </c:if>
 
    </td>
    <td>${dto.wname}</td>
    <td>${dto.rdate}</td>
    <td>${dto.cnt}</td>
   </tr>
   </c:forEach>
   </c:otherwise>
   </c:choose>
 
   </tbody>
  
  </table>
  <div>
      ${paging}
  </div>
</div>
</body> 
</html> 