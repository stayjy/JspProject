<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#sub_menu {
float: left;
padding: 20px 20px 50px 0;
margin-top: 10%;
}

#sub_menu .nav-item {
font-weight: bold;
; }

article{
float: right; width: 90%;

padding-top: 20px;
padding-right: 10px;
font-family: Verdana,Geneva,sans-serif;
font-size: 1em;line-height: 1.5em}

table {
margin: auto;
}
.table_bar {
background-color: #6495ED ;
}

article td {
border-top-left-radius:5px;
border-top-right-radius:5px;
border-bottom-right-radius:5px;
border-bottom-left-radius:5px;
/* border-bottom-left-radius:5px;
width:50px; */}

article th.ttitle {
width: 300px;}

article th.twrite {
width: 50px;}

article th.tdate {
width: 50px;}

article th.tread {
border-top-right-radius:5px;
border-bottom-right-radius:5px;
width: 50px;}
 
#table_search>input {
 margin-top: 3px;}



</style>
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
<h2 style="text-align: center;"> 게시글 쓰기</h2>
<form action="gMovieAcwritePro.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="pass" value="1234">
<table id="table">
<thead class="table_bar">
<tr><td>글쓴이</td><td><input type="text" name="name" value="<%=id %>" readonly></td></tr>
<tr><td>제목</td><td><input type="text" name="subject"></td></tr>
<tr><td>파일</td><td><input type="file" name="file"></td></tr>
<tr><td>내용</td><td><textarea name="content" rows="20" cols="40"></textarea></td></tr>
</thead>
</table>
<section>
<div id="table_search">
<input type="submit" value="글쓰기" class="btn btn-outline-primary" style="position: absolute; left: 60%;">
<input type="button" value="글목록" class="btn btn-outline-primary" style="position: absolute; left: 66%;"
  onclick="location.href='gMovieAc.jsp'">
</div>
</section>
</form>
</article>

</body>
</html>