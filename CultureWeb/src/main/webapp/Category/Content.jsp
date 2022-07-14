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
//int num파라미터 가져오기
int num=Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
// BoardDAO 객체생성
BoardDAO boardDAO=new BoardDAO();
/* BoardDAO bodao = new BoardDAO(); */
// 글의 조회수 정보를 1증가하는 메서드 호출
boardDAO.updateReadCount(num);
//BoardDTO boardDTO = getBoard(num)메서드 호출
BoardDTO boardDTO=boardDAO.getBoard(num);

%>
<article>
<h1>Notice Content</h1>
<table id="notice">
<tr><td>글번호</td><td><%=boardDTO.getNum() %></td>
    <td>글쓴날짜</td><td><%=boardDTO.getDate() %></td></tr>
<tr><td>글쓴이</td><td><%=boardDTO.getName() %></td>
    <td>조회수</td><td><%=boardDTO.getReadcount() %></td></tr>
<tr><td>제목</td><td colspan="3"><%=boardDTO.getSubject() %></td></tr>
<tr><td>내용</td><td colspan="3"><%=boardDTO.getContent() %></td></tr>
</table>
<div id="table_search">
<%
//글수정 글삭제 => 로그인(세션값), 글쓴이 일치하면 글수정, 글삭제 버튼이 보이기
String id=(String)session.getAttribute("id");
if(id!=null){
	if(id.equals(boardDTO.getName())){
		%>
		<input type="button" value="글수정" class="btn" 
  		onclick="location.href='Update.jsp?num=<%=boardDTO.getNum()%>'">

		<input type="button" value="글삭제" class="btn" 
  		onclick="location.href='Delete.jsp?num=<%=boardDTO.getNum()%>'">
		<%
	}
}
%>
<input type="button" value="글목록" class="btn" 
  onclick="location.href='notice.jsp?pageNum=<%=pageNum%>'">
</div>
<div class="clear"></div>
<div id="page_control">
</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
</body>
</html>