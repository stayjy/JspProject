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
<body>
<jsp:include page="../inc/Top.jsp"></jsp:include>
<!-- <nav id="sub_menu">
<ul>
<li><a href="#">Notice</a></li>
<li><a href="#">Public News</a></li>
<li><a href="#">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav> -->
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
//int num파라미터 가져오기
int num=Integer.parseInt(request.getParameter("num"));
String pageNum =request.getParameter("pageNum");
// BoardDAO 객체생성
BoardDAO boardDAO=new BoardDAO();

// 글의 조회수 정보를 1증가하는 메서드 호출
boardDAO.updateReadCount(num);
//BoardDTO boardDTO = getBoard(num)메서드 호출
BoardDTO boardDTO=boardDAO.getBoard(num);

%>

<article>
<h1>Notice Content</h1>
<table class="table">
<tr><td>글번호</td><td><%=boardDTO.getNum() %></td>
    <td>글쓴날짜</td><td><%=boardDTO.getDate() %></td></tr>
<tr><td>글쓴이</td><td><%=boardDTO.getName() %></td>
    <td>조회수</td><td><%=boardDTO.getReadcount() %></td></tr>
<tr><td>제목</td><td colspan="3"><%=boardDTO.getSubject() %></td></tr>
<tr><td>파일</td><td colspan="3">
<a href="../upload/<%=boardDTO.getFile() %>" download><%=boardDTO.getFile() %></a>
<img src="../upload/<%=boardDTO.getFile() %>" width="300" height="300">
</td></tr>
<tr><td>내용</td><td colspan="3"><%=boardDTO.getContent() %></td></tr>
</table>
<div id="table_search">
<%
//글수정 글삭제 => 로그인(세션값), 글쓴이 일치하면 글수정, 글삭제 버튼이 보이기
String id=(String)session.getAttribute("id");
if(id!=null){
	if(id.equals(boardDTO.getName())){
		%>
		<input type="button" value="글수정" class="btn btn-outline-primary"  
  		onclick="location.href='fUpdate.jsp?num=<%=boardDTO.getNum()%>'">

		<input type="button" value="글삭제" class="btn btn-outline-primary"  
  		onclick="location.href='Delete.jsp?num=<%=boardDTO.getNum()%>'">
		<%
	}
}
%>
<input type="button" value="글목록" class="btn btn-outline-primary" 
  onclick="location.href='fMovieAc.jsp'"></td>
  <td></td></tr>
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