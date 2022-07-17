<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style2.css">
</head>
<jsp:include page="../inc/Top.jsp"></jsp:include>
<body>
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
<article>
<h1>Notice Update</h1>
<form action="UpdatePro.jsp" method="post">
<input type="hidden" name="num" value="<%=boardDTO.getNum()%>">
<table class="table">
<tr><td>글쓴이</td>
    <td><input type="text" name="name" value="<%=id %>" readonly></td></tr>
<tr><td>제목</td>
    <td><input type="text" name="subject" value="<%=boardDTO.getSubject()%>"></td></tr>
<tr><td>내용</td>
    <td><textarea name="content" rows="20" cols="80"><%=boardDTO.getContent() %></textarea></th></tr>
<tr><td></td>
	<td><input type="submit" value="글수정" class="btn btn-outline-primary"  >
	<input type="button" value="글목록" class="btn btn-outline-primary" 
  onclick="location.href='MovieAc.jsp'"></td>
	<td></td></tr>
</table>
</form>
</body>
</html>