<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
<link rel="stylesheet" href="../css/style2.css">
<jsp:include page="../inc/Top.jsp"></jsp:include>
</head>
<body>

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
<h2> 글쓰기</h2>
<form action="MovieAcWritePro.jsp" method="post">
<input type="hidden" name="pass" value="1234">
<table class="table">

<tr><td>작성자</td><td><input type="text" name="name" value="<%=id %>" readonly></td></tr>
<tr><td>제목</td><td><input type="text" name="subject"></td></tr>
<tr><td>내용</td><td><textarea name="content" rows="20" cols="80"></textarea></td></tr>
<tr><td></td>
	<td><input type="submit" value="글쓰기" class="btn btn-outline-primary">
<input type="button" value="글목록" class="btn btn-outline-primary" 
  onclick="location.href='MovieAc.jsp'"></td>
</table>

<!-- <div id="table_search">
<input type="submit" value="글쓰기" class="btn btn-outline-primary" style="position: absolute; left: 60%;">
<input type="button" value="글목록" class="btn btn-outline-primary" style="position: absolute; left: 66%;"
  onclick="location.href='MovieAc.jsp'">
</div> -->

</form>
</article>



<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> -->
</body>
</html>