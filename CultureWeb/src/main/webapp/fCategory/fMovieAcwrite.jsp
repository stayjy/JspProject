<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style2.css">
</head>
<body>
<jsp:include page="../inc/Top.jsp"></jsp:include>
<%
String id=(String)session.getAttribute("id");
//세션값이 없으면 login.jsp 이동
if(id==null){
	
	response.sendRedirect("../member/Login.jsp");
}
%>
<div id="sub_menu">
<ul class="nav flex-column" >
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="../Category/MovieAc.jsp">게시판</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="../fCategory/fMovieAc.jsp">자료실</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="../gCategory/gMovieAc.jsp">갤러리</a>
  </li>


</ul>
</div>

<article>
<h2> 게시글 쓰기</h2>
<form action="fMovieAcwritePro.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="pass" value="1234">
<table class="table">
<tr><td>글쓴이</td><td><input type="text" name="name" value="<%=id %>" readonly></td></tr>
<tr><td>제목</td><td><input type="text" name="subject"></td></tr>
<tr><td>파일</td><td><input type="file" name="file"></td></tr>
<tr><td>내용</td><td><textarea name="content" rows="20" cols="80"></textarea></td></tr>
<tr><td></td>
	<td><input type="submit" value="글쓰기" class="btn btn-outline-primary">
<input type="button" value="글목록" class="btn btn-outline-primary" 
  onclick="location.href='fMovieAc.jsp'"></td>
</table>
</form>
</article>

</body>
</html>