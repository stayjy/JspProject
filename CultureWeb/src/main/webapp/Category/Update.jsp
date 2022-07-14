<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
  onclick="location.href='MovieAc.jsp'">
</div>
</form>
</body>
</html>