<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
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
int num=Integer.parseInt(request.getParameter("num"));
// BoardDAO 객체생성
BoardDAO boardDAO=new BoardDAO();
// getBoard()
BoardDTO boardDTO=boardDAO.getBoard(num);
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
<h1>Notice Update</h1>
<form action="fUpdatePro.jsp" method="post">
<input type="hidden" name="num" value="<%=boardDTO.getNum()%>">
<table id="notice">
<tr><td>글쓴이</td>
    <td><input type="text" name="name" value="<%=id %>" readonly></td></tr>
<tr><td>제목</td>
    <td><input type="text" name="subject" value="<%=boardDTO.getSubject()%>"></td></tr>
<tr><td>내용</td>
    <td><textarea name="content" rows="10" cols="20"><%=boardDTO.getContent() %></textarea></td></tr>
</table>
<div id="table_search">
<input type="submit" value="글수정" class="btn" >
<input type="button" value="글목록" class="btn" 
  onclick="location.href='gMovieAc.jsp'">
</div>
</form>
</body>
</html>